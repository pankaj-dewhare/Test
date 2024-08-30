//Create / Edit the Contact. If It’s respective Account Rating is “Hot”, then Contact’s Level set to the “Primary”. Else keep blank.
trigger ContactTrigger_02 on Contact (before insert, before update) {
    set<Id> accIdSet = new set<Id>();
    For(Contact objCon : trigger.new){
        if(trigger.isBefore && trigger.isInsert){
            if(objCon.AccountId != null){
                accIdSet.add(objCOn.AccountId);
            }
        }
        system.debug('New record inserted'+trigger.new);
        if(trigger.isBefore && trigger.isUpdate){
            if(objCon.AccountId != trigger.oldMap.get(objCon.Id).AccountId){
                accIdSet.add(objCOn.AccountId);
            }
        }
        system.debug('Old record updated'+trigger.new);
       
    }
    map<Id,Account> accMap = new map<Id,Account>();
    for(Account objAcc : [Select Id, rating From Account Where ID IN : accIdSet]){
        accMap.put(objAcc.id, objAcc);
        system.debug('Record fetched & stored in map ='+accMap);
    }
    for(Contact objCon : trigger.new){
        if(accMap.containskey(objCon.AccountId)){
            if(accMap.get(objCon.AccountId).rating == 'Hot'){
                objCon.Level__c = 'Primary'; 
            }
            else{
                objCon.Level__c = ''; 
            }
        }
        system.debug('Final data ='+trigger.new);
    }
}