public class showObjectDetailsGyaan {

    public static list<Applicant__c> applicantDataShow(){
        
        list<Applicant__c> appList = new list<Applicant__c>();
        
        appList = [Select Id, Name, Email__c, First_Name__c, Mobile_No__c, Pan_Card__c From Applicant__c];
        
        return appList;
    }
}