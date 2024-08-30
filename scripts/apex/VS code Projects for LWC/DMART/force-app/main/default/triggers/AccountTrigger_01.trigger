//When Account Type is “Prospect”, then Rating should be “Hot”. Else nothing.
trigger AccountTrigger_01 on Account (before insert, before update) {
    For(Account objAcc : trigger.new){
        if(!string.isBlank(objAcc.type)){
            if(objAcc.type == 'Prospect'){
                objAcc.rating = 'Hot';
            }else{
                objAcc.rating = '';
            }
        }
    }
    
}