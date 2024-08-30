public class BatchApexDemoClass implements Database.Batchable<sObject>{

    public Database.QueryLocator Start(Database.BatchableContext BC){
        system.debug('I am in start method');
        return Database.getQueryLocator([Select Id, Name, Type, Rating, SLA__c From Account]);
    }
    
    public void execute(Database.BatchableContext BC, list<Account> accList){
        system.debug('Records ='+accList.size());
    }
    
    public void finish(Database.BatchableContext BC){
        system.debug('I am from finished method');
    }
}