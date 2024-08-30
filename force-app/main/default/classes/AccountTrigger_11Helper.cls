public class AccountTrigger_11Helper {
    
    public static void updateAccountPhone(list<Account> accList, map<Id,Account> mapOldList){
        map<Id,Account> accMap = new map<Id,Account>();
        For(Account objAcc : accList){
            if(objAcc.phone != mapOldList.get(objAcc.id).phone){
                accMap.put(objAcc.id, objAcc);
            }
        }
        
        list<Contact> conList = new list<Contact>();
        if(!accMap.isEmpty()){
            For(Contact objCon : [Select Id, accountId, Phone From contact Where AccountId IN : accMap.keyset()]){
                conList.add(objCon);
            }
        }
        if(!conList.isEmpty()){
            for(Contact objCon : conList){
                if(accMap.containskey(objCon.AccountId)){
                    objCon.Phone = accMap.get(objCon.AccountId).phone;
                }
            }
            database.update(conList, false);
        }
    }
    
}