//User story 3 :  Create a field “Count of case” on Account Object. Show Total number of cases in the Count of cases field of respective Account.
trigger CaseTrigger_03 on Case (after insert, after update, after delete, after undelete) {
    set<Id> accIdSet = new set<Id>();
    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate || trigger.isUndelete)){
        for(Case objCase : trigger.new){
            accIdSet.add(objCase.AccountId);
        }
    }
    if(trigger.isAfter && (trigger.isUpdate || trigger.isDelete)){
        for(Case objCase : trigger.old){
            accIdSet.add(objCase.AccountId);
        }
    }
    
    map<Id, Account> accMap = new map<Id, account>();
    
    for(Account objAcc : [Select Id, Name, Count_Of_Case__c, (Select Id, Priority From Cases) From Account Where ID IN : accIdSet]){
    list<Case> caseList = objAcc.cases;
        objAcc.Count_Of_Case__c = caseList.size();
        accMap.put(objAcc.id, objAcc);        
      }
    if(!accMap.isEmpty()){
      database.update(accMap.values(), false);  
    }
    
}