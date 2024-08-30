/*1] Create/Edit an Opp.
If Account Rating is “Hot” or “Warm”, then Opp Type should be “Existing Customer - Upgrade”,  else None.
Copy Account’s SLA into Opp’s Description.*/
trigger OpportunityTrigger_08 on Opportunity (before insert, before update) {
    set<Id> oppIdSet = new set<Id>();
    for(Opportunity objOpp : trigger.new){
        if(trigger.isInsert && trigger.isBefore){
            if(objOpp.AccountId != null){
                oppIdSet.add(objOpp.accountId);
            }
        }
        if(trigger.isBefore && trigger.isUpdate){
            if(objOpp.AccountId != trigger.oldMap.get(objOpp.Id).AccountId){
                oppIdSet.add(objOpp.AccountID);
            }
        }
    }
    map<Id,Account> accMap = new map<Id,Account>();
    
    For(Account objAcc : [Select ID, rating, SLA__c From Account Where ID IN : oppIdSet]){
        accMap.put(objAcc.id, objAcc);
    }   
    for(Opportunity objOpp : trigger.new){
        if(accMap.containskey(objOpp.AccountId)){
            if(accMap.get(objOpp.AccountId).rating == 'Hot' || accMap.get(objOpp.AccountId).rating == 'Warm'){
                objOpp.type = 'Existing Customer - Upgrade';
                objOpp.Description = accMap.get(objOpp.AccountId).SLA__c;
            }
            else{
                objOpp.type = '';
                objOpp.Description = '';         
            }
        }
    }
}