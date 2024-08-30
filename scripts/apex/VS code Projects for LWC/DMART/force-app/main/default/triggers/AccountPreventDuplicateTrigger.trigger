trigger AccountPreventDuplicateTrigger on Account (before insert, before update) {
    /*set<string> accNameSet = new set<string>();
    for(Account objAcc : trigger.new){
        accNameSet.add(objAcc.Name);
    }
    
    list<Account> accList = [Select Id, Name From Account Where Name IN : accNameSet];
    
    for(Account objAcc : trigger.new){
        if(accList.size()>0){
            objAcc.Name.AddError('Duplicate Account Found newly trigger created');
        }
    }*/
    
    set<string> accNameSet = new set<string>();
    for(Account objAcc : trigger.new){
        accNameSet.add(objAcc.Name);
    }
    
    map<String,Account> accMap = new map<String,Account>();
    list<Account> accList = [Select Id, Name From Account Where Name IN : accNameSet];
    
    for(Account objAcc : accList){
        accMap.put(objAcc.Name, objAcc);
    }
    
    for(Account objAcc : trigger.new){
        if(accMap.containskey(objAcc.Name)){
            objAcc.AddError('Duplicate Account Name found created by new map trigger' );
        }
    }
    
    
}