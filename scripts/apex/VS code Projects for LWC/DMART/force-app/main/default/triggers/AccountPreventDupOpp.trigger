//After inserting an account prevent opportunity creation if it is already exist else allow to create an opportunity
trigger AccountPreventDupOpp on Account (after insert) {
set<string> accNameSet = new set<string>();
    for(Account objAcc : trigger.new){
        if(objAcc.Name != null){
            accNameSet.add(objAcc.Name);
        }
    }
    
    list<Opportunity> oppList = [Select Id, Name From Opportunity Where Name IN : accNameSet];
    Map<string,Opportunity> oppMap = New Map<string,opportunity>();
    
    for(Opportunity objOpp : oppList){
        oppMap.put(objOpp.Name, objOpp);
    }
    
    list<Opportunity> InsertoppList = New List<Opportunity>();
    
    for(Account objAcc : trigger.new){
        if(oppMap.containskey(objAcc.Name)){
            objAcc.addError('Duplicate opportunity is not allowed');
        }
        else{
            Opportunity objOpp = new opportunity();
            objOpp.AccountId = objAcc.id;
            objOpp.Name = objAcc.Name;
            objOpp.StageName = 'Prospecting';
            objOpp.CloseDate = system.today();
            InsertoppList.add(objOpp);
            
        }
    }
    if(!InsertoppList.isEmpty()){
        Insert InsertoppList;
    }
}