/*User Story 1] If Account Type is set to the “Prospect”, 
and If Account’s Opp Amount is less than 10000, then copy its Opp Name in ACCOUNT’S Description.*/
trigger AccountTrigger_13 on Account (before update) {
map<id,Account> accMap = new map<Id,Account>();
for(Account objAcc : trigger.new){
    if(trigger.isBefore && trigger.isUpdate){
if(objAcc.type != trigger.oldMap.get(objAcc.id).type){
    accMap.put(objAcc.id,objAcc);
          }
       }
   }
   list<Opportunity> oppList = new list<Opportunity>();
   if(!accMap.isEmpty()){
   for(Opportunity objOpp : [Select Id, Amount, Name From Opportunity Where AccountId IN : accMap.keySet()]){
    oppList.add(objOpp);
   }
   for(Opportunity objOpp : oppList){
   if(accMap.containskey(objOpp.AccountId)){
   if(accMap.get(objOpp.AccountId).type == 'Prospect' && objOpp.Amount < 10000){
   if(String.isBlank(accMap.get(objOpp.AccountID).Description)){
   accMap.get(objOpp.AccountId).description = objOpp.Name;
                   }
                   else{
                    accMap.get(objOpp.AccountId).description = accMap.get(objOpp.AccountId).description+ '\n' + objOpp.Name;
                   }
               }
           }
       }
    }

}