public with sharing class accountCreator {
    @AuraEnabled
    public static string accountCreatorMethod(Account objAccount){
        try {
            if(objAccount != null){
            INSERT objAccount;
            return 'Record has been created';
        }
        else{
            return 'Something went wrong';
        }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}