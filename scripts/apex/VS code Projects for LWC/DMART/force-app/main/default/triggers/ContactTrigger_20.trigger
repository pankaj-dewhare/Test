//Count of contact trigger
trigger ContactTrigger_20 on Contact (after insert, after update, after delete, after undelete) {
    set<Id> accIdSet = new set<Id>();
    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate || trigger.isUndelete)){
        for(Contact objCon : trigger.new){
            accIdSet.add(objCon.AccountId);
        }
    }
    if(trigger.isAfter && (trigger.isDelete || trigger.isUpdate)){
        for(Contact objCon : trigger.old){
            accIdSet.add(objCon.AccountId);
        }
    }  
    map<Id,Account> accMap = new map<Id,Account>();
    if(!accIdSet.isEmpty()){
    for(Account objAcc : [Select Id,Name,Count_of_contacts__c, (Select Id From Contacts) From Account where Id IN : accIdSet]){
        list<Contact> conList = objAcc.contacts;
        objAcc.Count_of_contacts__c = conList.size();
        accMap.put(objAcc.id,objAcc);
        }
    }
    if(!accMap.isEmpty()){
        database.update(accMap.values(),false);
    }
}