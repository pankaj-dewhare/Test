@isTest
public class ContactTrigger_23TestClass {
    
    public static testMethod void testInsertMethod(){
        Account objAcc = new Account(Name='Accenture');
        Database.insert(objAcc, false);
        
        
        Contact objCon = new Contact(FirstName='Raju', LastName='Deshmukh', AccountID=objAcc.id);
        Database.insert(objCon,false);
        
        string actualDescription = [Select Id, Description From Account Where ID =: objAcc.Id].description;
        system.assertEquals('Raju Deshmukh', actualDescription);
        
    }
    
    public static testMethod void testElseMethod(){
        
        Account objAcc = new Account(Name='Accenture');
        Database.insert(objAcc, false);
        
        Contact objCon = new Contact(FirstName='Subhash', LastName='Gujar', AccountID=objAcc.id);
        Database.insert(objCon,false);
        
        string actualDescription = [Select Id, Description From Account Where ID =: objAcc.Id].description;
        system.assertEquals('Raju Deshmukh' +''+ 'Subhash Gujar', actualDescription);
    }
    
    public static testMethod void testUpdateMethod(){
        Account objAcc = new Account(Name='Accenture');
        Database.insert(objAcc, false);
        
        Contact objCon = new Contact(FirstName='Subhash', LastName='Gujar', AccountID=objAcc.id);
        Database.insert(objCon,false);
        
        objCon.FirstName = 'Sharad';
        objCon.LastName = 'Pawar';
        objCon.AccountId = objAcc.id;
        Database.update(objCon, false);
        
        string actualFirstName = [Select Id, Description From Account Where ID =: objAcc.Id].Description;
        
        System.assertEquals('Sharad Pawar', actualFirstName);
    }
}