public class AccountTriggerhelper {
    
    public static void updateAccountRecord(list<Account> accList){
        For(Account objAcc : accList){
            if(!string.isBlank(objAcc.type)){
                if(objAcc.type == 'Prospect'){
                    objAcc.SLA__c = 'Gold';
                }else{
                    if(objAcc.type == 'Customer - Direct'){
                        objAcc.SLA__c = 'Silver';
                    }else{
                        objAcc.SLA__c = '';
                    }
                }
                
            }
        }
    }
    public static void preventAccoutSLA(list<Account> accOldList){
        for(Account objAcc : accOldList){
            if(objAcc.SLA__c == 'Gold'){
              objAcc.AddError('Account deletion is not allowed if SLA is equal to Gold');  
            }
        }
    }
}