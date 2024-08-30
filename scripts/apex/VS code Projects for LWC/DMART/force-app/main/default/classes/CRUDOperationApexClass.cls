public with sharing class CRUDOperationApexClass {
    @AuraEnabled
    public static string accountRecordInsertion(Account objAcc){
        try {
            if(objAcc != null){
            INSERT objAcc;
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
    public static Account searchAccountMethod(Account objAcc){
        try {

            if(objAcc != null){
          return  [Select Id, Name, Type, SLA__c, CreatedDate From Account Where Name =: objAcc.Name];
        }else{
            return null;
        }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Account updateAccountMethod(Account objAcc){
        try {

         Update objAcc;

         return [Select Id, Name, Type, SLA__c, CreatedDate From Account Where Name =: objAcc.Name];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static string deleteAccountMethod(Account objAcc){
        try {
            
            delete objAcc;
            return 'Account Deleted Successfully';
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}