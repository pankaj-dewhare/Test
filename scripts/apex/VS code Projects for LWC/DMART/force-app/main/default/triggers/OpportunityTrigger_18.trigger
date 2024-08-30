//If Opp Stage is “Close Won” and Amount> 10000, then Opp LeadSource = “Web”.
trigger OpportunityTrigger_18 on Opportunity (before insert, before update) {
    for(Opportunity objOpp : trigger.new){
        if(objOpp.StageName == 'Closed Won' && objOpp.Amount > 10000){
            objOpp.LeadSource = 'Web';
        }  
    }
}