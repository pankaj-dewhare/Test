//Delete Account Duplicate Existing Records
trigger AccountDuplicateTrigger on Account (before insert) {
set<string> accNameSet = new set<string>();
    for(Account objAcc : trigger.new){
        accNameSet.add(objAcc.Name);
    }
    
     list<Account> accList = [Select Id, Name From Account Where Name IN : accNameSet];
    delete accList;
}