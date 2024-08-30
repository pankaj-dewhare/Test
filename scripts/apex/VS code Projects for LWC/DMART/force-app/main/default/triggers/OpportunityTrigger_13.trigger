//User Story 2] Show Error, if user deletes an Opp record of StageName “Prospecting”. Else Take its Backup.
trigger OpportunityTrigger_13 on Opportunity (after delete) {
    list<Opportunity_Backup__c> oppBkList = new list<Opportunity_Backup__c>();
    For(Opportunity objOpp : trigger.old){
        if(objOpp.StageName == 'Prospecting'){
            objOpp.AddError('Opportunity can not be deleted');
        }
        else{
            Opportunity_Backup__c objOppBk = New Opportunity_Backup__c();
            objOppBk.Opportunity_Bk_Name__c = objOpp.Name;
            ObjOppBk.Amount__c = objOpp.Amount;
            objOppBk.Close_date__c = objOpp.CloseDate;
            oppBkList.add(objOppBk);
            
        }
        if(!oppBkList.isEmpty()){
            Database.Insert(oppBkList,false);
        }   
    }
}