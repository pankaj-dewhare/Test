//User Story 2] Show Error, if user deletes an Opp record of StageName “Prospecting”. Else Take its Backup.
trigger OpportunityTrigger_01 on Opportunity (after delete) {
    List<Opportunity_Backup__c> oppBkList = New list<Opportunity_Backup__c>();
    For(Opportunity objOpp : trigger.old){
        if(!string.isBlank(objOpp.StageName)){
            if(objOpp.StageName == 'Prospecting'){
                objOpp.StageName.AddError('Opportunity record can not be deleted');
            }
            else{
                Opportunity_Backup__c objBkOpp = new Opportunity_Backup__c();
                objBkOpp.Opportunity_Bk_Name__c = objOpp.Name;
                objBkOpp.Amount__c = objOpp.Amount;
                objBkOpp.Close_date__c = objOpp.CloseDate;
                oppBkList.add(objBkOpp);
            } 
        }
    }
    if(!oppBkList.isEmpty()){
        database.insert(oppBkList, false);
    }
}