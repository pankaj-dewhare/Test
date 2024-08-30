//User Story 2] Prevent Duplicate Address of Same City for an Applicant only if, Applicant is Eligible for Police Verification.
trigger AddressTrigger_02 on Address__c (before insert, before update, after undelete) {
    if(trigger.isBefore && trigger.isInsert){
        AddressTrigger_02Handler.beforeInsert(trigger.new);
    } 
    if(trigger.isBefore && trigger.isUpdate){
        AddressTrigger_02Handler.beforeUpdate(trigger.new);
    } 
    if(trigger.isAfter && trigger.isUndelete){
        AddressTrigger_02Handler.afterUndelete(trigger.new);
    }
}