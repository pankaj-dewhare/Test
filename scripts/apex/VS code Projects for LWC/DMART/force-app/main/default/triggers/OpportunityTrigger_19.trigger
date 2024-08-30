/*1] Create/Edit an Opp. 
If Account Rating is “Hot” or “Warm”, then Opp Type should be “Existing Customer - Upgrade”,  else None.
Copy Account’s SLA into Opp’s Description.*/
trigger OpportunityTrigger_19 on Opportunity (before insert, before update) {
    set<Id> accIdSet = new set<Id>();
    for(Opportunity objOpp : trigger.new){
        if(trigger.isInsert && trigger.isBefore){
            if(objOpp.AccountId != null){
                accIdSet.add(objOpp.AccountId);
            }
        }
        if(trigger.isBefore && trigger.isUpdate){
            if(objOpp.type != trigger.oldMap.get(objOpp.id).type){
                accIdSet.add(objOpp.AccountId);
            }
        }
    }
    Map<Id,Account> accMap = new map<Id,Account>();
    for(Account objAcc : [Select Id, Rating, SLA__c From Account Where ID IN : accIdSet]){
        accMap.put(objAcc.id,objAcc);
    }
    for(Opportunity objOpp : trigger.new){
        if(accMap.containskey(objOpp.AccountId)){
            if(accMap.get(objOpp.AccountId).Rating == 'Hot' || accMap.get(objOpp.AccountId).Rating == 'Warm'){
                objOpp.Type = 'Existing Customer - Upgrade';
            }
            else{
                objOpp.Description = accMap.get(objOpp.AccountId).SLA__c;
                objOpp.Type = '';
            }
        }
    }
}