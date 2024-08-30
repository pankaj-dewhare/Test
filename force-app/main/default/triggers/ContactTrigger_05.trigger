// Create a New Contact for an Account. If Account already contains a Contact, then Prevent to create another new contact.
trigger ContactTrigger_05 on Contact (before insert, before update, after undelete) {
    set<Id> accIdSet = new set<Id>();
    if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
        for(Contact objCon : trigger.new){
            accIdSet.add(objCon.AccountId);
            
        }
    }
    map<Id,account> accMap = new map<Id,account>();
    
    for(Account objAcc : [Select Id, Name, (Select Id From Contacts) From Account Where ID IN : accIdSet]){
        accMap.put(objAcc.Id, objAcc);
        
    }
    for(Contact objCon : trigger.new){
        if(accMap.containsKey(objCon.AccountId)){
            list<Contact> conList = accMap.get(objCon.AccountId).contacts;
            if(conList.size()>0){
                objCon.AddError('this account alreay contains a contact');  
            }
        }
    }
    if(!accMap.isEmpty()){
        database.update(accMap.values(), false);
    }       
}