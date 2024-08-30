trigger ContactTriggerCountOfContacts on Contact (after insert, after update, after delete, after undelete ) {
    set<id> accIdSet = new set<Id>();
    if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
        for(Contact objCon : trigger.new){
            accIdSet.add(objCon.AccountId);
        }
    }
    if(trigger.isUpdate || trigger.isDelete){
        for(Contact objCon : trigger.old){
            accIdSet.add(objCon.AccountId);
        }
    }
    
    map<Id,Account> accMap = new map<Id,Account>();
    for(Account objAcc : [Select Id, count_of_contacts__c, (select id From Contacts) From Account Where ID IN : accIdSet]){
        list<Contact> conList = objAcc.contacts;
        objAcc.count_of_contacts__c = conList.size();
        accMap.put(objAcc.id, objAcc);
    }
    if(!accMap.isEmpty()){
        database.update(accMap.values(),false);
    }
       }