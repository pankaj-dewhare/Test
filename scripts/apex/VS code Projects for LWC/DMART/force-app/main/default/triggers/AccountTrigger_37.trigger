/*If Account Type is “Prospect”, then SLA should be “Gold”. If Type is “Customer - Direct”, 
then SLA should be “Silver”. SLA should be None otherwise.*/
trigger AccountTrigger_37 on Account (before insert, before update) {
    if(trigger.isBefore && trigger.isInsert){
        AccountTrigger_37Handler.accountRecordMethod(trigger.new);
    }
    if(trigger.isBefore && trigger.isUpdate){
        AccountTrigger_37Handler.accountRecordMethod(trigger.new);
    }
   
}