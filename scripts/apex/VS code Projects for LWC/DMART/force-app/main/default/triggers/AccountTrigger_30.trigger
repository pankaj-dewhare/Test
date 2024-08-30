//1] If Account Rating is Hot, then Type should be ‘Prospect’. Else Type should be nothing.
trigger AccountTrigger_30 on Account (before insert, before update) {
    
    if(trigger.isInsert && trigger.isBefore){
        AccountTrigger_30Handler.beforeInsert(trigger.new);
    }
    
    if(trigger.isUpdate && trigger.isBefore){
        AccountTrigger_30Handler.beforeUpdate(trigger.new);
    }
}