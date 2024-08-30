//And Update All the Address City to “Pune”, for Applicant those, who are eligible for Police Verification.
global class BatchAddressCityUpdate implements Database.batchable<sObject>{

    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('Select Id, city__c From Address__c Where city__c != \'Pune\' and Applicant_name__r.police_verification__c = true');
    }
    global void execute(Database.BatchableContext BC, List<Address__c> adrList){
        if(!adrList.isEmpty()){
            for(Address__c objAdr : adrList){
                objAdr.city__c = 'Pune';
            }
            update adrList;
        }
    }
    global void finish(Database.BatchableContext Bc){
        
        list<Messaging.singleEmailMessage> mailList = new list<Messaging.singleEmailMessage>();
        Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
        mail.setToAddresses(New string [] {'pankaj.dewhare11@gmail.com'});
        mail.setSubject('City updated to pune');
        mail.setSenderDisplayName('Spartan Team');
        mail.setPlainTextBody('Hi Team, \n The Address city is update to Pune. \n Thanks, \n Team Spartan');
        mailList.add(mail);
        
        if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList, false);
        }
        
    }
}