// Create/Edit contact contact name to be reflect in Account description
trigger ContactTrigger_22 on Contact (after insert, after update, before delete) {
   if(trigger.isBefore && trigger.isDelete){
        ContactTrigger_22Handler.beforeDelete(trigger.old);
    }
    if(trigger.isAfter && trigger.isInsert){
        ContactTrigger_22Handler.afterInsert(trigger.new);
    }
    
    if(trigger.isAfter && trigger.isUpdate){
         ContactTrigger_22Handler.afterUpdate(trigger.new);
    }
    
    
}