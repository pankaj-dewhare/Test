//Prevent Duplicate Contacts of LeadSource for an Account. child to parent traverse self
trigger ContactTrigger_13 on Contact (before insert, before update, after undelete) {
    set<Id> accIdSet = new set<Id>();
     if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
    For(Contact objCon : trigger.new){
            accIdSet.add(objCon.AccountId);
        }
    }
    map<Id,Account> accMap = new map<Id,Account>();
    for(Account objAcc : [Select Id, (Select Id, Leadsource From Contacts) From Account Where ID IN : accIdSet]){
        accMap.put(objAcc.id, objAcc);
    }
    for(Contact objCon : trigger.new){
        if(accMap.containskey(objCon.AccountId)){
            list<Contact> conList = accMap.get(objCon.AccountId).contacts;
            
            for(Contact objConExisting : conList){
                if(objCon.Leadsource == objConExisting.Leadsource){
                    objCon.AddError('THe same leadsource for an contact is not allowed for an account');
                }
            }
        }
    }
}