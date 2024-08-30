//Make Opp Amount = 0 of StageName Closed Won on this Diwali.
global class BatchOpportunityUpdateStageName implements Database.Batchable<sObject>, Database.Stateful{

    global integer count = 0;
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('Select Id, Amount, StageName From Opportunity Where Amount != 0 and StageName = \'Closed Won\'');
    }
    global void execute(Database.BatchableContext BC, List<Opportunity> oppList){
        if(!oppList.isEmpty()){
            for(Opportunity objOpp : oppList){
                objOpp.Amount = 0;
                count++;
            }
          Database.SaveResult[] result =  database.update(oppList,false);
        }
    }
    global void finish(Database.BatchableContext BC){
        system.debug('Count ='+count);
    }
}