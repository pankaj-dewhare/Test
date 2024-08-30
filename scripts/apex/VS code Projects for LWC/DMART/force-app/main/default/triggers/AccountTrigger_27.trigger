//Create a New Account / Update an Account Name. If this Account Name already exists into the Database, then Prevent It (Error).
trigger AccountTrigger_27 on Account (before insert, before update) {
    set<string> accNameSet = new set<string>();
    For(Account objAcc : trigger.new){
        accNameSet.add(objAcc.Name);
    }
    
    list<Account> accList = [Select Id, Name From Account Where Name IN : accNameSet];
    
    For(Account objAcc : trigger.new){
        if(accList.size()>0){
            objAcc.AddError('Duplicate name found');
        }
    }
}