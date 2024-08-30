trigger ContactTriggerPracticeC2Pself on Contact (before insert, before update, after undelete) {
    set<Id> accIdSet = new set<id>(); // creating a set for getting a ID
    for(Contact objCon : trigger.new){ // whenever user will try to create a new account that record will come here
        if((trigger.isbefore && trigger.isInsert) || (trigger.isAfter && trigger.isUndelete)){
            if(objCon.AccountId != null){
                accIdSet.add(objCon.AccountId);
            }
        }
        if(trigger.isBefore && trigger.isUpdate){
            if(objCon.AccountID != trigger.oldMap.get(objCon.Id).AccountId){
                accIdSet.add(objCon.AccountId);
            }
        }
    }
    
    Map<Id,Account> accMap = New Map<Id,Account>(); // created map for getting key and pair
    For(Account objAcc : [Select Id, Name, count_of_contacts__c, (Select Id From Contacts) From Account Where ID IN : accIdSet]){ //Parent & child query
        accMap.put(objAcc.id, objAcc); // putting all related records in the map
    }
    For(Contact objCon : trigger.new){ //contact iterating again 
        if(accMap.containskey(objCon.AccountId)){ // and finding the related account by using containskey method
            list<Contact> conList =  accMap.get(objCon.AccountId).contacts; // this is the list which we received from query
            if(conList.size()>0){ // write a appropriate logic 
                objCon.AddError('This account already contains a contact..!');
            }
        }
    }
}