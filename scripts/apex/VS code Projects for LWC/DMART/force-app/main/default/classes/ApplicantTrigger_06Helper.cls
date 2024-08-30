public class ApplicantTrigger_06Helper {

    public static void updateApplicantTrigger(List<Applicant__c> appList, map<Id,Applicant__c> appOldList){
        map<Id,Applicant__c> appMap = new map<Id,Applicant__c>();
    for(Applicant__c objApp : appList){
        if(objApp.police_verification__c != appOldList.get(objApp.Id).police_verification__c || objApp.Gender__c != appOldList.get(objApp.id).gender__c){
            appMap.put(objApp.id, objApp);
        }
    }
    list<Address__c> addressList = new List<Address__c>();
    
    For(Address__c objAdr : [Select Id, Applicant_Name__c, city__c, pin_code__c From Address__c Where Applicant_name__c IN : appMap.keySet()]){
        addressList.add(objAdr);
    }
    
    for(Address__c objAdr : addressList){
        if(appMap.containskey(objAdr.Applicant_Name__c)){
            if(appMap.get(objAdr.Applicant_Name__c).police_verification__c == true || appMap.get(objAdr.Applicant_name__c).gender__c == 'Male'){
                if(objAdr.pin_code__c.startsWith('44')){
                    objAdr.City__c = 'Nagpur';
                }
            }
        }
    }
    if(!addressList.isEmpty()){
        update addressList;
    }
    }
}