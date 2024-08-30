trigger ContactTrigger_06 on Contact (after insert, after update) {
   /* if(trigger.isAfter && trigger.isInsert){
        ContactTrigger_06Handler.afterInsert(trigger.new);
    }
    if(trigger.isAfter && trigger.isUpdate){
        ContactTrigger_06Handler.afterUpdate(trigger.new, trigger.oldMap);
    }*/
    if(trigger.isBefore && trigger.isInsert){
        ContactTrigger_06Handler.beforeInsert(trigger.new);
    }
    if(trigger.isBefore && trigger.isUpdate){
        ContactTrigger_06Handler.beforeUpdate(trigger.new, trigger.oldMap);
    }
    if(trigger.isAfter && trigger.isUndelete){
        ContactTrigger_06Handler.afterUndelete(trigger.new);
    }
}