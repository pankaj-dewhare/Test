public with sharing class AddressProvider1 {

    @AuraEnabled
    public static list<Address__c> addressCreation(string appliId){
        try {

            ID appId = [Select Id From Applicant__c Where Name =: appliId].Id;
            return [Select Id, Name, Country__c, State__c, City__c From Address__c Where Applicant_Name__c =: appId];
            
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
   
}