public with sharing class AccountProvider6 {
    @AuraEnabled
    public static void accountCreationMethod(string acName){
        try {
            Account objAcc = New Account(Name = acName);
            INSERT objAcc;
            
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
} 