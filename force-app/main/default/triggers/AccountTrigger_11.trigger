trigger AccountTrigger_11 on Account (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        AccountTrigger_11Handler.afterUpdate(trigger.new, trigger.oldMap);        
    }
}