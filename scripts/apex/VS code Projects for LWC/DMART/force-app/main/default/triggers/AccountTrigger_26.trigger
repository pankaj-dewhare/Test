//Delete Duplicate Existing Records
trigger AccountTrigger_26 on Account (before insert) {
    set<string> accNameSet = new set<String>();
    for(Account objAcc : trigger.new){
        accNameSet.add(objAcc.Name);
    }
    list<Account> accList = [Select Id, Name From Account Where Name IN : accNameSet];
    delete accList;
}