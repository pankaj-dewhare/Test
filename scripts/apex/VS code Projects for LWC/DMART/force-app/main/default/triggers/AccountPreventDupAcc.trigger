// Prevent to create dup account by Email && phone
trigger AccountPreventDupAcc on Account (before insert, before update, after undelete) {
set<string> accEmailSet = new set<string>();
    set<string> accPhoneSet = new set<string>();
    
    for(Account objAcc : trigger.new){
        if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
            if(objAcc.Name != null){
                accEmailSet.add(objAcc.Email__c);
            }
            if(objAcc.Name != null){
                accPhoneSet.add(objAcc.Phone);
            }
        }
    }
    
    list<Account> accList = [Select Id, Name, Email__c, Phone From Account Where Email__c IN : accEmailSet and Phone IN : accPhoneSet];
    
    for(Account objAcc : trigger.new){
        if(accList.size()>0){
            objAcc.addError('Duplicate Email & phone is not allowed');
        }
    }
}