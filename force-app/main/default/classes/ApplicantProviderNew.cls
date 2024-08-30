public with sharing class ApplicantProviderNew {
   @AuraEnabled
   public static void applicantFormMethod(string frstName, string lstName, string emal, long adharNumb){
    try {

        Applicant__c objApp = New Applicant__c(First_Name__c=frstName, Last_Name__c=lstName, Email__c=emal, Adhar_Number__c = adharNumb);

        INSERT objApp;
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   }

   @AuraEnabled
   public static Applicant__c showRecordIdMethoddName(Applicant__c objApp){
    try {

        Applicant__c objRecordRetrieved = [Select Id, Name, First_Name__c, Last_Name__c, Gender__c From Applicant__c Where Name =: objApp.Name ];

       return objRecordRetrieved;
        
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   }
}