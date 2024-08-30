/*Scenario 2]  Show Address Name (ADR-0001), City, Pin Code in “List of Addresses” field on Applicant, such that,
-	Address City  should be “Nagpur”
-	Pin Code starts with “44”
-	Applicant should be eligible for Police Verification*/
global class BatchAddressToApplicant implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('Select Id, Name, city__c, Pin_code__c, Applicant_Name__r.Id, Applicant_Name__r.Name, Applicant_Name__r.police_verification__c  From Address__c Where City__c = \'Nagpur\' and pin_code__c like \'44%\' and Applicant_Name__r.police_verification__c = true');
    }
    
    global void execute(Database.BatchableContext BC, list<Address__c> adrList){
        set<Id> appIdSet = new set<Id>();
        if(!adrList.isEmpty()){
            For(Address__c objAdd : adrList){
                if(objAdd.Applicant_name__c != null){
                    appIdSet.add(objAdd.Applicant_name__c);
                }  
            }
        }
        map<Id,Applicant__c> appMap = new map<Id,Applicant__c>();
        if(!appIdSet.isEmpty()){
            for(Applicant__c objApp : [Select Id, list_of_Addresses__c From Applicant__c Where ID IN : appIdSet]){
                appMap.put(objApp.id, objApp);
            }
            for(Address__c objAdd : adrList){
                if(appMap.containskey(objAdd.Applicant_Name__c)){
                    if(string.isBlank(appMap.get(objAdd.Applicant_Name__c).List_of_Addresses__c)){
                        appMap.get(objAdd.Applicant_Name__c).List_of_Addresses__c =  objAdd.Name+ ' ' +objAdd.city__c+ '' +objAdd.Pin_Code__c;
                    }
                    else{
                        appMap.get(objAdd.Applicant_Name__c).List_of_Addresses__c = appMap.get(objAdd.Applicant_Name__c).List_of_Addresses__c+ '\n' + objAdd.Name+ ' ' +objAdd.city__c+ '' +objAdd.Pin_Code__c;
                    }
                }
            }  
        }
    }
    global void finish(Database.BatchableContext BC){
        
    }
}