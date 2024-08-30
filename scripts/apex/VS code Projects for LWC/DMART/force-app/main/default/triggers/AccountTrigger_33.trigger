trigger AccountTrigger_33 on Account (before insert, before update) {
    if(trigger.isBefore && trigger.isDelete){
        AccountTrigger_33Handler.beforeDelete(trigger.old);
    }
    if(trigger.isBefore && trigger.isInsert){
        AccountTrigger_33Handler.beforeInsert(trigger.new);
    }
    if(trigger.isBefore && trigger.isUpdate){
        AccountTrigger_33Handler.beforeUpdate(trigger.new, trigger.oldMap);
    }
    
}