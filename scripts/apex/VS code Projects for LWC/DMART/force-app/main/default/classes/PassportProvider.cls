public with sharing class PassportProvider {

    @AuraEnabled
    public static list<Passport__c> passportRecordMethod(string ApliID){
        try {

            ID applID = [Select ID From Applicant__c Where Name  =: ApliID].Id;
          return  [Select ID, Passport_No__c, Status__c, CreatedDate From Passport__c Where Applicant__c =: applID];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}