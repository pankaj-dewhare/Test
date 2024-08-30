/*User Story 1] Create / Edit the Contact. If It’s respective Account Rating is “Hot”, 
then Contact’s Level set to the “Primary”. Else keep blank.*/
trigger ContactTrigger10 on Contact (before insert, before update) {
set<Id> accIdSet = new set<Id>();
for(Contact ObjCon : trigger.new){
if(trigger.isBefore && trigger.isInsert){
if(objCon.AccountID != null){
accIdSet.add(objCon.AccountId);
     }
  }
if(trigger.isBefore && trigger.isUpdate){
if(objCon.Level__c != trigger.oldMap.get(objCon.Id).level__c){
accIdSet.add(objCon.AccountID);
           }
        }
    }

    map<Id,Account> accMap = new map<Id,Account>();
    if(!accIdSet.isEmpty()){
    for(Account objAcc : [Select Id, rating From Account Where ID IN : accIdSet]){
        accMap.put(objAcc.id,Objacc);
       }
    }
    for(Contact objCon : trigger.new){
    if(accMap.containskey(objCon.AccountId)){
        if(accMap.get(objCon.AccountiD).rating == 'Hot'){
objCon.level__c = 'Primary';
        }
        else{
            objCon.level__c = '';
        }

}
    }
}