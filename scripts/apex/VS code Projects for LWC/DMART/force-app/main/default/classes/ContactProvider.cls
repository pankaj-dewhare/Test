//Create a new Contact. (First Name, Last Name, Email ID).
public with sharing class ContactProvider {
    
    @AuraEnabled
    public static string createNewContact(Contact objCon){
        try {

        if(objCon != null){
         insert objCon;
         return 'Record has been created';
        }
        else{
            return 'Something went wrong';
        }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static string getfield(string accId){
        try {

            return [Select ID, type From Account Where ID =: accId].type;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}