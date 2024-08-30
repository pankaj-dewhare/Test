/*User Story 2] Create a field “Count of Contacts” on Account Object. 
Show Total number of Contacts in the Count of Contacts field of respective Account.*/
trigger ContactTrigger_08 on Contact (after insert, after update, after delete, after undelete) {

    set<Id> accIdSet = new set<Id>();
    if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
    for(Contact objCon : trigger.new){
        accIdSet.add(objCon.AccountId);
        }
    }
    if(trigger.isDelete || trigger.isUpdate){
    for(Contact objCon : trigger.old){
        accIdSet.add(objCon.AccountID);
       }
    }
    map<Id,Account> accMap = new Map<Id,Account>();
    if(!accIdSet.isEmpty()){
    for(Account objAcc : [Select ID, Count_of_contacts__c, (Select Id From Contacts) From Account Where ID IN : accIdSet]){
        list<Contact> conList = objAcc.Contacts;
        objAcc.Count_of_contacts__c = conList.size();
        accMap.put(objAcc.id, objAcc);
       } 
    }
    if(!accMap.isEmpty()){
    database.update(accMap.values(),false);
    }
}