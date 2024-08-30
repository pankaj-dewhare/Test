//User Story : Create/Edit Contacts. And show Latest Contact Name on Account Description field.
trigger ContactTrigger_23 on Contact (after insert, after update) {
    if(trigger.isBefore && trigger.isInsert){
        ContactTrigger_23Handler.beforeInsert(trigger.new);
    }
    if(trigger.isBefore && trigger.isUpdate){
        ContactTrigger_23Handler.beforeUpdate(trigger.new);
    }
    if(trigger.isAfter && trigger.isInsert){
        ContactTrigger_23Handler.afterInsert(trigger.new);
    }
    
    if(trigger.isAfter && trigger.isUpdate){
        ContactTrigger_23Handler.afterUpdate(trigger.new);
    }
    
    
    
    
}