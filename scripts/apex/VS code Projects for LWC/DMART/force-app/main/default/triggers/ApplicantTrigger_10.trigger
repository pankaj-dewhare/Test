//] Prevent Applicant Record if PAN Card is not available.
trigger ApplicantTrigger_10 on Applicant__c (before insert, before update) {
    for(Applicant__c objApp : trigger.new){
        if(string.isBlank(objApp.pan_card__c)){
            objApp.AddError('Pan card field filling is compulsory');
        }
    }
}