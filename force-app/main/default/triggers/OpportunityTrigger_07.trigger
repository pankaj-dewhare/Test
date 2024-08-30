//User story : If Opp Stage is “Close Won” and Amount> 10000, then Opp LeadSource = “Web”.
trigger OpportunityTrigger_07 on Opportunity (before insert, before update) {
    for(Opportunity objOpp : trigger.new){
        if(trigger.isInsert && trigger.isBefore){
            if(objOpp.StageName == 'Closed won' && objOpp.Amount > 10000){
                objOpp.LeadSource = 'Web';
            }
        }
        if(trigger.isBefore && trigger.isUpdate){
            //if(objOpp.StageName != trigger.oldMap.get(objOpp.Id).StageName && objOpp.Amount != trigger.oldMap.get(objOpp.Id).Amount){
                if(objOpp.StageName == 'Closed won' && objOpp.Amount > 10000){
                    objOpp.LeadSource = 'Web';
                }
           // }
        }
    }
}