public class ContactTrigger_22Helper {
    
    public static void deleteMethod(list<Contact> oldConList){
        for(Contact objCon : oldConList){
            if(string.isNotBlank(objCon.LeadSource)){
                if(objCon.LeadSource == 'Web'){
                    objCon.AddError('Record can not be deleted if leadsource is web');
                } 
            }
        }
    }
    
    public static void contactRecordInsert(list<Contact> conList){
        set<Id> accIdSet = new set<Id>();
        for(Contact objCon : conList){
            accIdSet.add(objCon.AccountId);
        }
        map<Id,Account> accMap = new map<Id,Account>();
        
        for(Account objAcc : [Select Id, Description From Account Where ID IN : accIdSet]){
            accMap.put(objAcc.id, objAcc);
        }
        
        for(Contact objCon : conList){
            if(accMap.containskey(objCon.AccountId)){
                accMap.get(objCon.AccountId).description = objCon.FirstName+' '+objCon.LastName;            
            }
        }
        if(!accMap.isEmpty()){
            Database.update(accMap.values(),false);
        }
    }
}