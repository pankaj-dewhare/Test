trigger OpportunityTrigger_04 on Opportunity (before insert, before update) {
    set<decimal> oppSet = new set<decimal>();
    For(opportunity objOpp : trigger.new){
        oppSet.add(objOpp.Amount);
    }
    
    list<Opportunity> oppList = [Select Id, Amount From Opportunity Where Amount IN : oppSet];
    
    For(Opportunity objOpp : trigger.new){
        if(oppList.size()>0){
            objOpp.addError('Duplicate amount by using only set');
        }
    }
    
    /*for(opportunity objOpp : trigger.new){
        oppSet.add(objOpp.Amount);
    }
    
    list<Opportunity> oppList = [Select Id, Amount From Opportunity Where Amount IN : oppSet];
    
    map<decimal, Opportunity> oppMap = New map<decimal, opportunity>();
    
    for(Opportunity objOpp : oppList){
        oppMap.put(objOpp.Amount, objOpp);
    }
    for(opportunity objOpp : trigger.new){
        if(oppMap.containskey(objOpp.Amount)){
            objOpp.AddError('Duplicate amount by using map');
        }
    }*/
}