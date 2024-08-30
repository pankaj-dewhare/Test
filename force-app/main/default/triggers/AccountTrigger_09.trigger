// User Story 1] When Account’s Type is “Technology Partner”, then update all the Contact’s LeadSource as “Web” and Level should be “Primary”. Else none.
trigger AccountTrigger_09 on Account (after update) {
    Map<Id,Account> accMap = new map<Id, Account>();
    for(Account objAcc : trigger.new){
        if(!string.isBlank(objAcc.Type) && objAcc.type != trigger.oldMap.get(objAcc.id).type){
            accMap.put(objAcc.id,objAcc);
        }
    }
    
    list<Contact> conList = new list<Contact>();
    if(!accMap.isEmpty()){
        For(Contact objCon : [Select Id, AccountID, LeadSource, level__c From Contact Where AccountId IN : accMap.keySet()]){
            conList.add(objCon);
        }
    }
    if(!conList.isEmpty()){
        For(Contact objCon : conList){
            if(accMap.containskey(objCon.AccountId)){
                if(accMap.get(objCon.AccountId).type == 'Technology Partner'){
                    objCon.leadsource = 'Web';
                    objCon.level__c = 'Primary';
                }
                else{
                    objCon.leadsource = '';
                    objCon.level__c = '';
                }
                
            }
        }
        database.update(conList, false);
    }
}