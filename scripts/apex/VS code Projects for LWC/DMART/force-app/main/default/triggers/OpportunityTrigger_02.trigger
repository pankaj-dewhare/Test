/*User Story 3] Prevent Opp Deletion if,
-   Amount is greater or equals to 18000
-   Closed Date Month is August
-   Stage is “Prospecting” or “Closed Lost”.
Else, delete the record and take backup.
*/
trigger OpportunityTrigger_02 on Opportunity (after delete) {
    List<Opportunity_Backup__c> oppBkList = new list<Opportunity_Backup__c>();
    For(Opportunity objOpp : trigger.old){
        if((objOpp.Amount >= 18000 && objOpp.CloseDate.month() == 8 && objOpp.StageName == 'Prospecting') || (objOpp.StageName == 'Closed Lost')){
            objOpp.AddError('Opprtunity Can not be deleted');
        }
        else{
            Opportunity_Backup__c objOppBk = new Opportunity_Backup__c();
            objOppBk.Opportunity_Bk_Name__c = objOpp.Name;
            objOppBk.Amount__c = objOpp.Amount;
            objOppBk.Close_date__c = objOpp.CloseDate;
            oppBkList.add(objOppBk);
        }
    }
    
    if(!oppBkList.isEmpty()){
        database.insert(oppBkList, false);
    }
}