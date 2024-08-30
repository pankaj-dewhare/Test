//User story : User Story 1] Create / Edit the Contact. If It’s respective Account Rating is “Hot”, then Contact’s Level set to the “Primary”. Else keep blank.
trigger ContactTriggerChild2ParentSelf on Contact (before insert, before update) {
    set<Id> accIdSet = new set<Id>();
    for(Contact objCon : trigger.new){
        if(trigger.isInsert && trigger.isBefore){
            if(objCon.AccountId != null){
                accIdSet.add(objCon.AccountId);
            }
        }
        if(trigger.isUpdate && trigger.isBefore){
            if(objCon.AccountId != trigger.oldMap.get(objCon.id).AccountId){
                accIdSet.add(objCon.AccountId);
            }
        }
    }
    
    Map<Id,Account> accMap = new map<Id,Account>();
    if(!accIdSet.isEmpty()){
        for(Account objAcc : [Select id, Name, Rating From Account Where ID IN : accIdSet]){
            accMap.put(objAcc.id, objAcc);
        }
    }
    if(!accMap.isEmpty()){
        For(Contact objCon : trigger.new){
            if(accMap.containskey(objCon.AccountId)){
                if(accMap.get(objCon.AccountId).rating == 'Hot'){
                    objCon.level__c = 'Primary';
                }
                else{
                    objCon.level__c = '';
                }
            }
        }
    }
}