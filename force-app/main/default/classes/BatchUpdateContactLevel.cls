//User Story 1] Update All Contact Level to “Primary”. And show total number of records processed.
global class BatchUpdateContactLevel implements Database.Batchable<sObject>, Database.Stateful{
    
    global integer count = 0;
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('Select ID, Level__c From Contact Where Level__c != \'Primary\'');
    }
    global void execute(Database.BatchableContext BC, List<Contact> conList){
        if(!conList.isEmpty()){
            for(Contact objCon : conList){
                objCon.Level__c = 'Primary';
                count++;
            }
            Database.update(conList,false);
        }
    }
    global void finish(Database.BatchableContext BC){
        List<Messaging.singleEmailMessage> mailList = New List<Messaging.singleEmailMessage>();
        Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
        mail.setToAddresses(New string [] {'pankaj.dewhare11@gmail.com'});
        mail.setSubject('Level Updated');
        mail.setSenderDisplayName('Pankaj Dewhare');
        mail.setPlainTextBody('Hi Team, \n The contact level is updated as a Primary must check \n Team Spartan');
        mailList.add(mail);
        
        if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList,false); 
            system.debug('Count ='+count);
        }
        
    }
}