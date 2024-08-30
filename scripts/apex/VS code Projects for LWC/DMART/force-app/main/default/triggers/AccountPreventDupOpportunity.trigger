/*Create an Opportunity when we insert an account. And if same name opportunity is exist then
 send error like " Oppornitity with same name is exist" */

trigger AccountPreventDupOpportunity on Account (after insert) {
set<string> accNameString = new set<string>();
    for(Account objAcc : trigger.new){ // Isme sare records aye jab bhi naya account create huva
        accNameString.add(objAcc.Name);
    }
    
    list<Opportunity> oppList = [Select Id, Name From Opportunity Where Name IN : accNameString]; // Isme opportunity record fetch kiya
    
    Map<string,Opportunity> oppMap = new Map<string,Opportunity>(); //Map nikala Opportunity ka
    for(Opportunity objOpp : oppList){ // jo bhi opportunity ka record aaya list me use iterate kiya 
        oppMap.put(objOpp.Name, objOpp); // and then child ke map me use put kiya
    }
    
    list<Opportunity> insertOppList = new list<Opportunity>();
    
    For(Account objAcc : trigger.new){ 
        if(oppMap.containskey(objAcc.Name)){
            objAcc.addError('Opportunity with same name is not allowed');
        }
        else{
            Opportunity objOpp = new Opportunity();
            objOpp.AccountId = objAcc.Id;
            objOpp.Name = objAcc.Name;
            objOpp.StageName = 'Prospecting';
            objOpp.CloseDate = system.today();
            insertOppList.add(objOpp);
        }
    }
    if(!insertOppList.isEmpty()){
   insert insertOppList;
        }
}