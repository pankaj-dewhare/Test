/*Update All the 

-	Address City as “Pune”, if Applicant Pan Card Starts with “P”.

-	Address City as “Nagpur”, if Applicant Pan Card Starts with “N”.

-	Address City as “Mumbai”, if Applicant Pan Card Starts with “M” AND Applicant is Eligible for Police Verification.*/
global class BatchApplicantToAddress implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('Select Id, pan_card__c, (Select Id, city__c From Addresses__r) From Applicant__c');
    }
    
    global void execute(Database.BatchableContext BC, list<Applicant__c> appList){
        map<Id,Applicant__c> appMap = new map<Id,Applicant__c>();
        if(!appList.isEmpty()){
            for(Applicant__c objApp : appList){
            appMap.put(objApp.id,objApp);
            }
        }
        list<Address__c> adrList = new list<Address__c>();
        for(Address__c objAdd : [Select Id, Applicant_name__c, city__c From Address__c Where Applicant_name__c IN : appMap.keySet()]){
            adrList.add(objAdd);
        }
        For(Address__c objAddress : adrList){
            if(appMap.containskey(objAddress.Applicant_Name__c)){
                if(appMap.get(objAddress.Applicant_Name__c).pan_card__c.startswith('P')){
                    objAddress.City__c = 'Pune';
                }else{
                    if(appMap.get(objAddress.Applicant_Name__c).pan_card__c.startswith('N')){
                        objAddress.City__c = 'Pune';
                    }else{
                        if(appMap.get(objAddress.Applicant_Name__c).pan_card__c.startswith('M')){
                            objAddress.City__c = 'Mumbai';
                        }
                    }
                }
            }
        }
        if(adrList.isEmpty()){
            database.update(adrList,false);
        }
    }
    
    global void finish(Database.BatchableContext BC){
        
    }

}