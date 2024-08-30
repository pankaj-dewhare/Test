//User Story 1] Create / Edit the Contact. If It’s respective Account Rating is “Hot”, then Contact’s Level set to the “Primary”. Else keep blank.
trigger ContactTrigger_PracticeToAllContact on Contact (before insert, before update) {
    set<Id> accIdSet = new set<Id>();
        For(Contact objCon : trigger.new){
            if(objCon.AccountId != null){
                accIdSet.add(objCon.AccountId);
            }
        }
        Map<Id,Account> accMap = New Map<Id,Account>();
        For(Account ObjAcc : [Select Id, Name, Rating From Account Where Id IN : accIdSet]){
            accMap.put(objAcc.Id,ObjAcc);
        }
        
        For(Contact objCon : trigger.new){
            if(accMap.containskey(objCon.AccountId)){
                if(accMap.get(objCon.AccountId).Rating == 'Hot'){
                    objCon.level__c = 'Primary';
                }
                else{
                    objCon.level__c = '';
                }
            }
        }
    }