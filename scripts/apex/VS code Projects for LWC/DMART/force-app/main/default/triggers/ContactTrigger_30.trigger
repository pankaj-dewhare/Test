// Prevent to create 2 contacts of an account
trigger ContactTrigger_30 on Contact (before insert, before update, after undelete) {
    
    if(trigger.isBefore && trigger.isInsert){
         ContactTrigger_30Handler.contactPreventMethod(trigger.new);
    }
    
     if(trigger.isBefore && trigger.isUpdate){
        ContactTrigger_30Handler.contactPreventMethod(trigger.new);
    }
    
     if(trigger.isAfter && trigger.isUndelete){
        ContactTrigger_30Handler.contactPreventMethod(trigger.new);
    }
    
    
}