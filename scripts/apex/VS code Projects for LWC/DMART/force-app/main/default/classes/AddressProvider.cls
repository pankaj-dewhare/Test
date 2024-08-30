public with sharing class AddressProvider {

    @AuraEnabled
    public static list<Address__c> addressRecordMethod(string applId){
        try {
            
            Id appId = [Select Id From Applicant__c Where Name =: applId].Id;

            return [Select id, Name, Country__c, State__c, City__c From Address__c Where Applicant_Name__c =: appId];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

}