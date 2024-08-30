//Create or Edit Address. If Address City = Pune, then Applicant should be eligible for Police Verification.
trigger AddressTrigger on Address__c (after insert, after update) {
    set<Id> appIdSet = New set<Id>();
    For(Address__c objAdd : trigger.new){
        appIdSet.add(objAdd.Applicant_Name__c);
    }
    map<Id,Applicant__c> appMap = new map<Id,Applicant__c>();
    For(Applicant__c appList : [Select Id, police_verification__c From Applicant__c Where ID IN : appIdSet]){
        appMap.put(appList.id, appList);
    }
    For(Address__c objAdd : trigger.new){
        if(appMap.containskey(objAdd.Applicant_Name__c)){
            if(objAdd.city__c == 'Pune'){
                appMap.get(objAdd.Applicant_Name__c).police_verification__c = true;
                
            }else{
                appMap.get(objAdd.Applicant_Name__c).police_verification__c = false;
            }
        }
    }
    if(!appMap.isEmpty()){
        database.update(appMap.values(), false);
    }
}