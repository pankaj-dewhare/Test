trigger AccountContactTrigger on Account (after insert) {
    list<Contact> conList = new list<Contact>();
    if(trigger.isAfter && trigger.isInsert){
        for(Account objAcc : trigger.new){
            Contact objCon = new contact();
            objCon.LastName = objAcc.Name;
            objCon.Phone = objAcc.Phone;
            objCon.AccountId = objAcc.Id;
            objCon.Email = objAcc.Email__c;
            conList.add(objCon);
        }
        if(!conList.isEmpty()){
            try{
                Insert conList;
            }
            catch (DmlException e){ 
                System.debug('Error creating contacts: ' + e.getMessage());
            }
        }
    }
}