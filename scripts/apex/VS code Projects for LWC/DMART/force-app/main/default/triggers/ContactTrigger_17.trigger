//if parent is having a more than 2 child then show error for third child
trigger ContactTrigger_17 on Contact (before insert, before update, after undelete) {
    set<Id> accIdSet = new set<Id>();
    for(Contact objCon : trigger.new){
        if(trigger.isBefore && trigger.isInsert){
            if(objCon.AccountId != null){
                accIdSet.add(objCon.AccountId);
            }
        }
        if(trigger.isBefore && trigger.isUpdate){
            if(objCon.AccountId != trigger.oldMap.get(objCon.id).accountId){
                accIdSet.add(objCon.AccountId);
            }
        }
        
    }
    map<id,Account> accMap = new map<id,Account>();
    if(!accIdSet.isEmpty()){
    for(Account objAcc : [Select Id, Name, (Select Id From Contacts) From Account Where ID IN : accIdSet]){
        accMap.put(objAcc.id,objAcc);
    }
        }
    for(Contact objCon : trigger.new){
        if(accMap.containskey(objCon.AccountId)){
            List<Contact> conList = accMap.get(objCon.AccountId).Contacts;
            if(conList.size()>1){
                objCon.AddError('More than 2 contacts is  not allowed');
            }
        }
    }
}