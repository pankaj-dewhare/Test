/*User Story 2] If Account Type is “Prospect”, then SLA should be “Gold”. If Type is “Customer - Direct”, 
then SLA should be “Silver”. SLA should be None otherwise.*/
trigger AccountTrigger_37 on Account (before insert, before update, after undelete) {
for(Account objAcc : trigger.new){
if(objAcc.type == 'prospect'){
objAcc.SLA__c = 'Gold';
}else if(objAcc.type == 'Customer - Direct'){
objAcc.SLA__c = 'Silver';
} else{
objAcc.SLA__c = '';
}
}

}