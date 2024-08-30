trigger ApplicantTrigger_16 on Applicant__c (before insert, before update) {
    if(trigger.isBefore && trigger.isInsert){
        ApplicantTrigger_16Handler.applicantRecordsMethod(trigger.new);
        ApplicantTrigger_16Handler.applicantRecord(trigger.new);
    }
    if(trigger.isBefore && trigger.isUpdate){
        ApplicantTrigger_16Handler.applicantRecordsMethod(trigger.new);
        ApplicantTrigger_16Handler.applicantRecord(trigger.new);
    }
}