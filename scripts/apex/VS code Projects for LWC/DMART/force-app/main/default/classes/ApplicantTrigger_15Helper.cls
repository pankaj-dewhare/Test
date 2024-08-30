public class ApplicantTrigger_15Helper {
    
    public static void applicantRecordCreation(List<Applicant__c> appList){
        for(Applicant__c objApp : appList){
        if(objApp.gender__c == 'Male'){
            objApp.Special_mark_on_body__c = 'Olala';
        }
        else{
            objApp.Special_mark_on_body__c = 'Yahoo';
        }
    }
    }

}