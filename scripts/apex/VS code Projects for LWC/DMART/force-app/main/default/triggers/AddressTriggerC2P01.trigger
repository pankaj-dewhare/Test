// User Story 2] Prevent Duplicate Address of Same City for an Applicant only if, Applicant is Eligible for Police Verification.
trigger AddressTriggerC2P01 on Address__c (before insert, before update, after undelete) {
    set<Id> appIdSet = new set<Id>();
    for(Address__c objAdr : trigger.new){
        if((trigger.isInsert && trigger.isBefore) || (trigger.isUndelete && trigger.isAfter)){
            if(objAdr.applicant_name__c != null){
                appIdSet.add(objAdr.applicant_name__c);
            }
        }
        if(trigger.isBefore && trigger.isUpdate){
            if((objAdr.city__c != trigger.oldMap.get(objAdr.id).city__c) || objAdr.Applicant_Name__c != trigger.oldMap.get(objAdr.id).applicant_Name__c){
                appIdSet.add(objAdr.Applicant_Name__c);
            }
        }
    }
    map<Id,applicant__c> applicantMap = new map<Id,Applicant__c>();
    if(!appIdSet.isEmpty()){
        for(Applicant__c objApp : [Select Id, police_verification__c, (Select Id, city__c From Addresses__r)From Applicant__c Where Id IN : appIdSet]){
            applicantMap.put(objApp.id,objApp);
        }
    }
    if(!applicantMap.isEmpty()){
        For(Address__c objAdr : trigger.new){
            if(applicantMap.containskey(objAdr.applicant_name__c)){
                list<Address__c> addList = applicantMap.get(objAdr.applicant_name__c).addresses__r;
                
                for(Address__c objAdrExisting : addList){
                    if(applicantMap.get(objAdr.Applicant_Name__c).police_verification__c && objAdr.city__c == objAdrExisting.city__c){
                        objAdr.AddError('Duplicate city foundd..!!!!!!!');
                    }
                }
            }
        }
    }
}