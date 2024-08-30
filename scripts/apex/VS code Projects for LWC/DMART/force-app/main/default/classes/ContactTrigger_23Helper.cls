public class ContactTrigger_23Helper {
    
    // child to parent traverse self... Create / Edit the Contact. If It’s respective Account Rating is “Hot”, then Contact’s Level set to the “Primary”. Else keep blank.
    public static void beforeInsertHelperMethod(List<Contact> conListNew){
        set<Id> accIdSet = new set<Id>();
        For(Contact objCon : conListNew){
            if(objCon.AccountId != null){
                accIdSet.add(objCon.AccountId);
            }
        }
        system.debug('Records come in list='+conListNew);
        Map<Id,Account> accMap = New Map<Id,Account>();
        For(Account ObjAcc : [Select Id, Name, Rating From Account Where Id IN : accIdSet]){
            accMap.put(objAcc.Id,ObjAcc);
        }
        system.debug('Object Record='+accMap);
        For(Contact objCon : conListNew){
            if(accMap.containskey(objCon.AccountId)){
                if(accMap.get(objCon.AccountId).Rating == 'Hot'){
                    objCon.level__c = 'Primary';
                }
                else{
                    objCon.level__c = '';
                }
            }
        }
        system.debug('Final Records='+conListNew);
    }
    
    public static void contactRecordCreation(list<Contact> conList){
        set<Id> accIdSet = new set<Id>();
        for(Contact objCon : conList){
            if(objCon.AccountId != null){
                accIdSet.add(objCon.AccountId);
            }
        }
        Map<Id,Account> accMap = new Map<Id,Account>();
        
        For(Account objAcc : [Select ID, Name, Description From Account Where ID IN : accIdSet]){
            accmap.put(objAcc.Id,ObjAcc);
        }
        For(Contact ObjCon : conList){	
            if(accMap.containskey(objCon.AccountId)){
                if(string.isBlank(accMap.get(objCon.AccountId).description)){
                    accMap.get(objCon.AccountId).description = objCon.FirstName+''+objCon.LastName; 
                }
                else{
                    accMap.get(objCon.AccountId).description = accMap.get(objCon.AccountId).description+ '\n' +objCon.FirstName+''+objCon.LastName;
                }
            }
        }
        if(!accMap.isEmpty()){
            Database.Update(accMap.values(), false);
        }
    } 
}