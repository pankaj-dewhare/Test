public class AccountTriggerRecursiveHandler {
    
    public static boolean flag = false;
    
    public static void beforeInsert(list<Account> accNewList){
        if(!flag){
            flag = true;
            AccountTriggerRecursiveHelper.accountRecordInsert(accNewList);
        }
    }
    
}