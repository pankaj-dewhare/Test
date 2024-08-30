
public with sharing class CRUDOperationApexProvider {
    
    @AuraEnabled
    public static void accountInsertMethod(Account objAcc){
        try {
            INSERT objAcc; 
            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
