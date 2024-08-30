public with sharing class applicantProvider {
    
    @AuraEnabled
    public static string createNewApplicant(Applicant__c objApp){
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
    public static Applicant__c fetchingApplicantRecord(Applicant__c objApp){
        try {

            Applicant__c objApplicantRetrieved = [Select Id, First_Name__c, Last_Name__c, Gender__c From Applicant__c Where Name =: objApp.Name ];

            return objApplicantRetrieved;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static list<Applicant__c> applicantDateRecord(Date fromDateParam , Date toDateParam){
        try {
            
            return [select Id, Name, First_Name__c, Last_Name__c, CreatedDate,CreatedBy.FirstName, CreatedBy.LastName, CreatedBy.Name from Applicant__c where CreatedDate >=: fromDateParam and CreatedDate <=: toDateParam];


        } 
        
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static list<Applicant__c> applicantRecordFetchingMethod(string firstName){
        try {

            string myFirstName = firstName;
            
           return  [Select ID, First_Name__c From Applicant__c Where First_Name__c like : myFirstName+'%'];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable = true)
    // why this class and SOQL is written cause i need to show the applicant first name as per the gender must check JS & HTML class by apex class method to understand the concept
    public static list<Applicant__c> getApplicantRecords(string Gender, boolean police){
        try {

            return [Select Id, First_Name__c, Gender__c, police_verification__c From Applicant__c Where Gender__c =: Gender and police_verification__c =: police];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable = true)
    public static list<Applicant__c> juhiRecordMethod(Applicant__c objApp){
        try {

            return [Select Id, First_Name__c, Gender__c, Police_Verification__c From Applicant__c Where First_Name__c =: objApp.First_Name__c = 'Juhi'];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static list<Applicant__c> applicantRecords(){
        try {

            return [Select Id, First_Name__c, Last_Name__c, Gender__c From Applicant__c LIMIT 10];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable = true)
    public static list<Applicant__c> applicantGenderPoliceMethod(string gender, boolean police){
        try {

         return [Select Id, First_Name__c, Last_Name__c, Gender__c, Police_Verification__c From Applicant__c Where Gender__c =: gender and Police_Verification__c =: police];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}