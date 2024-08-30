//User Story 1] If the Contact Lead Source is “Web”, then show “Contact FirstName, LastName and LeadSource as “Web” on Description field of Account.
global class BatchContactLeadsourceUpdate implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('Select Id, leadsource, FirstName, LastName, Account.Id, Account.Name, Account.Description From Contact Where Leadsource = \'Web\'');
    }
    global void execute(Database.BatchableContext BC, list<Contact> conList){
        set<Id> accIdSet = new set<Id>();
        if(!conList.isEmpty()){
            for(Contact objCon : conList){
                if(objCon.AccountId != null){
                    accIdSet.add(objCon.AccountId);
                } 
            }
        }
        map<Id,Account> accMap = new map<Id,Account>();
        if(!accIdSet.isEmpty()){
            for(Account objAcc : [Select Id, Name, Description From Account Where ID IN : accIdSet]){
                accMap.put(objAcc.id, objAcc);
            }
        }
        if(!accMap.isEmpty()){
            for(Contact objCon : conList){
                if(accMap.containskey(objCon.AccountId)){
                    if(string.isBlank(accMap.get(objCon.AccountId).description)){
                        accMap.get(objCon.AccountId).description = objCon.FirstName+ ' ' +objCon.LastName+ ' ' +objCon.Leadsource;
                    }
                    else{
                        accMap.get(objCon.AccountId).description =  accMap.get(objCon.AccountId).description+ ' \n' +objCon.FirstName+ ' ' +objCon.LastName+ ' ' +objCon.Leadsource;
                    }
                }
            }
            database.update(accMap.values(), false);
        }
    }
    global void finish(Database.BatchableContext BC){
        
    }
}