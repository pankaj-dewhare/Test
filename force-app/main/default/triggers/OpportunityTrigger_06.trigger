// User Story : 3.Update Account rating to Hot on Account when opportunity stage equals 'closed won'
trigger OpportunityTrigger_06 on Opportunity (after insert, after update) {
   
    set<Id> accIdSet = new set<Id>();
        For(Opportunity objOpp : trigger.new){
            if(trigger.isAfter && trigger.isInsert){
            accIdSet.add(objOpp.AccountId);
        }
            if(trigger.isAfter && trigger.isUpdate){
                if(objOpp.AccountId == trigger.oldMap.get(objOpp.Id).AccountId){
                     accIdSet.add(objOpp.AccountId);
                }  
            }
            }
    map<Id,Account> accmap = new map<Id,Account>();
    For(Account objAcc : [Select Id, Name From Account Where ID IN : accIdSet]){
        accMap.put(objAcc.id, objAcc);
    }
    
    For(Opportunity objOpp : trigger.new){
        if(accMap.containskey(objOpp.AccountId)){
            if(objOpp.StageName == 'Closed won'){
                accMap.get(objOpp.AccountId).rating = 'Hot';
            }
            else{
                accMap.get(objOpp.AccountId).rating = '';
            }
        }
    }
    if(!accMap.isEmpty()){
        database.update(accMap.values(), false);
    }
}