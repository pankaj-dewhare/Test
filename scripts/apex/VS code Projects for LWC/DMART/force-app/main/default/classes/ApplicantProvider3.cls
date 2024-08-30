public with sharing class ApplicantProvider3 {
    @AuraEnabled
    public static void applicantRecordCreation(string frstName, string lstName, string emailId, integer adhNumb){
        try {

            Applicant__c objApp = new Applicant__c(First_Name__c = frstName, Last_Name__c = lstName, 	Email__c = emailId, Adhar_Number__c = adhNumb);

            insert objApp;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Applicant__c applicantSearchMethod(Applicant__c objApp){
        try {

          return [Select Id, Name, First_Name__c, Last_Name__c, Gender__c From Applicant__c Where Name =: objApp.Name];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static list<Applicant__c> appLicantRecordShown(Applicant__c objApp){
        try {

           return [Select Id, Name, First_Name__c, Last_Name__c, CreatedDate From Applicant__c Where First_Name__c Like : objApp.First_Name__c+'%'];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static string arrayIdPassMethod(list<Id> AppIdList){
        try {

            database.delete([Select Id From Applicant__c Where ID IN : appIdList], false) ;
            return 'Data has been deleted';
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}