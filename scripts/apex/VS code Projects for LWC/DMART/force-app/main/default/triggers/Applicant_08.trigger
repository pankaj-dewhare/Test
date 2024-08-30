//If Applicant is eligible for Police Verification and Male, then update All the addresses city as “Nagpur” only if the Address Pin Code starts with “44”.
trigger Applicant_08 on Applicant__c (after update) {
    map<Id,Applicant__c> appMap = new map<Id,Applicant__c>();
    For(Applicant__c objApp : trigger.new){
        
            if((objApp.gender__c != trigger.oldMap.get(objApp.Id).gender__c) || (objApp.police_verification__c != trigger.oldMap.get(objApp.id).police_verification__c)){
                appMap.put(objApp.id, objApp);
            }
    }
    list<Address__c> adrList = new list<Address__c>();
    if(!appMap.isEmpty()){
        For(Address__c objAdr : [Select Id, Applicant_name__c, city__c, pin_code__c From Address__c Where Applicant_name__c IN : appMap.keySet()]){
            adrList.add(objAdr);
        }
    }
        if(adrList.isEmpty()){
            For(Address__c objAdr : adrList){
                if(appMap.containskey(objAdr.Applicant_name__c)){
                    if(appMap.get(objAdr.Applicant_Name__c).police_verification__c == true && appMap.get(objAdr.Applicant_name__c).gender__c == 'Male'){
                        if(objAdr.pin_code__c.startswith('44')){
                            objAdr.city__c = 'Nagpur';
                        }
                    }
                }
            }
            database.update(adrList,false);
        }
 }