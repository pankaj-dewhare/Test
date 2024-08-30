//User Story 1] Create / Edit the Contact. If It’s respective Account Rating is “Hot”, then Contact’s Level set to the “Primary”. Else keep blank.
trigger ContactTrigger_18 on Contact (before insert, before update) {
    set<Id> accIdSet = new set<Id>();
    for(Contact objCon : trigger.new){ // new records came in trigger.new
        if(trigger.isInsert && trigger.isBefore){
            if(objCon.AccountId != null){
                
            }
        }
        if(trigger.isUpdate && trigger.isBefore){
            if(objCon.AccountId != trigger.oldMap.get(objCon.id).AccountId){
                accIdSet.add(objCon.AccountId);
            }
        }
    }
    map<Id,Account> accMap = new map<Id,Account>();
    For(Account objAcc : [Select Id, Rating From Account Where ID IN : accIdSet]){
        accMap.put(objAcc.id,objAcc);
    }
    for(Contact objCon : trigger.new){
        if(accMap.containskey(objCon.AccountId)){
            if(accMap.get(objCon.accountId).rating == 'Hot'){
                objCon.level__c = 'Primary';
            }
            else{
                objCon.level__c = '';
            }
        }
    }
}