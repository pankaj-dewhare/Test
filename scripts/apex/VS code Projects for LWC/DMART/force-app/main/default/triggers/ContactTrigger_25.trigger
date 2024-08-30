//Prevent Duplicate leadsource of an account
trigger ContactTrigger_25 on Contact (before insert, before update, after undelete) {
    set<id> accIdSet = new set<Id>();
    For(Contact objCon : trigger.new){
        if((trigger.isInsert && trigger.isBefore) && (trigger.isAfter && trigger.isUndelete) ){
        accIdSet.add(objCon.AccountId);           
        }
        if(trigger.isBefore && trigger.isUpdate){
            if(objCon.LeadSource != trigger.oldMap.get(objCon.id).LeadSource){
                accIdSet.add(objCon.AccountId);
            }
        }
    }
    Map<Id,Account> accMap = New Map<Id,Account>();
    For(Account objAcc : [Select Id, Name, (Select Id, Leadsource From Contacts) From Account Where ID IN : accIdSet]){
        accMap.put(objAcc.Id, objAcc);
    }
    For(Contact objCon : trigger.new){
        if(accMap.containskey(objCon.AccountId)){
            list<Contact> conList = accMap.get(objCon.AccountId).contacts;
            
            For(Contact existingObjConRecord : conList){
                if(objCon.Leadsource == existingObjConRecord.leadSource){
                    objCon.AddError('Duplicate leadsource value is not allowed');
                }
            }
        }
    }
}