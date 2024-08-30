public class ContactTrigger_30Handler {
    
    public static void contactPreventMethod(list<Contact> conListNew){
        set<Id> accIdSet = new set<Id>();
        if(Trigger.isInsert || trigger.isUpdate || trigger.isUndelete ){
            For(Contact objCon : conListNew){
                if(objCon.AccountId != null){
                    accIdSet.add(objCon.AccountId);
                }
            }
        }
        
        Map<Id,Account> accMap = New Map<Id,Account>();
        for(Account objAcc : [Select Id, Name, (Select Id, Name From Contacts) From Account Where ID IN : accIdSet]){
            accMap.put(objAcc.id,objAcc);
        }
        for(Contact objCon : conListNew){
            if(accMap.containskey(objCon.AccountId)){
                list<Contact> conList = accMap.get(objCon.AccountId).contacts;
                if(conList.size()>1){
                    objCon.AddError('More than 2 contacts is not allowed for an single account');
                }            
            }
        }
        
    }
    
}