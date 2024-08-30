//Prevent Duplicate Contacts of LeadSource for an Account.
trigger ContactTriggerPracticeC2Pself01 on Contact (before insert, before update, after undelete) {
    set<Id> accIdSet = new set<Id>();
    For(Contact objCon : trigger.new){
        if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
            accIdSet.add(objCon.AccountId);
        }
    }
    
    map<Id,Account> accMap = new map<Id,Account>();
    if(!accIdSet.isEmpty()){
        For(Account objAcc : [Select Id, Name, (Select Id, Leadsource From Contacts) From Account Where ID IN : accIdSet]){
            accMap.put(objAcc.id, objAcc);
        }
    }
    for(Contact objCon : trigger.new){
        if(accMap.containskey(objCon.AccountId)){
            List<Contact> conList = accMap.get(objCon.AccountId).Contacts;
            
            for(Contact objConExisting : conList){
                if(objCon.leadSource == objConExisting.leadsource){
                    objCon.AddError('Found Duplicate contacts leadsource....!');
                }
            }
        }
    }
}