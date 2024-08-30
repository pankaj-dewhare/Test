//Account description is updated then its related contact description to be updated on same time
trigger AccountTrigger_36 on Account (after update) {
    
    if(trigger.isAfter && trigger.isUpdate){
        AccountTrigger_36Handler.contactDescriptionUpdate(trigger.new);
    }
}