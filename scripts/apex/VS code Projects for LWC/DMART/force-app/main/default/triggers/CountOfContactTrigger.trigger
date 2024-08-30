trigger CountOfContactTrigger on Contact (after insert, after update, after delete, after undelete) {

    if(trigger.isAfter && trigger.isInsert){
        
    }
    
    if(trigger.isAfter && trigger.isUpdate){
        
    }
    
    if(trigger.isAfter && trigger.isDelete){
        
    }
    
    if(trigger.isAfter && trigger.isUndelete){
        
    }
}