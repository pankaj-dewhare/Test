// After inserting an account prevent contact creation if it is already exist else do create a contact
trigger AccountPreventDupContact on Account (after insert) {
set<string> accNameSet = new set<string>();
    for(Account objAcc : trigger.new){
        if(objAcc.Name != null){
            accNameSet.add(objAcc.Name);
        }
    }
    
    list<Contact> conList = [Select ID, Name From contact Where Name IN : accNameSet];
    
    Map<string,Contact> conMap = New map<string,Contact>();
    
    for(Contact objCon : conList){
        conMap.put(objCon.Name, objCon);
    }
    
    list<Contact> insertConlist = new list<Contact>();
    
    for(Account objAcc : trigger.new){
        if(conMap.containskey(objAcc.Name)){
            objAcc.addError('Duplicate contact name is not allowed');
        }else{
            Contact objCon = new Contact();
            objCon.AccountId = objAcc.id;
            objCon.LastName = objAcc.Name;
            objCon.Phone = objAcc.Phone;
            objCon.Email = objAcc.Email__c;
            insertConlist.add(objCon);
        }
    }
    
    if(!insertConlist.isEmpty()){
        insert insertConlist;
    }
}