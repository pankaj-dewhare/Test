trigger AddressTrigger05 on Address__c (before insert, before update) {
    
    Set<Id> applicantIdSet = new Set<Id>();
    for(Address__c objAdr : trigger.new){ 
        if(trigger.isInsert && trigger.isBefore){
            applicantIdSet.add(objAdr.Applicant_Name__c);
        }
        
        if(trigger.isUpdate && trigger.isBefore){
            if(objAdr.City__c != trigger.oldMap.get(objAdr.Id).City__c){                
                applicantIdSet.add(objAdr.Applicant_Name__c);                
            }
        }
    }
    
    Map<Id,Applicant__c> applicantMap = new Map<Id,Applicant__c>();
    if(!applicantIdSet.isEmpty()){
        for(Applicant__c objApp : [select id, Police_Verification__c, Pan_Card__c from Applicant__c where Id IN : applicantIdSet]){
            applicantMap.put(objApp.Id, objApp);
        }
    }
    
    if(!applicantMap.isEmpty()){
        for(Address__c objAdr : trigger.new){
            if(applicantMap.containsKey(objAdr.Applicant_Name__c)){
                
                if(trigger.isInsert && trigger.isBefore){
                    if(objAdr.City__c == 'Nagpur'){
                        if(applicantMap.get(objAdr.Applicant_Name__c).Police_Verification__c){
                            objAdr.Pan_card__c = applicantMap.get(objAdr.Applicant_Name__c).Pan_Card__c;
                        }
                    }
                }
                
                if(trigger.isUpdate && trigger.isBefore){
                    if(objAdr.City__c == 'Nagpur' && trigger.oldMap.get(objAdr.Id).City__c =='Pune'){
                        if(applicantMap.get(objAdr.Applicant_Name__c).Police_Verification__c){
                            objAdr.Pan_card__c = applicantMap.get(objAdr.Applicant_Name__c).Pan_Card__c;
                        }
                    }
                }
                
            }
        }
    }
    
}