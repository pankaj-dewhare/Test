// User Story 1] If Applicant Gender is ‘Male’, then Print ‘Olala’ in Special Mark of Body. Else Print ‘Yahoo’.
trigger ApplicantTrigger_0703 on Applicant__c (before insert, before update) {
for(Applicant__c ObjApp : trigger.new){
  if(objApp.gender__c == 'Male'){
       ObjApp.special_mark_on_body__c = 'Olala';
       
       }else{
       ObjApp.special_mark_on_body__c = 'Yahoo';
        }
    }
}