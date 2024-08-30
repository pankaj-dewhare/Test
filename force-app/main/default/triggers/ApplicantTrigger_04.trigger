trigger ApplicantTrigger_04 on Applicant__c (before insert) {
    For(Applicant__c objApp : trigger.new){
        if(!string.isBlank(objApp.gender__c)){
            if(objApp.gender__c == 'Male'){
                objApp.police_verification__c = true;
            }
        }
    }
}