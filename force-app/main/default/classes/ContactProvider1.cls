public with sharing class ContactProvider1 {
    @AuraEnabled
    public static void contactCreation(string firstName, string lastName, string emailId){
        try {

            Contact objCon = new Contact(FirstName = firstName, LastName = lastName, Email = emailId);
            insert objCon;

            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static list<Contact> contactRecordShowInDataTable(Contact objCon){
        try {
            
            return [Select Id, Name, FirstName, LastName, Email, Phone From Contact Where LastName =: objCon.LastName+'%'];

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}