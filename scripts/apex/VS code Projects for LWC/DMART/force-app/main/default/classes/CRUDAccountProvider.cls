public with sharing class CRUDAccountProvider {
    
    @AuraEnabled
    public static string accountRecordCreation(Account objAcc){
        try {

            if(objAcc != null){
              INSERT objAcc;
              return 'Record has been created';
            }
            else{
                return 'Oops Something went wrong';
            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Account accountRecordSearch(Account objAcc){
        try {
            
            if(objAcc != null){
            return [Select Id, Name, Type, SLA__c, CreatedDate From Account Where Name =: objAcc.Name];
        }else{
            return null;
        }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Account accountRecordUpdate(Account objAcc){
        try {

        update objAcc;
        return [Select Id, Name, Type, SLA__c From Account Where Name =: objAcc.Name];
       
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static string accountRecordDelete(Account objAcc){
        try {

            delete objAcc;
            return 'Account record has been deleted';
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}