trigger ApplicantTrigger_09 on Applicant__c (before insert, before update) {
    
    for(Applicant__c objApp : trigger.new){
        if(objApp.gender__c == 'Male'){
            objApp.Special_mark_on_body__c = 'Olala';
        }else{
            objApp.Special_mark_on_body__c = 'Yahoo';
        }
    }
}