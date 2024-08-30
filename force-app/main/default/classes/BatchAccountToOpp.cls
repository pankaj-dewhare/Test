global class BatchAccountToOpp implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('Select Id, Rating, (Select Id, Name, DeliveryInstallationStatus__c From Opportunities)From Account');
    }
    global void execute(Database.BatchableContext BC, List<Account> accList){
        Map<Id,Account> accMap = new Map<Id,Account>();
        if(!accList.isEmpty()){
            For(Account objAcc : accList){
                accMap.put(objAcc.Id, objAcc);
            }
        }
        List<Opportunity> oppList = New List<Opportunity>();
        if(!accMap.isEmpty()){
            For(Opportunity objOpp : [Select Id, AccountId, Name, DeliveryInstallationStatus__c From Opportunity Where AccountID IN : AccMap.keyset()]){
                oppList.add(objOpp);
            }
        }
        
        for(opportunity objOpp : oppList){
            if(accMap.containskey(objOpp.AccountId)){
                if(accMap.get(objOpp.AccountId).rating == 'Hot'){
                    objOpp.DeliveryInstallationStatus__c = 'Completed';
                }else{
                    if(accMap.get(objOpp.AccountId).rating == 'Cold' || accMap.get(objOpp.AccountId).rating == 'Warm'){
                        objOpp.DeliveryInstallationStatus__c = 'In progress';
                    }else{
                        objOpp.DeliveryInstallationStatus__c = 'Yet to begin';
                    }
                }
            }
        }
        if(!oppList.isEmpty()){
            database.update(oppList); 
        }
    }
    global void finish(Database.BatchableContext BC){
        List<Messaging.singleEmailMessage> mailList = new List<Messaging.singleEmailMessage>();
        Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
        mail.setToAddresses( New string [] {'pankaj.dewhare11@gmail.com'});
        mail.setSubject('Opportunities Delivery installation is updated');
        mail.setSenderDisplayName('Pankaj Dewhare');
        mail.setPlainTextBody('Hi Team \n Delivery installation is updated \n Team Vodafone');
        mailList.add(mail);
        
        if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList);
        }
        
    }
}