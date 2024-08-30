//Create / Update a Case record.  If Priority is “High”, then Case Violation should be “Yes”.

trigger CaseTrigger_05 on case(before insert, before update){
    For(Case objCase : trigger.new){
        if(!string.isBlank(objCase.Priority)){
            if(objCase.priority == 'High'){
                objCase.SLAViolation__c = 'Yes';
            }
        }
    }
}