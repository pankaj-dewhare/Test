// Delete Duplicate Existing Records
trigger AccountTrigger_07 on Account (before insert) {
set<string> accNameSet = new set<string>();
    For(Account objAcc : trigger.new){
        accNameSet.add(objAcc.Name);
    }
    list<Account> accList = [Select Id, Name From Account Where Name IN : accNameSet];
    delete accList;
}