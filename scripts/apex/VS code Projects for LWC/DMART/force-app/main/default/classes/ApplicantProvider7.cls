
public with sharing class ApplicantProvider7 {
    @AuraEnabled
    public static string applicantCreationMethod(Applicant__c objApp){
        try {
            if(objApp != null){
            INSERT objApp;
            return 'Record has been created';
        }
        else{
            return 'Something went wrong';
        }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Applicant__c applicantRecordShowMethod(Applicant__c objApp){
        try {
            
            return [Select Id, Name, First_name__c, Last_Name__c, Gender__c From Applicant__c Where Name =: objApp.Name];

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}