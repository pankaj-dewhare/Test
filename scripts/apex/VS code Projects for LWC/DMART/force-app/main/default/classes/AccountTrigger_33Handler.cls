public Class AccountTrigger_33Handler{
    
     public static void beforeDelete(list<Account> accOldList){
        AccountTrigger_33Helper.deleteAccRecord(accOldList);
    }
    public static void beforeInsert(List<Account>accList){
        AccountTrigger_33Helper.accountRecordCreation(accList, null);
        
    }
    
    public static void beforeUpdate(List<Account> accList, Map<Id,Account> oldMapList){
        AccountTrigger_33Helper.accountRecordCreation(accList, oldMapList);
        
    }
    
   
    
}