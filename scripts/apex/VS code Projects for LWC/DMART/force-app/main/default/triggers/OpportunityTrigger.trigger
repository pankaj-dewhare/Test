//User Story 1] Create an Object “Opportunity Backup”. Take Backup of Opportunity when a record gets deleted.
trigger OpportunityTrigger on Opportunity (after delete) {
    list<Opportunity_Backup__c> oppBkList = new list<Opportunity_Backup__c>();
    For(Opportunity objOpp : trigger.old){
        system.debug('Delete Record are coming ='+trigger.old);
        Opportunity_Backup__c objOppBk = new Opportunity_Backup__c();
        objOppBk.Opportunity_Bk_Name__c = objOpp.Name;
        objOppBk.Amount__c = objOpp.Amount;
        objOppBk.Close_Date__c = objOpp.CloseDate;
        oppBkList.add(objOppBk);
        system.debug('Record are adding in list ='+oppBkList);
    }
    if(!oppBkList.isEmpty()){
        database.insert(oppBkList, false);
        system.debug('Record inserted ='+oppBkList);
    }
}