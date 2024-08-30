//Create/Edit an Opp, if Amount <=8000 and Stage Name is “Closed Lost”, then Account SLA should be “Silver”. Else, nothing.
trigger OpportunityTrigger_17 on Opportunity (after insert, after update) {
    set<Id> accIdSet = new set<Id>();
    for(Opportunity objOpp : trigger.new){
        accIdSet.add(objOpp.AccountId);
    }
    map<Id,Account> accMap = new map<Id,Account>();
    For(Account objAcc : [Select Id, SLA__c From Account Where ID IN : accIdSet]){
        accMap.put(objAcc.id,objAcc);
    }
    for(Opportunity objOpp : trigger.new){
        if(accMap.containskey(objOpp.AccountId)){
            if(objOpp.Amount <= 8000 && objOpp.StageName == 'Closed Lost'){
                accMap.get(objOpp.AccountId).SLA__c = 'Silver';
            }
            else{
                accMap.get(objOpp.AccountId).SLA__c = '';
            }
        }
    }
    if(!accMap.isEmpty()){
        database.update(accMap.values(), false);
    }
}