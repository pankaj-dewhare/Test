public class AccountTrigger_30Handler {
    
    public static void beforeInsert(list<Account> accList){
        AccountTrigger_30Helper.recordHelperMethod(accList);
    }
    
    public static void beforeUpdate(list<Account> accList){
        AccountTrigger_30Helper.recordHelperMethod(accList);
    }

}