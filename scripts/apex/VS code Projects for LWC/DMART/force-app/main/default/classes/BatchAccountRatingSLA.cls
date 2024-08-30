//User Story 1] Update all the Account’s Rating to “Cold”, if SLA is Gold.
global class BatchAccountRatingSLA implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        string query = 'Select Id, Name, Rating, SLA__c From Account Where Rating != \'Cold\' and SLA__C = \'Gold\' ';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Account> accList){
        if(!accList.isEmpty()){
            For(Account objAcc : accList){
                if(!string.isBlank(objAcc.SLA__c)){
                    if(objAcc.SLA__c == 'Gold'){
                        objAcc.Rating = 'Cold';
                        
                    }
                    
                }
            }
            database.update(accList, false);
        }
        
    }
    global void finish(Database.BatchableContext BC){
        
    }

}