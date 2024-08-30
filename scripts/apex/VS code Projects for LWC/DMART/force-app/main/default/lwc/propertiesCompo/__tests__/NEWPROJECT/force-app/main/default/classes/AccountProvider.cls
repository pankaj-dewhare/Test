public with sharing class AccountProvider {
    
@AuraEnabled
public static void accountCreationMethod(string accountName){
    try {

        Account objAcc = New Account(Name = accountName);
        if(!string.isBlank(objAcc.Name)){
        INSERT objAcc;
        }
        
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
  }
}