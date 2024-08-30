trigger AccountTrigger_38 on Account (before insert) {
    set<string> accNameSet = new set<string>();
    set<string> accPhoneSet = new set<string>();
    for(Account objAcc : trigger.new){
        accNameSet.add(objAcc.Name);
        accPhoneSet.add(objAcc.phone);
    }
    
    Map<String,Account> accMap = new Map<string,Account>();
        list<Account> accList = new list<Account>();
    
    for(Account objectAcc : [Select Id, Name, Phone From Account Where Name IN : accNameSet and Phone IN : accPhoneSet]){
       accList.add(objectAcc);
    }
    For(Account objAcc : trigger.new){
       if(accList.size()>0){
       
            objAcc.addError('Duplicate Account and phone is not allowed...! ');
        } 
    }
}