//Prevent Applicant Record if PAN Card is not available.
trigger ApplicantTrigger_02 on Applicant__c (before insert, before update) {
    For(Applicant__c objApp : trigger.new){
        if(string.isBlank(objApp.Pan_card__c)){
            objApp.addError('Pan card is mandatory');
        }
    }
}