// If we create/edit a Case having Priority as “High” or “Medium”, then Update its related Account Rating as “Hot”. Else nothing
trigger CaseTrigger_02 on Case (after insert, after update) {
    set<Id> accIdSet = new set<Id>();
    For(Case objCase : trigger.new){
        accIdSet.add(objCase.AccountId);
    }
    Map<Id,Account> accMap = new Map<Id,Account>();
    for(Account objAcc : [Select Id, rating From Account Where ID IN : accIdSet]){
        accMap.put(objAcc.id, objAcc);
    }
    For(Case objCase : trigger.new){
        if(accMap.containskey(objCase.AccountId)){
            if(objCase.Priority == 'High' || objCase.Priority == 'Medium'){
                accMap.get(objCase.AccountId).rating = 'Hot';
            }
            else{
                accMap.get(objCase.AccountId).rating = '';
            }
        }
    }
    if(!accMap.isEmpty())
        database.update(accMap.values(),false);
}