public with sharing class AccountSpecial {
    @AuraEnabled
    public static string accRecordCreation(Account ObjAcc){
        try {

            if(objAcc != null){
            INSERT ObjAcc;
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