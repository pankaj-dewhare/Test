public with sharing class contactProvider_4 {
   
    @AuraEnabled
    public static string contactCreationMethod(contact objCon){
        try {

            if(objCon != null){
            Insert objCon;
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