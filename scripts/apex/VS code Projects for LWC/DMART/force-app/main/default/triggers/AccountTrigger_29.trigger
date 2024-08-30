/*User Story 1] If Account Type is set to the “Prospect”, and If Account’s Opp Amount is less than 10000, 
then copy its Opp Name in ACCOUNT’S Description.*/
trigger AccountTrigger_29 on Account (before update) {
    map<Id,Account> accMap = new map<Id,Account>();
    for(Account objAcc : trigger.new){
        if(objAcc.Type != trigger.oldMap.get(objAcc.id).Type){
            accMap.put(objAcc.id, objAcc);
        }
    } 
    list<Opportunity> oppList = new list<Opportunity>();
    for(Opportunity objOpp : [Select Id, Amount, Name, AccountId From Opportunity Where AccountId IN : accMap.keySet()]){
        oppList.add(objOpp);
    }
    for(Opportunity objOpp : oppList){
        if(accMap.containskey(objOpp.AccountID)){
            if(accMap.get(objOpp.AccountId).Type == 'Prospect' && objOpp.Amount < 10000){
                if(string.isBlank(accMap.get(objOpp.AccountID).description)){
                accMap.get(objOpp.AccountID).description = objOpp.Name;
                 }
                else{
                     accMap.get(objOpp.AccountID).Description =  accMap.get(objOpp.AccountID).description+ '\n' +objOpp.Name;
                }
            }
        }
    }
}