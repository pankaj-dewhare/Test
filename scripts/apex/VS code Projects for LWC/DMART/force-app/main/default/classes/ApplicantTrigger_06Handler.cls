public class ApplicantTrigger_06Handler {

    public static void afterUpdate(List<Applicant__c> appList, map<Id,Applicant__c> appOldList){
        ApplicantTrigger_06Helper.updateApplicantTrigger(appList, appOldList);
    }
}