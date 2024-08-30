trigger AccountPreventDupRecTrigger on Account (before insert, before update) {
set<string> accNameSet = new set<string>();
    // by using set
   /* For(Account objAcc : trigger.new){
        accNameSet.add(objAcc.Name);
     }
    list<Account> accLIst = [Select ID, Name From Account Where Name IN : accNameSet];
    
    for(Account Acc : trigger.new){
        if(AccList.size()>0){
            Acc.AddError('Duplicate record found done it by set');
            
        }
    }*/
    
    // by using map
    for(Account objAcc : trigger.new){
        if(!string.isBlank(objAcc.Name)){
            accNameSet.add(objAcc.Name);
        }  
    }
    map<string,Account> accMap = new map<string,Account>();
    list<Account> acclIst = [Select Id, Name From Account Where Name IN : accNameSet];
    
    For(Account objAcc : accList){
        accMap.put(objAcc.Name,objAcc);
    }
    
    For(Account objAcc : trigger.new){
        if(accMap.containsKey(objAcc.Name)){
            objAcc.AddError('Duplicate record found done it by map');
        }
    }
}