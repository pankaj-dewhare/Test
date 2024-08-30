public with sharing class cRUDInfoProvider {
    
    @AuraEnabled
    public static string AccountrecordInsertMethod(Account objAcc){
        try {

            if(objAcc != null){
            insert objAcc;
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