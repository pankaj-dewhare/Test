// User Story 1] If Account Type is set to the “Prospect”, and If Account’s Opp Amount is less than 10000, then copy its Opp Name in ACCOUNT’S Description.
trigger AccountTriggerParent2Child on Account (before update) {
    Map<Id,Account> accMap = New Map<Id,Account>();
    For(Account objAcc : trigger.new){
        if(objAcc.type != trigger.oldMap.get(objAcc.id).type){
            accMap.put(objAcc.id,objAcc);
            system.debug('New record'+accMap);
        }
    }
    list<Opportunity> oppList = new list<opportunity>();
    if(!accMap.IsEmpty()){
        For(Opportunity objOpp : [Select Id, Amount, AccountId, Name From Opportunity Where AccountId IN : accMap.keyset()]){
            oppList.add(objOpp);
            system.debug('record comes in a list='+oppList);
        }
    }
    
    for(Opportunity objOpp : oppList){
        if(accMap.containskey(objOpp.AccountId)){
            if(accMap.get(objOpp.AccountID).type == 'Prospect' && objOpp.Amount < 10000){ 
                    if(string.isBlank(accMap.get(objOpp.AccountID).Description)){
                        accMap.get(objOpp.AccountId).description = objOpp.name;
                        system.debug('Description Record ='+ accMap.get(objOpp.AccountId).description);
                    }
                    else{
                        accMap.get(objOpp.AccountId).description = accMap.get(objOpp.AccountId).description+ '\n' +objOpp.Name;
                        system.debug('else Description Record ='+ accMap.get(objOpp.AccountId).description);
                    }
            }
        }
        system.debug('Final Record data'+oppList);
        
    }
}