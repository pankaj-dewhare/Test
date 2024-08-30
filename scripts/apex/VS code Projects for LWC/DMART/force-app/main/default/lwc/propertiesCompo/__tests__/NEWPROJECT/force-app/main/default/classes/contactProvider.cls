public with sharing class contactProvider {
    
    @AuraEnabled
    public static void contactCreationMethod(string frstName, string lstName, string eml){
        try {

            contact objCon = new contact(FirstName = frstName, LastName=lstName, Email=eml);
            INSERT objCon;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}