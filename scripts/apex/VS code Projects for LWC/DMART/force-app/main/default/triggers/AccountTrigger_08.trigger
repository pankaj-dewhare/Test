//  User Story 1: Create a New Account / Update an Account Name. If this Account Name already exists into the Database, then Prevent It (Error).
trigger AccountTrigger_08 on Account (before insert, before update) {
    /*set<string> accNameSet = new set<string>();
    for(Account objAcc : trigger.new){
        accNameSet.add(objAcc.Name);
    }
    
    list<Account> accList = [Select Id, Name From Account Where Name IN : accnameSet];
    
    For(Account objAcc : trigger.new){
        if(accList.size()>0){
            objAcc.addError('Duplicate Account');
        }
    }*/
    
    // By using a map
    set<string> accNameSet = new set<string>();
    For(Account objAcc : trigger.new){// new duplicate record inserting 
        accNameSet.add(objAcc.Name); // inserting in set
    }
    list<Account> accList = [Select Id, Name From Account Where Name IN : accNameSet]; // fetching that duplicate records comes in set by query
    
    map<string, Account> accMap =  New map<string, Account>(); // written map for getting key and value
    
    For(Account objAcc : accList){ // iterating a acclist data which we receive from set and putting up in map
        accMap.put(objAcc.Name, objAcc);
    }
    For(Account objAcc : trigger.new){ // again iterating a new data by using trigger. new context variable
        if(accMap.containskey(objAcc.Name)){ // found a duplicate record by using containskey function in that map 
            objAcc.AddError('Duplicate Account Map through'); // showing error
        }   
    }
}