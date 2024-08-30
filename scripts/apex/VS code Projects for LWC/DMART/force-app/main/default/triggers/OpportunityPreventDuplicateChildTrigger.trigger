//Prevent duplicate opportunity of StageName for an account
trigger OpportunityPreventDuplicateChildTrigger on Opportunity (before insert, before update, after undelete) {
    set<Id> acountIdSet = new set<Id>();
    For(Opportunity objOpp : trigger.new){
        if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
            acountIdSet.add(objOpp.AccountId);
        }
    }
        Map<Id,Account> accMap = new map<Id,Account>();
        for(Account objAcc : [Select Id, Name, (Select Id, StageName From Opportunities) From Account Where ID IN : acountIdSet]){
            accMap.put(objAcc.id, objAcc);
        }
        for(Opportunity objOpp : trigger.new){
            if(accMap.containskey(objOpp.AccountId)){
               list<Opportunity> conList = accMap.get(objOpp.AccountId).Opportunities;
                
                for(Opportunity objOppExisting : conList){
                    if(objOpp.stageName == objOppExisting.stageName){
                        objOpp.AddError('This account contains duplicate opportunity stageName');
                    }
                }
                
            }
        }
    }