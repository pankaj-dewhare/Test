trigger TransactionTrigger on Transaction__c (before insert, before update) {
    set<Id> custIdSet = new set<Id>();
    for(transaction__c objTran : trigger.new){
        custIdSet.add(objTran.customer_transaction__c);
    }
    map<Id,customer__c> custMap = new map<Id,customer__c>();
    for(customer__c objCust : [Select Id, total_balance__c From Customer__c Where ID IN : custIdSet]){
        custMap.put(objCust.id, objCust);
    }
    for(transaction__c objTran : trigger.new){
        if(custMap.containskey(objTran.customer_transaction__c)){
            if(objTran.Transaction_Type__c == 'Deposit'){
                custMap.get(objTran.customer_Transaction__c).total_balance__c = custMap.get(objTran.customer_Transaction__c).total_balance__c + objTran.Amount__c;
            }
            else if(objTran.Transaction_Type__c == 'Withdrawl'){
                custMap.get(objTran.customer_Transaction__c).total_balance__c = custMap.get(objTran.customer_Transaction__c).total_balance__c - objTran.Amount__c;
            }
        }
    }
}