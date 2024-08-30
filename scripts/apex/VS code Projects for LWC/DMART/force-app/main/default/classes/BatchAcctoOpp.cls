/*Update Account Rating to Hot only if Type is “Prospect”. 
Update All the related Opps Stage to “Closed Won”, only if Account rating is “Hot” or “Warm”.*/

global class BatchAcctoOpp implements Database.Batchable<sObject>{

    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('Select Id, Type, rating From Account Where Type = \'Prospect\' and Rating != \'Hot\'');
    }
    global void execute(Database.BatchableContext BC, list<Account> accList){
        if(!accList.isEmpty()){
            for(Account objAcc : accList){
                objAcc.rating = 'Hot';
            }
            Update accList;
        }
    }
    global void finish(Database.BatchableContext BC){
        Database.ExecuteBatch(New BatchOppToAcc());
    }
}