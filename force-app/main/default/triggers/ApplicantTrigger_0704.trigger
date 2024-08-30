/*Prefix ‘Mr.’ if Gender is Male, Prefix ‘Ms.’ If Gender is “Female”.
Show Error if Gender is “Transgender”.*/
trigger ApplicantTrigger_0704 on Applicant__c (before insert, before update) {
    For(Applicant__c objApp : trigger.new){
        if(!String.isBlank(objApp.gender__c) && !objApp.First_Name__c.startswith('Mr.')){
            if(objApp.gender__c == 'Male'){
                objApp.First_Name__c = 'Mr.'+objApp.First_Name__c;
            }
            else{
                if(objApp.Gender__c == 'Female' && !objApp.First_Name__c.startswith('Ms.')){
                    objApp.First_name__c = 'Ms.'+objApp.First_Name__c;
                }
                else{
                    if(objApp.gender__c == 'Transgender'){
                        objApp.First_name__c.AddError('Transgender is not allowed');
                    }
                }
            }
        }
    }
}