public with sharing class ContactProvider7 {
   
    @AuraEnabled
    public static string newContactCreationMethod(Contact objCon){
        try {
            if(objCon != null){
            INSERT ObjCon;
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
