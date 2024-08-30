public with sharing class AccountProvider1 {
   @AuraEnabled
    public static void accountCreation(string accountName) {

        if(!String.isBlank(accountName)){
        account objAcc = new account(Name = accountName);
        insert objAcc;
        }
    }

    @AuraEnabled
    public static string accountRecordCreation(Account objAcc){
        try {

            if(objAcc != null){
            insert objAcc;
            return 'Account has been created';

            }
            else{
                return 'Something went wrong';
            }

            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Account accountRecordSearch(Account objAcc){
        try {
        Account accountObject = [Select Id, Name, Type, SLA__c, CreatedDate From Account Where Name =: objAcc.Name];
        return accountObject;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Account updateAccountMethod(Account objAcc){
        try {

            update objAcc;
            return [Select Id, Name, Type, SLA__c, CreatedDate From Account Where Name =: objAcc.Name];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static string deleteAccountRecord(Account objAcc){
        try {
            delete objAcc;

            return 'Record has been deleted successfully';
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Account> accountTypeTable(Account objAcc){
        try {

            if(objAcc != null){

                return [Select ID, Name, Type, SLA__c, CreatedDate, Rating From Account Where Type =: objAcc.Type];
            }
            else{
                return null;
            }

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static list<Account> latestRecord(Account objAcc){
        try {
            
          return  [Select ID, Name, CreatedDate, rating, SLA__c From Account Order by CreatedDate desc LIMIT 10];

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }  

    @AuraEnabled(cacheable=true)
    public static list<Account> getAccountJuhiRecords(Account objAcc){
        try {

            return [Select Id, Name, Type, SLA__c From Account Where Name =: objAcc.Name = 'Juhi'];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static list<Account> typeAndRatingMethod(Account objAcc){
        try {
            
            return [Select Id, Name, SLA__c, Type, Rating, CreatedDate From Account Where Type =: objAcc.Type = 'Prospect' and Rating =: objAcc.Rating = 'Hot'];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}