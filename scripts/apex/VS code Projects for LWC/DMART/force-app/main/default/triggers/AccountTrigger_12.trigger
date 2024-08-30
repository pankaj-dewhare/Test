/*User Story 1] When Account’s Type is “Technology Partner”, 
then update all the Contact’s LeadSource as “Web” and Level should be “Primary”. Else none. parent to child traverse*/

trigger AccountTrigger_12 on Account (after update) {
map<Id,Account> accMap = new map<Id,Account>();
For(Account objAcc : trigger.new){
if(trigger.isAfter && trigger.isUpdate){
if(objAcc.type != trigger.oldMap.get(objAcc.id).type){
    accMap.put(objAcc.id, objAcc);
         }
      }
   }
   list<Contact> conList = New list<Contact>();
   if(!accMap.isEmpty()){
   for(Contact objCon : [Select Id, LeadSource, Level__c From Contact Where AccountId IN : accMap.keySet()]){
    conList.add(objCon);
       }
   }
   if(!conList.isEmpty()){
   for(Contact objCon : conList){
   if(accMap.containskey(objCon.AccountId)){
   if(accMap.get(objCon.AccountId).type == 'Technology Partner'){
   objCon.Leadsource = 'Web';
   objCon.Level__c = 'Primary';
               }
               else{
                objCon.Leadsource = '';
                objCon.Level__c = '';
               }
           }
       }
       database.update(conList,false);
   }
}