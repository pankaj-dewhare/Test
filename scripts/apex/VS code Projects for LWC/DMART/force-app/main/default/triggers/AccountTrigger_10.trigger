//User Story 1] If Account Type is set to the “Prospect”, and If Account’s Opp Amount is less than 10000, then copy its Opp Name in ACCOUNT’S Description.
trigger AccountTrigger_10 on Account (before update) {
    map<id,Account> accMap = new map<Id,Account>();
    for(Account objAcc : trigger.new){
        if(objAcc.type != trigger.oldMap.get(objAcc.id).type){
            accMap.put(objAcc.Id,objAcc);
        }
    }
    list<Opportunity> oppList = new List<Opportunity>();
    if(!accMap.isEmpty()){
        for(Opportunity objOpp : [Select Id, AccountId, Amount, Name From Opportunity Where AccountId IN : accMap.keySet()]){
            oppList.add(objOpp);
        }
    }
    if(!oppList.isEmpty()){
        for(Opportunity objOpp : oppList){
            if(accMap.containsKey(objOpp.AccountId)){
                if(string.isBlank(accMap.get(objOpp.accountId).description)){
                    if(accMap.get(objOpp.AccountId).type == 'Prospect'){
                        if(objOpp.Amount < 10000){
                            accMap.get(objOpp.AccountId).description = objOpp.Name;
                        }
                    }
                }
                else{
                    accMap.get(objOpp.AccountId).description = accMap.get(objOpp.AccountId).description+ ' \n ' +objOpp.Name;
                }
            }
        }
    }
}