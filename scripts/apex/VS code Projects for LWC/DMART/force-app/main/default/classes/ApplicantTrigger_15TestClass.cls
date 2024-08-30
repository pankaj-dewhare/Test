@isTest
public class ApplicantTrigger_15TestClass {
    
    @isTest
    public static void testApplicantRecord(){
        Applicant__c objApp = new Applicant__c();
            objApp.Gender__c = 'Male';
            Database.insert(objApp, false);
        
        string actualSpecialMarkOnBody = [Select Id, Name, Gender__c, special_mark_on_body__c From Applicant__c Where ID =: objApp.Id].Special_mark_on_body__c;
        system.assertEquals('Olala', actualSpecialMarkOnBody);
        
        
    }
    
    public static testMethod void testApplicantRecordElse(){
        Applicant__c objApp = new Applicant__c();
        objApp.Gender__c = 'Female';
        Database.Insert(objApp, false);
        
        string actualSpecialMarkOnBody = [Select Id, Name, Gender__c, Special_mark_on_body__c From Applicant__c Where ID =: objApp.Id].Special_mark_on_body__c;
        system.assertEquals('Yahoo', actualSpecialMarkOnBody);
        
    }
    
    public static testMethod void testApplicationRecordUpdate(){
        //INSERT Start
        Applicant__c objApp = new Applicant__c();
        objApp.Gender__c = 'Male';
        Database.Insert(objApp, false);
        //INSERT End
        
        objApp.Gender__c = 'Female';
        Database.update(objApp, false);
        
        string actualUpdateData = [Select Id, Name, Gender__c, Special_mark_on_body__c From Applicant__c Where ID =: objApp.Id].Special_mark_on_body__c;
        system.assertEquals('Yahoo', actualUpdateData);
    }

}