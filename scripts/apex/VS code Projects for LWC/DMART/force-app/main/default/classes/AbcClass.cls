public with sharing class AbcClass {
    
    @AuraEnabled
    public static void AccountCreationMethod(string accountName){
        try {

            Account objAcc = New Account(Name = accountName);
            Insert objAcc;
            
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}