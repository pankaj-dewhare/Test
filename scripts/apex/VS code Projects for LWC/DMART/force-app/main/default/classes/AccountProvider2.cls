public with sharing class AccountProvider2 {
    
    @AuraEnabled
    public static string accountRecordCreation(Account objAcc){
        try {

            if(objAcc != null){
            insert objAcc;
             return 'Record has been created by backend';
           }
           else{
            return 'Something went wrong by backend';
           }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}