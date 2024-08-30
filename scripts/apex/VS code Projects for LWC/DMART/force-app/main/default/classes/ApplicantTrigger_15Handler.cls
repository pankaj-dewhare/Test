public class ApplicantTrigger_15Handler {

    public static void beforeInsert(list<Applicant__c> appList){
        ApplicantTrigger_15Helper.applicantRecordCreation(appList);
    }
    
    public static void beforeUpdate(list<Applicant__c> appList){
        ApplicantTrigger_15Helper.applicantRecordCreation(appList);
    }
}