/*User Story 3] Create Address Record. 
If new city is “Nagpur”, And its respective Applicant is “Eligible for Police Verification”, then copy Applicant’s PAN Card in the Address’s Pan Card field.*/
trigger AddressTrigger_01 on Address__c (before insert, before update) {
    set<Id> appIdSet = new set<Id>();
    For(Address__c objAdd : trigger.new){
        if(trigger.isBefore && trigger.isInsert){
            if(objAdd.Applicant_Name__c != null){
                appIdSet.add(objAdd.Applicant_Name__c);
            }
        }
        if(trigger.isBefore && trigger.isUpdate){
            if(objAdd.city__c != trigger.oldMap.get(objAdd.Id).city__c){
                appIdSet.add(objAdd.Applicant_Name__c);
            }
        }
    }
    
    map<Id,Applicant__c> appMap = new map<Id,Applicant__c>();
    For(Applicant__c objApp : [Select Id, police_verification__c, pan_card__c From Applicant__c Where ID IN : appIdSet]){
        appMap.put(objApp.Id, objApp);
    }
    For(Address__c objAdd : trigger.new){
        if(appMap.containskey(objAdd.Applicant_Name__c)){
            if(objAdd.city__c == 'Nagpur' && trigger.oldMap.get(objAdd.Id).city__c == 'Pune' && appMap.get(objAdd.Applicant_Name__c).police_verification__c == true){
               objAdd.Pan_card__c = appMap.get(objAdd.Applicant_name__c).pan_card__c;
            }
            else{
                 objAdd.Pan_card__c = '';
            }
        }
    }
}