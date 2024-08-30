//Create / Update a Case record.  If Priority is “High”, then Case Violation should be “Yes”.
trigger CaseTrigger_01 on Case (before insert, before update) {
    For(Case objCase : trigger.new){
            if(!string.isBlank(objCase.priority)){
                if(objCase.priority == 'High'){
                    objCase.SLAViolation__c = 'Yes';
                }
                
        else{
              objCase.SLAViolation__c = '';
        }
    }
    }
}