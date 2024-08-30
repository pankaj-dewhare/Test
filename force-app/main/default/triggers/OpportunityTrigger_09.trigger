trigger OpportunityTrigger_09 on Opportunity (after insert, after update, after delete, after undelete) {
set<Id> accIdSet = new set<Id>();
    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate || trigger.isUndelete)){
        for(Opportunity objOpp : trigger.new){
            accIdSet.add(objOpp.AccountId);
        }
    }
    if(trigger.isAfter && (trigger.isUpdate || trigger.isDelete)){
        For(Opportunity objOpp : trigger.old){
            accIdSet.add(objOpp.AccountId);
        }
    } 
    
    list<Account> accList = new list<Account>();
    
    for(Account objAcc : [Select id, Count_Of_Opportunity__c, (Select Id, Name From Opportunities) From Account Where ID IN : accIdSet]){
        List<Opportunity> oppList = objAcc.opportunities;
        objAcc.Count_Of_Opportunity__c = oppList.size();
        accList.add(objAcc);
        
    }
    if(!accList.isEmpty()){
        database.update(accList, false);
        
    }
}