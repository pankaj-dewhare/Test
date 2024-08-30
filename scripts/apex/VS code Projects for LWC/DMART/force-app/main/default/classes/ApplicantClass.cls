public with sharing class ApplicantClass {
    @AuraEnabled
    public static string applicantRecordCreation(Applicant__c objApp){
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
}