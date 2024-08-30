public class ApplicantTrigger_16Handler {
    //If Applicant Gender is ‘Male’, then Print ‘Gmail’ in Special Mark of Body. Else Print ‘Yahoo’.
    public static void applicantRecordsMethod(list<Applicant__c> appList){
        For(Applicant__c objApp : appList){
            if(objApp.Gender__c == 'Male'){
                objApp.Special_mark_on_body__c = 'Gmail';
            }else{
                objApp.Special_mark_on_body__c = 'Yahoo';
            }
        }
    }
    
    //Prefix ‘Mr.’ if Gender is Male, Prefix ‘Ms.’ If Gender is “Female”. Show Error if Gender is “Transgender”.
    public static void applicantRecord(list<Applicant__c> appErrorList){
        for(Applicant__c objApp : appErrorList){
            if(objApp.Gender__c == 'Male' && !objApp.First_Name__c.startswith('Mr.')){
                objApp.First_Name__c = 'Mr.'+objApp.First_Name__c;
            }else if(objApp.Gender__c == 'Female' && objApp.First_Name__c.startswith('Ms.')){
                objApp.First_Name__c = 'Ms.'+objApp.First_Name__c;
            }else if(objApp.Gender__c == 'Transgender”'){
                objApp.AddError('Transgender is not allowed fro the process');
            }
        }
    }
    
}