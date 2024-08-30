// Update all the Account’s Rating to “Cold”, if SLA is Gold.
global class AccountBatchClass01 implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        string query =  'select Id, Name, Rating, SLA__c from Account where SLA__c = \'Gold\' and Rating!=\'Cold\' ';                      
        return database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, list<Account> accList){
        for(Account objAcc : accList){
            objAcc.rating = 'Cold';    
        }
        if(!accList.isEmpty()){
                database.update(accList, false);
             system.debug('list values='+accList);
            }
       
    }
    
    global void finish(Database.BatchableContext BC){
        
    }

}