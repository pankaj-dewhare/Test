//User Story 1] When Account’s Type is “Technology Partner”, then update all the Contact’s LeadSource as “Web” and Level should be “Primary”. Else none.

trigger AccountTrigger_28 on Account(after update){
    map<Id,Account> accMap = new map<Id,Account>();
    for(Account objAcc : trigger.new){
        if(objAcc.type != trigger.oldMap.get(objAcc.Id).type){
            accMap.put(objAcc.id,objAcc);
        }
    }
    list<Contact> conList = new list<Contact>();
    for(Contact objCon : [Select Id, LeadSource, level__c, AccountId From Contact Where AccountId IN : accMap.keySet()]){
        conList.add(objCon);
    }
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
        database.update(conList,false);
        
    }
}