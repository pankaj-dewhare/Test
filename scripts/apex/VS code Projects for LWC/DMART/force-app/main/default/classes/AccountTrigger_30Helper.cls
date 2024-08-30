public class AccountTrigger_30Helper {
    
    public static void recordHelperMethod(list<Account> accList){
        for(Account objAcc : accList){
            if(!string.isBlank(objAcc.rating)){
                if(objAcc.rating == 'Hot'){
                    objAcc.Type = 'Prospect';
                }
                else{
                    objAcc.Type = '';
                }
            }
            else{
                objAcc.Type = '';
            }
        }
    }
}