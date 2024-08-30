//Prevent an duplicate opportunity for an Account
trigger OpportunityTrigger_20 on Opportunity (before insert, before update, after undelete) {
    
    if(trigger.isBefore && trigger.isInsert){
        OpportunityTrigger_20Handler.beforeInsert(trigger.new);
    }
    if(trigger.isBefore && trigger.isUpdate){
        OpportunityTrigger_20Handler.beforeUpdate(trigger.new);
    }
    if(trigger.isBefore && trigger.isUndelete){
        OpportunityTrigger_20Handler.afterUndelete(trigger.new);
    }
}