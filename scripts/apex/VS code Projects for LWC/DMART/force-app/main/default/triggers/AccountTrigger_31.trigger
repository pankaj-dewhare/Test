trigger AccountTrigger_31 on Account (after update) {
    Map<Id,Account> accMap = New Map<Id,Account>();
    For(Account objAcc : trigger.new){
        
        if(objAcc.Type != trigger.oldMap.get(objAcc.id).Type){
            accMap.put(objAcc.id,objAcc);
        }
    }
     system.debug('Map Record='+accMap);
    list<Contact> conList = New List<Contact>();
    For(Contact objCon : [Select Id, AccountId, Leadsource, level__c From Contact Where AccountId IN : accMap.keySet()]){
        conList.add(objCon);
    }
    system.debug('List='+conList);
    for(Contact objCon : conList){
        if(accMap.containskey(objCon.AccountId)){
            if(accMap.get(objCon.AccountId).Type == 'Technology Partner'){
                objCon.Leadsource = 'Web';
                objCon.Level__c = 'Primary';
                
            }
            else{
                objCon.Leadsource = '';
                objCon.Level__c = '';
            }
        }
    }
    if(!conList.isEmpty()){
        Database.update(conList, false);
        
    }
    system.debug('Final Record='+conList);
}