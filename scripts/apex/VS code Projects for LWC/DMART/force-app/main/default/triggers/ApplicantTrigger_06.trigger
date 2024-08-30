//If Applicant is eligible for Police Verification and Male, then update All the addresses city as “Nagpur” only if the Address Pin Code starts with “44”.
trigger ApplicantTrigger_06 on Applicant__c (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        ApplicantTrigger_06Handler.afterUpdate(trigger.new, trigger.oldMap);
    }
}