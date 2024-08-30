public with sharing class AccountProvider {
   
   
    @AuraEnabled
    public static string accountRecordInsert(Account objAcc){
        if(objAcc != null){
            insert objAcc;
            return 'Record has been created';
           }
           else{
            return 'Something went wrong';
           }
    }

    @AuraEnabled
    public static Account fetchingAccountRecord(Account objAcc){
        try {

            if(objAcc != null){
         return  [Select Id, Name, Type, SLA__c, CreatedDate From Account Where Name =: objAcc.Name];
            
        } 
        else{
            return null;
        }
    }
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Account updateAccountRecord(Account objAcc){
        try {
            if(objAcc != null){
            update objAcc;

            return [Select Id, Name, Type, SLA__c, CreatedDate From Account Where Name =: objAcc.Name];
            }
            else{
                return null;
            }

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static string deleteAccountRecord(Account objAcc){
        try {
            
            delete objAcc;

            return 'Account record has been deleted successfully';
        } 
        
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

   @AuraEnabled
   public static list<Account> accountTypeRecordInsert(Account objAcc){
    try {
        if(objAcc != null){
            
  list<Account> accList =  [Select Id, Name, Rating, SLA__c, Type, CreatedDate From Account Where Type =: objAcc.Type];
    return accList;
        }
        else{
            return null;
        }
        
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   }

   @AuraEnabled(cacheable=true)
   public static list<Account> getAccountTypeAndRating(Account objAcc){
    try {
        
        return [Select Id, Name, Type, Rating From Account Where Type =: objAcc.Type = 'Prospect' and Rating =: objAcc.Rating = 'Cold'];

    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   }

   @AuraEnabled(cacheable=true)
   public static list<Account> getAccountJuhi(Account objAcc){
    try {

        return [Select Id, Name, Rating, Type, SLA__c From Account Where Name =: objAcc.Name = 'Juhi'];
        
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   }


    @AuraEnabled
    public static list<Account> accountRecordShownByType(Account objAcc){
        try {

            return [Select Id, Name, Type, Rating, SLA__c, CreatedDate From Account Where Type =: objAcc.Type];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}