public class AccountTriggerRecursiveHelper {
    
    public static void accountRecordInsert(list<Account> accNewList){
        list<Account> accList = new list<Account>();
        for(Account objAcc : accNewList){
            Account objAccInstance = new Account(name = 'Test Account');
            accList.add(objAccInstance);
        }
        if(!accList.isEmpty()){
            insert accList;
        }
    }
}