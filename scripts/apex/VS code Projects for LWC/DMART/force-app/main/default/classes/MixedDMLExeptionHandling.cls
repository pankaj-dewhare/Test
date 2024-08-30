public class MixedDMLExeptionHandling {
    
    public static void mixedDMLExceptionHandlingMethod(){
        
        //this method will perform DML on setup and non setup objects
        
        Account objAcc = new Account();
        objAcc.Name = 'DML Exception Test';
        INSERT ObjAcc; 
        system.debug('Record is inserted'); // Non set up object record insertion
        
        userCreationMethod();
    }
    
    @future
    public static void userCreationMethod(){
        //Inserting user record
        profile p = [Select Id From profile Where Name = 'Standard User'];
        UserRole r = [Select Id From UserRole Where Name = 'CEO'];
        
        //Creating user here...
        User createUser = new user();
        
        createUser.alias = 'pankd';
        createUser.email='pankaj.dewhare116@gmail.com';
        createUser.emailencodingkey='UTF-8';
        createUser.LastName = 'Pasare';
        createUser.languagelocalekey='en_US';
        createUser.LocaleSidKey = 'en_US';
        createUser.profileid = p.Id;
        createUser.userroleid = r.Id;
        createUser.timezonesidkey='America/Los_Angeles';
        createUser.username='p116@gmail.com';
       
        INSERT createUser;
        system.debug('User record insert here='+createUser);
    }

}