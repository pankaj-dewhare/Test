/*If Applicant is eligible for Police Verification and Male, then update All the addresses city as “Nagpur” only if the Address Pin Code starts with “44”.*/
trigger ApplicantTrigger_14 on Applicant__c (after update) {
    Map<Id,Applicant__c> accMap = new map<Id,Applicant__c>();
    For(Applicant__c objApp : trigger.new){
       /* if((objApp.police_verification__c != trigger.oldMap.get(objApp.Id).police_verification__c) || (objApp.gender__c != trigger.oldMap.get(objApp.ID).gender__c)){
            accMap.put(objApp.Id,objApp);
        }*/
    }
    system.debug('accMap value='+accMap);
    List<Address__c> adrList = new List<Address__c>();
    for(Address__c objAdr : [Select Id, city__c, pin_code__c, Applicant_name__c From Address__c Where Applicant_name__c IN : accMap.keySet()]){
        adrList.add(objAdr);
    }
    system.debug('I am address list'+adrList);
    for(Address__c objAdr : adrList){
        if(accMap.containskey(objAdr.Applicant_name__c)){
            if(accMap.get(objAdr.Applicant_name__c).police_verification__c && accMap.get(objAdr.Applicant_name__c).gender__c == 'Male'){
                if(objAdr.pin_code__c.startsWith('44')){
                    objAdr.Country__c = 'India';
                    objAdr.State__c = 'Maharashtra';
                    objAdr.city__c = 'Nagpur';
                }
            }
        }
    }
    system.debug('Logically Address'+adrList);
    if(!adrList.isEmpty()){
        database.update(adrList,false);
    }
    system.debug('Final data after updtating address list'+adrList);
}