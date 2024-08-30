/*] If Account Type is set to the “Prospect”, and If Account’s Opp Amount is less than 10000, then copy its Opp Name in ACCOUNT’S Description.*/
trigger AccountTrigger_15 on Account (before insert, before update, after undelete) {
    map<Id,Account> accMap = new map<Id,Account>();
    For(Account objAcc : trigger.new){
        if((trigger.isBefore && trigger.isInsert) || (trigger.isAfter && trigger.isUndelete)){
            if(!string.isBlank(objAcc.type)){
                accMap.put(objAcc.Id, objAcc);
            }
        }
        if(trigger.isBefore && trigger.isUpdate){
            if(objAcc.type != trigger.oldMap.get(objAcc.id).type){
                accMap.put(objAcc.id,objAcc);
            }
        }
    }
    list<Opportunity> oppList = new list<Opportunity>();
    if(!accMap.isEmpty()){
    for(Opportunity objOpp : [Select Id, Amount, Name, AccountId From Opportunity Where AccountID IN : accMap.keyset()]){
        oppList.add(objOpp);
        }
    }
    if(!oppList.isEmpty()){
        for(Opportunity objOpp : oppList){
            if(accMap.containskey(objOpp.AccountId)){
                if(accMap.get(objOpp.AccountId).type == 'Prospect' && objOpp.Amount < 10000){
                    if(!string.isBlank(accMap.get(objOpp.AccountId).description)){
                    accMap.get(objOpp.AccountId).description = objOpp.Name;
                    
                    }
                    else{
                        accMap.get(objOpp.AccountId).description = accMap.get(objOpp.AccountId).description+ '' +objOpp.Name;
                    }
                }
            }
        }
    }
}