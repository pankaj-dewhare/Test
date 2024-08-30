trigger ApplicantTrigger_15 on Applicant__c (before insert, before update) {
    
    if(trigger.isBefore && trigger.isInsert){
        ApplicantTrigger_15Handler.beforeInsert(trigger.new);
    }
    
    if(trigger.isBefore && trigger.isUpdate){
        ApplicantTrigger_15Handler.beforeUpdate(trigger.new);
    }
}