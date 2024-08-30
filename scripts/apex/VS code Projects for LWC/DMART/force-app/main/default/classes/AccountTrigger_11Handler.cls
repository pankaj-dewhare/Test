public class AccountTrigger_11Handler {
    
    public static void afterUpdate(list<Account> accList, map<Id,Account> mapOldList){
        AccountTrigger_11Helper.updateAccountPhone(accList, mapOldList);
    }

}