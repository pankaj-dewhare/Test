/*User Story 2] Create / Edit the Contact. If It’s respective Account Rating is “Hot”, then Contact’s Level set to the “Primary”. 
If Rating is “Cold”, then Level set to the “Secondary”, If Rating is “Warm”, then Level = “Tertiary”. Else blank.*/
trigger ContactTrigger_03 on Contact (before insert, before update) {
    set<Id> accIdSet = new set<Id>();
    for(Contact objCon : trigger.new){
        if(trigger.isBefore && trigger.isInsert){
            if(objCon.AccountId != null){
                accIdSet.add(objCon.AccountId);
            }
        }
        if(trigger.isBefore && trigger.isUpdate){
            if(objCon.AccountId != trigger.oldMap.get(objCon.Id).AccountId){
                accIdSet.add(objCon.AccountId);
            }
        }
    }
    
    map<Id,Account> accMap = new map<Id,Account>();
    For(Account objAcc : [Select Id, Rating From Account Where ID IN : accIdSet]){
        accMap.put(objAcc.id, objAcc);
    }
    for(Contact objCon : trigger.new){
        if(accMap.containskey(objCon.AccountId)){
            if(accMap.get(objCon.AccountId).rating == 'Hot'){
                objCon.level__c = 'Primary';
            }
            else{
                if(accMap.get(objCon.AccountId).rating == 'Cold'){
                    objCon.level__c = 'Secondary';
                }
                else{
                    if(accMap.get(objCon.AccountId).rating == 'Warm'){
                        objCon.level__c = 'Tertiary';
                    }
                    else{
                        objCon.level__c = '';
                    }
                }
            }
        }
    }
}