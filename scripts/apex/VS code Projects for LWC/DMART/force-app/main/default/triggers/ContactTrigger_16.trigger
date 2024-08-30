//Create/Edit Contacts. And show Latest Contact Name on Account Description field.
trigger ContactTrigger_16 on Contact (after insert, after update) {
    set<Id> accIdSet = new set<Id>();
    for(Contact objCon : trigger.new){
       accIdSet.add(objCon.AccountId);
        
        system.debug('set value='+accidSet);
    }
    map<Id,Account> accMap = new map<Id,Account>();
    for(Account objAcc : [Select id, Description From Account Where ID IN : accIdSet]){
        accMap.put(objAcc.id,objAcc);
    }
    for(Contact objCon : trigger.new){
        if(accMap.containskey(objCon.AccountId)){
            if(string.isBlank(accMap.get(objCon.AccountId).description)){
                accMap.get(objCon.AccountId).description = objCon.FirstName+ '' +objCon.LastName;
            }
            else{
                accMap.get(objCon.AccountId).description = accMap.get(objCon.AccountId).description+ '\n' +objCon.FirstName+ '' +objCon.LastName;
            }
        }
    }
    if(!accMap.isEmpty()){
        database.update(accMap.values(),false); 
    }
}