// Update Police Verification to true for all Male Applicant’s.
global class BatchUpdateApplicantPolice implements Database.Batchable<sObject>{

    global Database.QueryLocator start(Database.BatchableContext BC){
        
    return Database.getQueryLocator('Select Id, Gender__c, Police_verification__c From Applicant__c Where Gender__c = \'Male\' and police_verification__c != true');        
    }
    global void execute(Database.BatchableContext BC, list<Applicant__c> appList){
        if(!appList.isEmpty()){
            for(Applicant__c objApp : appList){
                objApp.police_verification__c = true;
            }
            update appList;
        }
    }
    global void finish(Database.BatchableContext BC){
        
        Database.executeBatch(New BatchAddressCityUpdate());
        
        list<Messaging.singleEmailMessage> mailList = new list<Messaging.singleEmailMessage>();
        Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
        mail.SetToAddresses(New string [] {'pankaj.dewhare11@gmail.com'});
        mail.setSubject('Police Verification has been updated');
        mail.setPlainTextBody('Hi Team \n Police verification has been updated is true for male must check the org \n Thanks \n Team Spartan');
        mailList.add(mail);
        
        if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList,false);
        }  
        
    }
    
}