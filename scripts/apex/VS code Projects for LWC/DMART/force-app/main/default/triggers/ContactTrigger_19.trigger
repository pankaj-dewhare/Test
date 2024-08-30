/*User Story 2] Create / Edit the Contact. If It’s respective Account Rating is “Hot”, then 
Contact’s Level set to the “Primary”. If Rating is “Cold”, then Level set to the “Secondary”, 
If Rating is “Warm”, then Level = “Tertiary”. Else blank.*/
trigger ContactTrigger_19 on Contact (before insert, before update) {
    
    Set<Id> accIdSet = new Set<Id>();
    for(Contact objCon : trigger.new){
        if(objCon.AccountId != null){
            accIdSet.add(objCon.AccountId);
        }
    }
    map<Id,Account> accMap = new map<Id,Account>();
    For(Account objAcc : [Select Id, rating from Account Where ID IN : accIdSet]){
        accMap.put(objAcc.Id,objAcc);
    }
    For(Contact objCon : trigger.new){
        if(accMap.containskey(objCon.AccountId)){
            if(accMap.get(objCon.AccountId).rating == 'Hot'){
                objCon.level__c = 'Primary';
            }
            else{
                if(accMap.get(objCon.AccountId).rating == 'Warm'){
                    objCon.level__c = 'Secondary';
                }
                else{
                    if(accMap.get(objCon.AccountId).rating == 'Cold'){
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