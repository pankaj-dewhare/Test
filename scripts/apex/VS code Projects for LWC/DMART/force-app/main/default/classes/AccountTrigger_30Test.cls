@isTest
public class AccountTrigger_30Test {
    
    @isTest
    public static void insertMethod(){
        Account objAcc = new Account(Name = 'Ganesh sir', Rating = 'Hot');
        INSERT ObjAcc;
        
        string actualData = [Select Id, Name, Rating, Type From Account Where ID  =: objAcc.id].Type;
        
        system.assertEquals('Prospect', actualData);
    }
    
    public static testMethod void updateMethod(){
        //INSERT Start
        Account objAcc = new Account(Name = 'Ganesh sir', Rating = 'Hot');
        INSERT ObjAcc;
        //INSERT END
        
        //UPDATE Start
        objAcc.Name = 'Ganesh Sir';
        objAcc.Rating = 'Warm';
        UPDATE objAcc;
        //UPDATE End
        
        string actualDate = [Select Id, Name, Rating, Type From Account Where ID =: objAcc.id].Type;
        
        system.assertEquals(null, actualDate);
     
        
        
    }
    
    public static testMethod void negativeMethod(){
        Account objAcc = new Account(Name = 'Ganesh sir' , Rating = 'Warm');
        INSERT ObjAcc;
        
        string actualData = [Select Id, Name, Rating, Type From Account Where ID  =: objAcc.id].Type;
        
        system.assertEquals(null , actualData);
    }
    
    public static testMethod void emptyMethod(){
        Account objAcc = new Account(Name = 'Ganesh sir' , Rating = null);
        INSERT ObjAcc;
        
        string actualData = [Select Id, Name, Rating, Type From Account Where ID  =: objAcc.id].Type;
        
        system.assertEquals(null , actualData);
    }

}