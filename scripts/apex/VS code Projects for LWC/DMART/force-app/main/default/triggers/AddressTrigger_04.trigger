trigger AddressTrigger_04 on Address__c (before insert, before update) {
    set<Id> appIdSet = new set<Id>();
    for(Address__c objAdr : trigger.new){
        if(trigger.isBefore && trigger.isInsert){
             appIdSet.add(objAdr.Applicant_Name__c);
        }
        if(trigger.isBefore && trigger.isUpdate){
            if(objAdr.city__c != trigger.oldMap.get(objAdr.Id).city__c){
                appIdSet.add(objAdr.Applicant_Name__c);
            }
        }
    }
    
    map<Id,Applicant__c> appMap = New map<Id,Applicant__c>();
    for(Applicant__c objApp : [Select Id, police_verification__c, pan_card__c From Applicant__c Where ID IN : appIdSet]){
        appMap.put(objApp.id, objApp);
    }
    for(Address__c objAdr : trigger.new){
        if(appMap.containskey(objAdr.Applicant_Name__c)){
            if(trigger.isInsert && trigger.isBefore){
                if(objAdr.city__c == 'Nagpur' && appMap.get(objAdr.Applicant_Name__c).police_verification__c){
                    objAdr.pan_card__c = appMap.get(objAdr.Applicant_Name__c).pan_card__c;
                }
            }
            if(trigger.isBefore && trigger.isUpdate){
                if(!string.isBlank(ObjAdr.city__c)){
                    if(objAdr.city__c == 'Nagpur' && trigger.oldMap.get(objAdr.id).city__c == 'Pune' && appMap.get(objAdr.applicant_Name__c).police_verification__c){
                        objAdr.pan_card__c = appMap.get(objAdr.Applicant_Name__c).pan_card__c;
                    }
                }
            }
        }
    }
}