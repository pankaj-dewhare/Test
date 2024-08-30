public class OpportunityTrigger_20Helper {
    
    public static void preventDupOpportunity(list<Opportunity> oppList){
        set<Id> accIdSet = New Set<Id>();
        for(Opportunity objOpp : oppList){
            if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
                accIdSet.add(objOpp.AccountId);
            }  
        }
        
        Map<Id,Account> accMap = New Map<Id,Account>();
        if(!accIdSet.isEmpty()){
            for(Account objAcc : [Select Id, Name, (Select Id, Name From Opportunities) From Account Where ID IN : accIdSet]){
                accMap.put(objAcc.id,objAcc);
            }    
        }
        for(Opportunity objOpp : oppList){
            if(accMap.containskey(objOpp.AccountId)){
                list<Opportunity> oppListChild = accMap.get(objOpp.AccountId).Opportunities;
                if(oppListChild.size()>0){
                    objOpp.AddError('Opportuity with same name is exist');
                }
            }
        }
    }
}