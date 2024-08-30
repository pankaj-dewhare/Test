public with sharing class ApplicantProvider1 {
    
    @AuraEnabled
    public static string applicantCreation(Applicant__c objApp){
        try {
    if(objApp != null){
     insert objApp;
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
    public static Applicant__c applicantIdFetch(Applicant__c objApp){
        try {

          Applicant__c objApplicantRetrieved =  [Select Id, First_Name__c, Last_Name__c, Gender__c From Applicant__c Where Name =: objApp.Name];
          return objApplicantRetrieved;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Applicant__c> dateRangeMethod(Date fromDateParam , Date toDateParam){
        try {
            
            return [Select Id, Name, First_Name__c, Last_Name__c, CreatedDate, CreatedBy.Name From Applicant__c Where CreatedDate >=: fromDateParam and  CreatedDate <=: toDateParam];

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static list<Applicant__c> dataFetchingByFirstLetter(string fName){
        try {
            string myFirstName = fName;

            if(!string.isBlank(fName)){
            
          return [Select Id, First_Name__c From Applicant__c Where First_Name__c Like : myFirstName+'%'];
        }
        else{
        return null;

        }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    /* @AuraEnabled
    public static list<Applicant__c> applicantDataTableRecord(Applicant__c objApp){
       try {

            if(!string.isBlank(objApp.First_Name__c)){
        return [Select Id, Name, First_Name__c, last_Name__c, CreatedDate From Applicant__c Where First_Name__c Like : objApp.First_Name__c+'%'];
           }
           else{
            return null;
           }
        } catch (Exception e) { 
            throw new AuraHandledException(e.getMessage());
        }
    }*/

   /* @AuraEnabled
    public static list<Applicant__c> selectedDeleteRecords(list<Id> appIdList, Applicant__c objApp){
        try {
            
         database.delete([Select id From Applicant__c Where ID IN : appIdList], false);
         return [Select Id, Name, First_Name__c, last_Name__c, CreatedDate From Applicant__c Where First_Name__c Like : objApp.First_Name__c+'%'];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }*/
    
    @AuraEnabled
    public static List<Applicant__c> firstNameCreation (Applicant__c objApp){
        try {

            return [Select Id, Name, First_Name__c, Last_Name__c, CreatedDate From Applicant__c Where First_Name__c Like : objApp.First_Name__c+'%' ];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static list<Applicant__c> deleteSelectedRecordsMethod(list<Id> deleteList, Applicant__c objApp){
        try {
            
            database.delete([Select Id From Applicant__c Where ID IN : deleteList], false);
            return [Select Id, Name, First_Name__c, Last_Name__c, CreatedDate From Applicant__c Where First_Name__c Like : objApp.First_Name__c+'%' ];
        
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}