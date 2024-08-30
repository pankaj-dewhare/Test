public with sharing class ApplicantProviderNew {
    @AuraEnabled
    public static List<Applicant__c> showingRecordInTableMethod(date frmDate, date tooDate){
        try {

            return [Select Id, Name, First_Name__c, Last_Name__c, CreatedDate, CreatedBy.FirstName, CreatedBy.LastName, CreatedBy.Name From Applicant__c Where CreatedDate >=: frmDate and CreatedDate <=: tooDate];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static list<Applicant__c> showNameByFirstLetterMethod(string firstNameParam){
        try {

          //  string myFirstName = firstNameParam+'%'; <- this type of process is wrong for this scenario 

            return [select Id, Name, First_Name__c from Applicant__c where First_Name__c like : firstNameParam +'%'];
           
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static list<Applicant__c> dataHandleMethod(Applicant__c objApp){
        try {

            return [Select Id, Name, First_Name__c, Last_Name__c, Gender__c From Applicant__c Where First_Name__c like : objApp.First_Name__c+'%'];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Applicant__c> deleteRecordMethod(List<Id> appIdList, Applicant__c objApp){
        try {

         delete [Select Id From Applicant__c Where ID IN : appIdList ];
         return [Select Id, Name, First_Name__c, Last_Name__c, Gender__c From Applicant__c Where First_Name__c like : objApp.First_Name__c+'%'];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static list<Address__c> applicantIdShowMethod(string applicantId){
        try {

            Id applid = [Select Id From Applicant__c Where Name =: applicantId].Id;

            return [Select Id, Name, Country__c, State__c, City__c From Address__c Where Applicant_Name__c =: applid];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}