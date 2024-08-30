/*User Story 3] Prevent Opp Deletion if,

-   Amount is greater or equals to 18000
-   Closed Date Month is August
-   Stage is “Prospecting” or “Closed Lost”.
Else, delete the record and take backup.*/
trigger OpportunityTrigger_14 on Opportunity(after delete){
    list<Opportunity_Backup__c> oppBkLIst= New list<Opportunity_Backup__c>();
    For(Opportunity objOpp : trigger.old){
        if((ObjOpp.Amount >= 18000 && objOpp.CloseDate.month() == 8) && (objOpp.StageName == 'Prospecting' || objOpp.StageName == 'Closed Lost')){
            objOpp.AddError('Opportunity can not be deleted.......!!!!');
        }Else{
            Opportunity_Backup__c oppBk = new Opportunity_Backup__c();
            oppBk.Opportunity_Bk_Name__c = objOpp.Name;
            oppBk.Amount__c = objOpp.Amount;
            oppBk.Close_date__c = objOpp.CloseDate;
            oppBkList.add(oppBk);
        }
    }
    if(!oppBkLIst.isEMpty()){
        database.insert(oppBkLIst, false);
    }
}