//1] Create/Edit an Opp, if Amount <=8000 and Stage Name is “Closed Lost”, then Account SLA should be “Silver”. Else, nothing.
trigger OpportunityTrigger_05 on Opportunity (after insert, after update) {
    set<Id> accIdSet = new set<Id>();
    for(Opportunity objOpp : trigger.new){
        if(trigger.isAfter && trigger.isInsert){
            accIdSet.add(objOpp.AccountId);
        }
        if(trigger.isAfter && trigger.isUpdate){
            if(objOpp.AccountId == trigger.oldMap.get(objOpp.Id).AccountId){
                accIdSet.add(objOpp.AccountId);
            }
        }
    }
    map<Id,Account> accMap = new map<Id,Account>();
    For(Account objAcc : [Select Id, Name, SLA__c From Account Where ID IN : accIdSet]){
        accMap.put(objAcc.Id, objAcc);
    } 
    For(Opportunity objOpp : trigger.new){
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
        database.update(accMap.Values(), false);
    }
}