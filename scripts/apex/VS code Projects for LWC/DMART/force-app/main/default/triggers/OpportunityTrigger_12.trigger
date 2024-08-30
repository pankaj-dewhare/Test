/*Create an Object “Opportunity Backup”. Take Backup of Opportunity when a record gets deleted.*/
trigger OpportunityTrigger_12 on Opportunity (after delete) {
list<Opportunity_Backup__c> objOppBkList = New List<Opportunity_Backup__c>();
    for(Opportunity objOpp : trigger.old){
        Opportunity_Backup__c objOppBk = New Opportunity_Backup__c();
        objOppBk.Opportunity_Bk_Name__c = objOpp.Name;
        objOppBk.Amount__c = objOpp.Amount;
        objOppBk.Close_Date__c = objOpp.CloseDate;
        objOppBkList.add(objOppBk);
        
    }
    if(!objOppBkList.isEMpty()){
        database.insert(objOppBkList,false);
    }
    
}