@isTest
public class ContactTrigger_22TestNew {
    
    
    @isTest
    public static void insertRescordMethod(){
        Account objAcc = new Account(name='Taplow');
        INSERT objAcc;
        
        Date dob = Date.parse('05/10/2000');
        Contact objCon = new contact(FirstName='Narendra', LastName='Modi', Birthdate = dob, AccountId=objAcc.Id);
        INSERT objCon;
        
    }
    
    
    public static testMethod void updateRecordMethod(){
        Account objAcc = new Account(name='Taplow');
        INSERT objAcc;
        
        Date dob = Date.parse('05/10/2000');
        Contact objCon = new contact(FirstName='Narendra', LastName='Modi', Birthdate = dob, AccountId=objAcc.Id);
        INSERT objCon;
        
        objCon.FirstName = 'Pinky';
        objCon.LastName = 'Modi';
        UPDATE objCon;
        
        string actualData = [Select Id, Description From Account Where ID =: objAcc.id].description;
        
        system.assertEquals('Pinky Modi', actualData);
        
    }
    
    public static testMethod void deleteRecordMethod(){
        
        try{
            Date dob = Date.parse('05/10/2000');
            Contact objCon = new contact(FirstName='Narendra', LastName='Modi', Leadsource='Web', Birthdate=dob);
            
            delete [Select ID From Contact Where ID =: objCon.Id];
        }
        catch(Exception e){
            system.assert(e.getMessage().contains('Record can not be deleted if leadsource is web'));
        }
    }
}