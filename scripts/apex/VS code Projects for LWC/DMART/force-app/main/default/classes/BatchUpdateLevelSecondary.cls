//Update All Contact Level to “Secondary”. And show total number of records processed.
global class BatchUpdateLevelSecondary implements Database.Batchable<sObject>, Database.Stateful{

    global integer count = 0;
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('Select Id, Level__c From Contact Where Level__c != \'Secondary\'');
    }
    global void execute(Database.BatchableContext BC, list<Contact> conList){
        if(!conList.isEmpty()){
            for(Contact objCon : conList){
                objCon.Level__c = 'Secondary';
                count++;
            }
            update conList;
        }
        
    }
    global void finish(Database.BatchableContext BC){
        system.debug('Count ='+count);
        system.debug('From Finish Method');
    }
}