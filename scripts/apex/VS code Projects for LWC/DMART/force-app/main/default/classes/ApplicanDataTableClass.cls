public with sharing class ApplicanDataTableClass {
    @AuraEnabled
    public static list<Applicant__c> applicantDataTableMethod (Applicant__c objApp){
        try {
            if(string.isBlank(objApp.First_Name__c)){
                return [Select Id, Name, First_Name__c, Last_Name__c, Gender__c, DOB__c From Applicant__c Where First_Name__c Like : objApp.First_Name__c+'%'];
                }else{
                    return null;
                }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}