trigger OpportunityTriggerP2Child on Opportunity (after insert, after update) {
    set<Id> accIdSet = new set<Id>();
    for(Opportunity objOpp : trigger.new){
        if(trigger.isInsert && trigger.isAfter){
            accIdSet.add(objOpp.AccountId);
        }
        if(trigger.isUpdate && trigger.isAfter){
            if((objOpp.Amount != trigger.oldMap.get(objOpp.id).Amount) || (objOpp.stageName != trigger.oldMap.get(objOpp.id).stageName)){
                accIdSet.add(objOpp.AccountId);
            }
        }
        
    }
    
    map<id,Account> accMap = new map<Id,Account>();
    if(!accIdSet.isEmpty()){
        for(Account objAcc : [select id, Name, SLA__c From Account Where Id IN : accIdSet]){
            accMap.put(objAcc.id, objAcc);
        }
    }
    if(!accMap.isEmpty()){
        for(opportunity objOpp : trigger.new){
            if(accMap.containskey(objOpp.AccountId)){
                if(objOpp.Amount <= 8000 && objOpp.StageName == 'Closed Lost'){
                    accMap.get(objOpp.AccountId).SLA__c = 'Silver';
                }
                else{
                    accMap.get(objOpp.AccountId).SLA__c = '';
                }
            }
        }
        database.update(accMap.values(), false);
    }
}