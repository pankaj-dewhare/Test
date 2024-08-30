/*Create a field “Count of Contacts” on Account Object. Show Total number of Contacts in the Count of Contacts field of respective Account.*/
trigger ContactTriggerCountOfContact on Contact (after insert, after update, after delete, after undelete) {
set<Id> accIdSet = new set<Id>();
    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate || trigger.isUndelete)){
        for(Contact objCon : trigger.new){
            accIdSet.add(objCon.AccountId);
        }
    }
    if(trigger.isAfter && trigger.isUpdate || trigger.isDelete){
        for(Contact objCon : trigger.old){
            accIdSet.add(objCon.AccountId);
        }
    }
    
    map<Id,Account> accMap = new map<Id,Account>();
    for(Account objAcc : [Select Id, Count_of_Contacts__c,(Select ID From Contacts) From Account Where ID IN : accIdSet]){
        list<Contact> conList = objAcc.Contacts;
        objAcc.Count_of_contacts__c = conList.size();
        accMap.put(objAcc.ID, objAcc);
            
    }
    if(!accMap.isEmpty()){
        database.update(accMap.values(),false);
    }
}