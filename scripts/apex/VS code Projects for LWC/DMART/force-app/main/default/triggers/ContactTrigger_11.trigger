/*Create a New Contact for an Account. If Account already contains a Contact, then Prevent to create another new contact.*/
trigger ContactTrigger_11 on Contact (before insert, before update, After undelete) {
set<Id> accIdSet = new set<Id>();
if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
For(Contact objCon : trigger.new){
    accIdSet.add(objCon.AccountId);
      }
   }
   Map<Id,Account> accMap = new map<Id,Account>();
   For(Account objAcc : [Select Id, Name, (Select ID From Contacts)From Account Where ID IN : accIdSet]){
   accMap.put(objAcc.id,objAcc);
   }
   for(Contact objCon : trigger.new){
   if(accMap.ContainsKey(objCon.AccountId)){
   list<Contact> conList = accMap.get(objCon.AccountId).Contacts;
   if(conList.size()> 0 ){
    objCon.AddError('This account already contains a contact');
       }
     }
   }
}