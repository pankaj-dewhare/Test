trigger AccountTrigger_35 on Account (before insert) {
    For(Account objAcc : trigger.new){
        if(string.isBlank(objAcc.email__c)){
            objAcc.AddError('Email field is mandatory to fill');
        }
    }
}