//User Story 2] Create a field “Count of Contacts” on Account Object. Show Total number of Contacts in the Count of Contacts field of respective Account.
trigger ContactTrigger_04 on Contact (after insert, after update, after delete, after undelete) {
    set<Id> accIdSet = new set<Id>();
    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate || trigger.isUndelete)){
    for(Contact objCon : trigger.new){
            accIdSet.add(objCon.AccountId);
        }
    }
    
        if(trigger.isAfter && (trigger.isUpdate || trigger.isdelete)){
            For(Contact objCon : trigger.old){
            accIdSet.add(objCon.AccountId);
        }
    }
    
    map<Id,Account> accMap = new map<Id,Account>();
    
    for(Account objAcc : [Select Id, count_of_contacts__c, (Select Id, name From Contacts) From Account Where ID IN : accIdSet]){
        List<Contact> conList = objAcc.contacts;
        objAcc.count_of_contacts__c = conList.size();
        accMap.put(objAcc.Id, objAcc);
    }
    if(!accmap.isEmpty()){
        database.update(accMap.values(),false);
    }
}