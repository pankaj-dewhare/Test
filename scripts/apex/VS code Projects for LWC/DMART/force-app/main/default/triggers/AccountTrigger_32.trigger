trigger AccountTrigger_32 on Account (before update) {
    Map<Id,Account> accMap = New Map<Id,Account>();
    For(Account objAcc : trigger.new){
        if(string.isNotBlank(objAcc.Type) && objAcc.Type != trigger.oldMap.get(objAcc.id).Type){
            accMap.put(objAcc.Id,objAcc);
        }
    }
    list<Opportunity> conList = New List<Opportunity>();
    For(Opportunity objOpp : [Select Id, Name, AccountId, Amount From Opportunity Where AccountId IN : accMap.keyset()]){
        conList.add(objOpp);
    }
    For(Opportunity objOpp : conList){
        if(accMap.containskey(objOpp.AccountId)){
            if(accMap.get(objOpp.AccountId).Type == 'Prospect' && objOpp.Amount < 10000){
                if(string.isBlank(accMap.get(objOpp.AccountId).description)){
                    accMap.get(objOpp.AccountId).description = objOpp.Name;
                }
                else{
                    accMap.get(objOpp.AccountId).description = accMap.get(objOpp.AccountId).description+'\n'+objOpp.Name;
                 }
            }
        }
    }
}