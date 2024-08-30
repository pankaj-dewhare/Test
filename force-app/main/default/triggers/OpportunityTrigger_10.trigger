/*Create/Edit an Opp.
If Account Rating is “Hot” or “Warm”, then Opp Type should be “Existing Customer - Upgrade”,  else None.
Copy Account’s SLA into Opp’s Description.*/
trigger OpportunityTrigger_10 on Opportunity (before insert, before update) {
    set<Id> accIdSet = new set<Id>();
    for(Opportunity objOpp : trigger.new){
        if(trigger.isBefore && trigger.isInsert){
            accIdSet.add(objOpp.AccountId);
        }
        if(trigger.isBefore && trigger.isUpdate){
            if(objOpp.AccountId != trigger.oldMap.get(objOpp.Id).AccountId){
                accIdSet.add(objOpp.AccountId);
            }
        }
        system.debug('New record comes='+trigger.new);
    }
    map<Id,Account> accMap = new map<Id,Account>();
    if(!accIdSet.isEmpty()){
    for(Account objAcc : [Select Id, Name, Rating, SLA__c From Account Where ID IN : accIdSet]){
        accMap.put(objAcc.id,objAcc);
        }
        system.debug('Record comes in Set =' +accIdSet);
    }
    for(Opportunity objOpp : trigger.new){
        if(accMap.containskey(objOpp.AccountId)){
            if(accMap.get(objOpp.AccountId).rating == 'Hot' || accMap.get(objOpp.AccountId).rating == 'Warm'){
                accMap.get(objOpp.AccountId).SLA__c =  objOpp.Description; 
                objOpp.Type = 'Existing Customer - Upgrade';
                
                
            }
            else{
                 objOpp.Description = '';
                 objOpp.Type = '';
               
            }
            
        }
        system.debug('Final record'+trigger.new);
    }
}