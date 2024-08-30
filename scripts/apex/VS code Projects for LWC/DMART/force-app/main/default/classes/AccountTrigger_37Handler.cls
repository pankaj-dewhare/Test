public class AccountTrigger_37Handler {
    
    public static void accountRecordMethod(list<Account> accList){
        for(Account objAcc : accList){
            if(objAcc.type == 'prospect'){
                objAcc.SLA__c = 'Gold';
            }else if(objAcc.type == 'Customer - Direct'){
                objAcc.SLA__c = 'Silver';
            } else{
                objAcc.SLA__c = '';
            }
        }
    }
    
}