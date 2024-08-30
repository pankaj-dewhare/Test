public with sharing class showApplicantDetails {
    
    @AuraEnabled
    public static list<Applicant__c> applicatRecordShow(){

        list<Applicant__c> appList = new list<Applicant__c>();

        appList = [Select Id, Name, First_Name__c, Email__c, Pan_card__c From Applicant__c];

        return appList;
    }
}