/*When Account’s Type is “Technology Partner”, then update all the Contact’s LeadSource as “Web” and Level should be “Primary”. Else none.*/
trigger AccountTrigger_14 on Account (after update) {
map<Id,Account> accMap = new map<Id,Account>();
    for(Account objAcc : trigger.new){
        if(objAcc.type != trigger.oldMap.get(objAcc.id).type){
            accMap.put(objAcc.id,objAcc);
        }
    }
    list<Contact> conList = new list<Contact>();
    if(!accMap.isEmpty()){
    for(Contact objCon : [Select Id, LeadSource, level__c, AccountId From Contact Where AccountID IN : accMap.keySet()]){
        conList.add(objCon);
       }
    }
    if(!conList.isEmpty()){
        for(Contact objCon : conList){
            if(accMap.containskey(objCon.AccountId)){
                if(accMap.get(objCon.AccountId).type == 'Technology partner'){
                    objCon.LeadSource = 'Web';
                    objCOn.Level__c = 'Primary';
                }
                else{
                    objCon.LeadSource = '';
                    objCOn.Level__c = '';
                }
            }
        }
        database.update(conlist,false);
    }
}