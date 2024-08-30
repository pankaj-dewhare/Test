// ] Create/Edit Contacts. And show Latest Contact Name on Account Description field.
trigger ContactTrigger_01 on Contact (after insert, after update) {
    set<Id> accIdSet = new set<Id>();
    For(Contact objCon : trigger.new){
        
        if(trigger.isAfter && trigger.isInsert){
            accIdSet.add(objCon.AccountId);
        }
        if(trigger.isAfter && trigger.isUpdate){
            if(objCon.AccountId != trigger.oldMap.get(objCon.Id).AccountId){
                accIdSet.add(objCon.AccountId);
            }
        }   
        system.debug('New record coming ='+ trigger.new);
    }
    
    map<Id,Account> accMap = new map<Id,Account>();
    list<Account> accList = [Select Id, Name, Description From Account Where Id IN : accIdSet];
    For(Account objAcc : accList){
        accMap.put(objAcc.id, objAcc);
        system.debug('Data comes in map ='+accMap);
        
    }
    For(Contact objCon : trigger.new){
        if(accMap.containskey(objCon.AccountId)){
            if(string.isBlank(accMap.get(objCon.AccountId).description)){
                accMap.get(objCon.accountId).description = objCon.FirstName+ ' ' +objCon.LastName;
                system.debug('New data coming ='+trigger.new);
            }else{
                 accMap.get(objCon.accountId).description = accMap.get(objCon.accountId).description+ '\n' +objCon.FirstName+ ' ' +objCon.LastName;
            }
        }
    }
    
    if(!accMap.isEmpty()){
        database.update(accMap.values(),false);
        system.debug('Final values ='+accMap.values());
    }
}