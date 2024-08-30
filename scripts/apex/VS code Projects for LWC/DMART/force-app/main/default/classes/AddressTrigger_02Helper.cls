public class AddressTrigger_02Helper {

    public static void UpdateAddressRecord(list<Address__c> AddressList){
        set<id> appIdSet = new set<Id>();
    for(Address__c objAdr : AddressList){
        if(objAdr.Applicant_name__c != null){
            if((trigger.isBefore && trigger.isInsert) || (trigger.isAfter && trigger.isUndelete)){
                appIdSet.add(objAdr.Applicant_Name__c);
            }
            
            if(trigger.isBefore && trigger.isUpdate){
                appIdSet.add(objAdr.Applicant_Name__c);
                
            }
        }
    }
    map<Id,Applicant__c> appMap = new map<Id,Applicant__c>();
    if(!appIdSet.isEmpty()){
        for(Applicant__c objApp : [Select Id, police_verification__c, (Select Id, city__c From Addresses__r) From Applicant__c Where ID IN : appIdSet]){
            appMap.put(objApp.id, objApp);
        }
    }
    if(!appMap.isEmpty()){
        for(Address__c objAdr : AddressList){
            if(appMap.containskey(objAdr.Applicant_name__c)){
                list<Address__c> adrList = appMap.get(objAdr.Applicant_name__c).Addresses__r;
                
                for(Address__c objAdrExisting : adrList){
                    if(objAdr.city__c == objAdrExisting.city__c && appMap.get(objAdr.Applicant_Name__c).police_verification__c){
                        objAdr.AddError('Duplicate city is not allowed for same applicant');
                    }
                }
            }
            
        }
    }
    }
}