trigger ContactTrigger_24 on Contact (after insert, after update, after delete, after undelete) {
    set<Id> accIdSet = new set<Id>();
    if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
        for(Contact objCon : trigger.new){
            accIdSet.add(objCon.AccountId);
        }
    }
    if(trigger.isUpdate || trigger.isDelete){
        For(Contact objCon : trigger.old){
            accIdSet.add(objCon.AccountId);
        }
    }
    Map<Id,Account> accMap = New Map<Id,Account>();
    For(Account objAcc : [Select Id, Name, Count_of_contacts__c,(Select Id From Contacts) From Account Where Id IN : accIdSet]){
        list<Contact> conList = objAcc.Contacts;
        objAcc.Count_of_contacts__c = conList.size();
        accMap.put(objAcc.id, objAcc);
    }
    
    if(!accMap.isEmpty()){
        database.update(accMap.values(), false);
    }
}