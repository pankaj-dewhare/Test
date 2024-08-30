/*User Story 3] Prefix ‘Mr.’ if Gender is Male, Prefix ‘Ms.’ If Gender is “Female”.
Show Error if Gender is “Transgender”.*/
trigger ApplicantTrigger_1 on Applicant__c (before insert, before update) {
    for(Applicant__c objApp : trigger.new){
        if(string.isNotBlank(objApp.Gender__c) && string.isNotBlank(objApp.First_Name__c)){
            if(objApp.gender__c == 'Male' && !objApp.First_Name__c.startswith('Mr.')){
                objApp.First_name__c = 'Mr. '+ objApp.First_name__c;
            }else{
                if(objApp.gender__c == 'Female' && !objApp.First_Name__c.startswith('Ms.')){
                    objApp.First_Name__c = 'Ms. '+  objApp.First_Name__c;
                }
                else{
                    objApp.AddError('Transgender is not allowed');
                }
            }
        }
    }
}