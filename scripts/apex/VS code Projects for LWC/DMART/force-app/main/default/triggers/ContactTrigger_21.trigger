//Create a New Contact for an Account. If Account already contains a Contact, then Prevent to create another new contact.
trigger ContactTrigger_21 on Contact (before insert, before update, after undelete) {
    set<Id> accIdSet = new set<Id>();
    for(Contact objCon : trigger.new){
        if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate) || (trigger.isAfter && trigger.isUndelete) ){
            accIdSet.add(objCon.AccountId);
        }
    }
    map<Id,Account> accMap = new map<Id,Account>();
    for(Account objAcc : [Select Id, Name, (Select Id From Contacts) From Account Where ID IN : accIdSet]){
        accMap.put(objAcc.id,objAcc);
    }
    for(Contact objCon : trigger.new){
        if(accMap.containskey(objCon.AccountID)){
            list<Contact> conList = accMap.get(objCon.AccountId).contacts;
            if(conList.size()>0){
                objCon.AddError('More than one contact is not allowed');
            }
            
        }
    }
}