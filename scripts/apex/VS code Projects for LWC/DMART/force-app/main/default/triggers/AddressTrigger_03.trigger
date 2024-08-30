//Create or Edit Address. If Address City = Pune, then Applicant should be eligible for Police Verification.
trigger AddressTrigger_03 on Address__c (after insert, after update) {
    set<Id> appIdSet = new set<Id>();
    for(Address__c objAdr : trigger.new){
        appIdSet.add(objAdr.Applicant_Name__c);
    }
    map<Id,Applicant__c> appMap = new map<Id,Applicant__c>();
    for(Applicant__c objApp : [Select Id, police_verification__c From Applicant__c Where ID IN : appIdSet]){
        appMap.put(objApp.id,ObjApp);
    }
    for(Address__c objAdr : trigger.new){
        if(appMap.containskey(objAdr.applicant_Name__c)){
            if(objAdr.city__c == 'Pune'){
                appMap.get(objAdr.Applicant_Name__c).police_verification__c = true;
                    }
        }
    }
    if(!appMap.isEmpty())
        database.update(appMap.values(),false);
}