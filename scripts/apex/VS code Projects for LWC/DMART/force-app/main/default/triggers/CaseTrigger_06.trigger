//] If we create/Edit a Case having Priority as “High” or “Medium”, then Update its related Account Rating as “Hot”. Else nothing
trigger CaseTrigger_06 on Case (after insert, after update) {
    set<Id> accIdSet = new set<Id>();
    for(Case objCase : trigger.new){
        accIdSet.add(objCase.AccountId);
    }
    map<Id,Account> accMap = new map<Id,Account>();
    for(Account objAcc : [Select Id, Rating From Account Where ID IN : accIdSet]){
        accMap.put(objAcc.id,objAcc);
    }
    for(Case objCase : trigger.new){
        if(accMap.containskey(objCase.AccountId)){
            if(objCase.priority == 'High' || objCase.priority == 'Medium'){
                accMap.get(objCase.accountId).rating = 'Hot';
            }
            else{
                accMap.get(objCase.accountId).rating = '';
            }
        }
    }
    if(!accMap.isEmpty()){
        database.update(accMap.values(), false);
    }
}