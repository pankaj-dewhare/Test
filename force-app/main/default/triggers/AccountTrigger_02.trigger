/*When 

-   Account SLA = Gold, then Description = ‘Oo lala’.
-   SLA = Silver, Then Description =’Yahoo’
-   Else Description = Blank*/
trigger AccountTrigger_02 on Account (before insert, before update) {
    for(Account objAcc : trigger.new){
        if(!string.isBlank(objAcc.SLA__c)){
            if(objAcc.SLA__c == 'Gold'){
                objAcc.description = 'Oo Lala';
            }
            else{
                if(objAcc.SLA__c == 'Silver'){
                    objAcc.description = 'Yahoo';
                }
                else{
                    objAcc.description = '';
                }
            }
        }
    }
}