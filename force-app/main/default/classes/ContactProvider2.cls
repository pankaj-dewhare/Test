public with sharing class ContactProvider2 {
   @AuraEnabled
   public static void contactCreation(string frstName, string lstName, string emal){
    try {
        
        Contact objCon = New Contact(FirstName = frstName, LastName = lstName, Email = emal);
        
        insert objCon;

    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   }
}