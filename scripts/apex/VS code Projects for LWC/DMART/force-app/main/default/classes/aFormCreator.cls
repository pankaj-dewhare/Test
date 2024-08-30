public with sharing class aFormCreator {
    
    @AuraEnabled
    public static string accRecordCreator(Account objAcc){
        try {

            if(objAcc != null){
              INSERT objAcc;
              return 'Record has created....!';
            }
            else{
                return 'Something went wrong....!';
            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Account searchRecordMethod(Account objAcc){
        try {

            return [Select Id, Name, Type, SLA__c, CreatedDate From Account Where Name =: objAcc.Name];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Account updateRecordMethod(Account objAcc){
        try {

            update objAcc;

            return [Select Id, Type, SLA__c, CreatedDate From Account Where Name =: objAcc.Name];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static string deleteRecordMethod(Account objAcc){
        try {

            delete objAcc;

            return 'Record Has been deleted successfully';
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Account> typeRecordShowMethod(Account objAcc){
        try {

            if(objAcc != null){

            return [Select Id, Name, Type, Rating, SLA__c, CreatedDate From Account Where Type =: objAcc.Type];
        }

        else{

            return null;
        }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}