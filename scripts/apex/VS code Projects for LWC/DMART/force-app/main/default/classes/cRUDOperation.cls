public with sharing class cRUDOperation {
    
    @AuraEnabled
    public static string accountRecordCreation(){
        try {
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}