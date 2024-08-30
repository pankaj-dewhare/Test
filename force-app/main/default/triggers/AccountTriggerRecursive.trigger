trigger AccountTriggerRecursive on Account (before insert) {

    if(trigger.isBefore && trigger.isInsert){
        AccountTriggerRecursiveHandler.beforeInsert(trigger.new);
    }
    
}