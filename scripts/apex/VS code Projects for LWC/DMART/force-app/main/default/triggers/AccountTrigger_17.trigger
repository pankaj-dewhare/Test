/*User Story 1] When 
-   Account SLA = Gold, then Description = ‘Google’.
-   SLA = Silver, Then Description =’Yahoo’
-   Else Description = Blank
*/
trigger AccountTrigger_17 on Account (before insert, before update) {
    for(Account objAcc : trigger.new){
        if(string.isNotBlank(objAcc.SLA__c)){
            if(objAcc.SLA__c == 'Gold'){
                objAcc.Description = 'Google';
            }
            else{
                if(objAcc.SLA__c == 'Silver'){
                   objAcc.Description = 'Yahoo'; 
                }
                else{
                    objAcc.Description = ''; 
                }
            }
        }
    }
}