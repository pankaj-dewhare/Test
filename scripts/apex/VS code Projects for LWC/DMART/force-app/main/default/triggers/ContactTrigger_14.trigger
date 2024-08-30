//Create a New Contact for an Account. If Account already contains two Contact, then Prevent to create another new contact
trigger ContactTrigger_14 on Contact (before insert, before update, after undelete) {
    set<Id>accidSet = new set<Id>();
    if(trigger.isInsert || trigger.isUpdate || (trigger.isAfter && trigger.isUndelete)){
        for(Contact objCon : trigger.new){
            if(objCon.AccountId != null){
                accidSet.add(objCon.AccountId);
            }
        }
    }
    Map<Id,Account> accMap = New Map<Id,Account>();
    if(!accIdSet.isEmpty()){
        For(Account objAcc : [Select Id, (Select ID From Contacts) From Account Where ID IN : accIdSet]){
            accMap.put(objAcc.id,ObjAcc);
        }
    }
    if(!accMap.isEmpty()){
        for(Contact objCon : trigger.new){
            if(accMap.containskey(objCon.AccountId)){
                List<Contact> conList = accMap.get(objCon.AccountId).contacts;
                if(conList.size() > 2){
                    objCon.AddError('More than two contacts is not allowed on single account');
                }
            }
        }
    }
}