/*Update Account Rating to Hot only if Type is “Prospect”.
Update All the related Opps Stage to “Closed Won”, only if Account rating is “Hot” or “Warm”.*/
global class BatchOppToAcc implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext BC){
       
        return Database.getQueryLocator('Select Id, StageName, Account.rating From Opportunity Where StageName != \'Closed won\'');
    }
    global void Execute(Database.BatchableContext BC, List<Opportunity> oppList){
        set<Id> accIdSet = New set<Id>();
        if(!oppList.isEMpty()){
            For(Opportunity objOpp : oppList){
                accIdSet.add(objOpp.AccountId);
            }
        } 
        map<Id,Account> accMap = new map<Id,Account>();
        if(!accIdSet.isEmpty()){
        for(Account objAcc : [Select Id, rating From Account Where ID IN : accIdSet]){
           accMap.put(objAcc.id, objAcc); 
        }
            }
        For(Opportunity objOpp : oppList){
            if(accMap.containskey(objOpp.AccountId)){
                if(accMap.get(objOpp.AccountId).rating == 'Hot' || accMap.get(objOpp.AccountId).rating == 'Warm'){
                    objOpp.StageName = 'Closed won';
                }
            }
        }
        if(!accMap.isEmpty()){
            database.update(accMap.values(),false);
        }
    }
    global void finish(Database.BatchableContext BC){
        
    }
}