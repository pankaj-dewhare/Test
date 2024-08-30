/*Create a New Contact for an Account. If Account already contains a Contact, then Prevent to create another new contact.*/
trigger ContactTrigger_12 on Contact (before insert, before update, after undelete) {
     set<Id>accIdSet = new set<Id>();
    for(Contact objCon : trigger.new){
        if(trigger.isInsert || trigger.isUndelete || trigger.isUpdate){
            accIdSet.add(objCon.AccountId);
        }
    }
    map<Id,Account> accMap = new map<Id,Account>();
    for(Account objAcc : [Select Id, (Select ID From Contacts) From Account Where ID IN : accIdSet]){
        accMap.put(objAcc.id,objAcc);
    }
    
    for(Contact objCon : trigger.new){
        if(accMap.containskey(objCon.AccountId)){
            list<Contact> conList = accMap.get(objCon.AccountId).contacts;
            if(conList.size()>0){
               objCon.AddError('This account is already contains a contact'); 
            }
        }
    }
}