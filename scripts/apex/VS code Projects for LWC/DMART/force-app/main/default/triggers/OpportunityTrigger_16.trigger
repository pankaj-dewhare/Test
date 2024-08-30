//Prevent Duplicate Opportunity Amount. 
trigger OpportunityTrigger_16 on Opportunity (before insert, before update) {
set<decimal> oppAmountSet = new set<decimal>();
    for(Opportunity objOpp : trigger.new){
        oppAmountSet.add(objOpp.Amount);
    }
    list<Opportunity> oppList = [Select ID, Amount From Opportunity Where Amount IN : oppAmountSet];
    
    for(Opportunity objOpp : trigger.new){
        if(oppList.size()>0){
           objOpp.AddError('Duplicate amount found'); 
        }
    }
}