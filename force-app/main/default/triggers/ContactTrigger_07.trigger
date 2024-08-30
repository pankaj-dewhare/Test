trigger ContactTrigger_07 on Contact (before insert, before update, after undelete) {
    set<Id> accIdSet = new set<Id>();
    For(Contact objCon : trigger.new){
        if(trigger.isBefore && trigger.isInsert || trigger.isAfter && trigger.isUndelete){
            if(objCon.AccountId != null){
                accIdSet.add(objCon.AccountId);
            }
        }
        if(trigger.isBefore && trigger.isUpdate){
            if(objCon.leadsource != trigger.oldMap.get(objCon.Id).leadsource){
                accIdSet.add(objCon.AccountId);
            }
        }
    }
    
    map<Id,Account> accMap = new map<Id,Account>();
    
    for(Account objAcc : [Select Id, Name, (Select Id, leadsource From Contacts) From Account Where ID IN : accIdSet]){
        accMap.put(objAcc.id, objAcc);
    }
    
    for(Contact objCon : trigger.new){
        if(accMap.containskey(objCon.AccountId)){
            list<Contact> conList = accMap.get(objCon.accountId).contacts;
            
            for(Contact objConExisting : conList){
                if(objCon.Leadsource == objConExisting.Leadsource){
                    objCon.AddError('Duplicate leadsource is not allowed');
                }
            }
        }
    }
}