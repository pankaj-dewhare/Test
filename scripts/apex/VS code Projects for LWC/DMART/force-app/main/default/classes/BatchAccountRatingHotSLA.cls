global class BatchAccountRatingHotSLA implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        system.debug('I am from start method');
        return Database.getQueryLocator('Select Id, Rating, SLA__c From Account Where Rating != \'Hot\' and SLA__c = \'Gold\'');
      
    }
    global void execute(Database.BatchableContext BC, list<Account> accList){
        if(!accList.isEmpty()){
            for(Account objAcc : accList){
                objAcc.rating = 'Hot';
                 
            }
           Database.update(accList,false);
            system.debug('I am from Execute Method');
        }
        
    }
    global void finish(Database.BatchableContext BC){
        list<Messaging.singleEmailMessage> mailList = new list<Messaging.singleEmailMessage>();
        Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
        mail.setToAddresses(New string [] {'pankaj.dewhare11@gmail.com'});
        mail.setSubject('Account Rating is updated to Hot');
        mail.setSenderDisplayName('Pankaj Dewhare');
        mail.setPlainTextBody('Hi Team, Rating is updated into hot must check. \n Team Spartan');
        mailList.add(mail);
        
        if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList,false);
            system.debug('I am from finish method');
            
        }
    } 
}