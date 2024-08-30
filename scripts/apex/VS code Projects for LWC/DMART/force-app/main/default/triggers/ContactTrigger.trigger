// Prevent Duplicate Contact as per Email Id.
trigger ContactTrigger on Contact (before insert, before update) { // Error wants to show before inserting a record in the system thats why we take b insert, b udate
    set<string> conEmailSet = new set<string>(); // we are storing that record in set
    /*for(Contact objCon : trigger.new){ // Whatever duplicate email records store in the sytem it comes in trigger.new
        conEmailSet.add(objCon.email); // adding above record in set
    }
    
    list<Contact> conList = [Select Id, Email From Contact Where Email IN : conEmailSet]; // fetching that date from this query
    
    for(Contact objCon : trigger.new){ // again iterating new data came from set
        if(conList.size()>0){ // used logic found size if its greater than 0 in this conlist all duplicate email wale record will receive
            objCon.addError('Duplicate Email found by without map'); // showing an error
        }
    }*/
    
    
    //By using a map
    For(Contact objCon : trigger.new){
        conEMailSet.add(objCon.Email);
    }
    
    list<Contact> conList = [Select Id, Email From Contact Where Email IN : conEMailSet];
    
    map<string,Contact> conMap = new map<string, Contact>();
    
    for(Contact objCon : conList){
        conMap.put(objCon.Email, objCon);
    }
    for(Contact objCon : trigger.new){
        if(conMap.containskey(objCon.Email)){
           objCon.addError('Duplicate email found by using map'); 
        }
    }
    
}