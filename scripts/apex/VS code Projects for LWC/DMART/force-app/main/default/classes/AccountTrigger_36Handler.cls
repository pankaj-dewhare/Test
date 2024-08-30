public class AccountTrigger_36Handler {

    public static void contactDescriptionUpdate(List<Account> accList){
        map<id,account> accMap = new map<id,account>();
    for(Account objAcc : accList){
        if(objAcc.Id != null){
            accMap.put(objAcc.id,objAcc);
        }
    }
    list<Contact> conList = new list<Contact>();
    for(Contact objCon : [Select Id, AccountId, Description from contact Where AccountId IN : accMap.keyset()]){
        conList.add(objCon);    
    }
    for(Contact objContact : conList){
        if(accMap.containskey(objContact.accountId)){
            objContact.description = accMap.get(objContact.AccountId).description ;
        }
    }
    if(!conList.isEmpty()){
        database.update(conList,false);
    }
    }
}