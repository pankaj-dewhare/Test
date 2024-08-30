public with sharing class AccRecordInsertClass {
    
    @AuraEnabled
    public static string accRecordInsertMethod(Account objAcc){
        
        system.debug('objAcc ====>'  +objAcc);
        try {
    
            if(objAcc != null){
                system.debug('objAcc ====>'  +objAcc);
                
                insert objAcc;
                
                return 'Account has been created';
    
                }
                else{
                    return 'Something went wrong';
                }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}