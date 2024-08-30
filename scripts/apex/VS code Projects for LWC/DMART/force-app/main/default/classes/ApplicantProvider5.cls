public with sharing class ApplicantProvider5 {
    
    @AuraEnabled
    public static list<Applicant__c> applicantDataTabelShowMethod(date fromDateParam, date toDateParam){
        try {

         return [Select Id, Name, First_Name__c, Last_Name__c, Gender__c, CreatedDate, CreatedBy.Name From Applicant__c Where CreatedDate >=: fromDateParam and CreatedDate<=: toDateParam];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    // Creating apex class for onekeup function by sending string variable below query using for same scenario 
    @AuraEnabled
    public static List<Applicant__c> showDataByFirstWord(string firstName){
        try {

           // string myFirstName = firstName+'%';

            if(!string.isBlank(firstName)){

            return [Select Id, Name, First_Name__c, Gender__c, DOB__c From Applicant__c Where First_Name__c Like : firstName+'%'];

        }else{
            return null;
        }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    // Creating apex class for onekeup function by sending object in parameter above query using for same scenario

    @AuraEnabled
    public static list<Applicant__c> recordShownByOnkeyupMethod(Applicant__c objApp){
        try {

            if(string.isNotBlank(objApp.First_Name__c)){
            return [Select Id, Name, First_Name__c, Last_Name__c, Gender__c, DOB__c From Applicant__c Where First_Name__c Like : objApp.First_Name__c+'%'];
            }
            else{
                return null;
            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

    
    }

    @AuraEnabled
    public static list<Applicant__c> deleteApplicantRecordMethod(list<Id> appIdList, Applicant__c objApp){
        try {

            database.delete([Select ID, Name From Applicant__c Where Id IN : appIdList], false);
            return [Select Id, Name, First_Name__c, Last_Name__c, Gender__c, DOB__c From Applicant__c Where First_Name__c Like : objApp.First_Name__c+'%'];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    
}