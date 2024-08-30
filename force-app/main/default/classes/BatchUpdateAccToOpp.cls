/*1] Update All the Opportunities 

-	IF Account Rating “Hot”, then Opp Delivery / Installation  status as “Completed”.
-	IF Account Rating “Cold” OR “Warm”, then Opp Delivery / Installation  status as “In progress”.
-	Otherwise, Delivery / Installation  status as “Yet to Begin”.
*/
global class BatchUpdateAccToOpp implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('Select Id, rating, (Select Id, DeliveryInstallationStatus__c From Opportunities) from Account');
    }
    global void execute(Database.BatchableContext BC, list<Account> accList){
        map<Id,Account> accMap = new map<Id,Account>();
        if(!accList.isEmpty()){
            For(Account objAcc : accList){
                accMap.put(objAcc.Id, objAcc);
            }
        }
        List<Opportunity> oppList = new list<opportunity>();
        if(!accMap.isEmpty()){
        for(Opportunity objOpp : [Select Id, AccountId, DeliveryInstallationStatus__c From Opportunity Where AccountId IN : accMap.keyset()]){
            oppList.add(objOpp);
           } 
        }
        for(Opportunity objOpp : oppList){
            if(accMap.containskey(objOpp.AccountId)){
                if(accMap.get(objOpp.AccountId).rating == 'Hot'){
                    objOpp.DeliveryInstallationStatus__c = 'Completed';
                }
                else{
                    if(accMap.get(objOpp.AccountId).rating == 'Cold' || accMap.get(objOpp.AccountId).rating == 'Warm'){
                        objOpp.DeliveryInstallationStatus__c = 'In progress';
                    } 
                    else{
                        objOpp.DeliveryInstallationStatus__c = 'Yet to Begin';
                    }
                }
            }
        }
        if(!oppList.isEmpty()){
            database.update(accList, false);
        }
    }
    global void finish(Database.BatchableContext BC){
        list<Messaging.singleEmailMessage> mailList = New list<Messaging.singleEmailMessage>();
        
        Messaging.singleEmailMessage mail = New Messaging.singleEmailMessage();
        mail.setToAddresses(New string [] {'pankaj.dewhare11@gmail.com'});
        mail.setSubject('Update Delivery installation');
        mail.setSenderDisplayName('Pankaj Dewhare');
        mail.setPlainTextBody('Hi Team \n Delivery installation status is updated \n Team Vodafone');
        mailList.add(mail);
        
        if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList,false);
        }
    }
}