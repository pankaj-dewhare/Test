public class AccountTriggerHandler {
    
    public static void beforeInsert(list<Account> accList){
        AccountTriggerhelper.updateAccountRecord(accList);
    }
    public static void beforeUpdate(list<Account> accList){
        AccountTriggerhelper.updateAccountRecord(accList);
    }
    public static void beforeDelete(list<Account> accOldList){
        AccountTriggerhelper.preventAccoutSLA(accOldList);
    }

}