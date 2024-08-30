public with sharing class AccountProvider5 {
    @AuraEnabled
    public static list<Account> accountRecordShowMethod(Account objAcc){
        try {

           return [Select Id, Name, Type, Rating, SLA__c, CreatedDate From Account Where Type =: objAcc.Type and SLA__c =: objAcc.SLA__c];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}