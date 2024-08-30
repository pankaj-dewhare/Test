public with sharing class AccountProvider_5 {
    @AuraEnabled
    public static void accountRecordInsertMethod(string acName){
        try {

            if(string.isNotBlank(acName)){
            Account objAcc = New Account(Name=acName);
            INSERT objAcc;
        }
            

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static list<Account> accountDataShow(Account objAcc){
        try {

            return [Select Id, Name, Type, SLA__C, CreatedDate From Account Limit 10];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}