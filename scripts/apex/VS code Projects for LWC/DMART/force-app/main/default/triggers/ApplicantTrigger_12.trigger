//Create a new Applicant Record. Applicant should be eligible for Police Verification, if Gender is “Male”.
trigger ApplicantTrigger_12 on Applicant__c (before insert) {
    for(Applicant__c objApp : trigger.new){
        if(string.isNotBlank(objApp.gender__c)){
            if(objApp.gender__c == 'Male'){
                objApp.police_verification__c = true;
            }
        }
    }
}