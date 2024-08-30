//If Account Type is “Prospect”, then SLA should be “Gold”. If Type is “Customer - Direct”, then SLA should be “Silver”. SLA should be None otherwise.
trigger AccountTrigger on Account (before insert, before update, before delete) {
    if(trigger.isBefore && trigger.isInsert){
    AccountTriggerHandler.beforeInsert(trigger.new);      
    }
    if(trigger.isBefore && trigger.isUpdate){
        AccountTriggerHandler.beforeUpdate(trigger.new);   
    }
    if(trigger.isBefore && trigger.isDelete){
        AccountTriggerhelper.preventAccoutSLA(trigger.old);
    }
}