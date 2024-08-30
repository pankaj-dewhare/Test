trigger PassportTrigger on Passport__c (before insert, before update) {
    For(Passport__c objPass : trigger.new){
        if(objPass.status__c == 'Hold'){
           objPass.status__c.AddError('Not Allowed'); 
        }
    }
}