//Update Passport Object Status to “Rejected”. After that, send mail to all the rejected Applicant’s that, your passport has been rejected.
global class BatchPassportToApplicant implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('Select Id, passport_message__c From Applicant__c where passport_message__c != null');
    }
    global void execute(Database.BatchableContext BC, list<Applicant__c> appList){
       map<Id,Applicant__c> appMap = new Map<Id,Applicant__c>();
        if(!appList.isEmpty()){
            for(Applicant__c objApp : appList){
                appMap.put(objApp.id,objApp);
            }
        }
        list<Passport__c> passportList = new list<Passport__c>();
        for(Passport__c objPas : [Select Id, status__c, Applicant__c From Passport__c Where Applicant__c IN : appMap.keySet()]){
            passportList.add(objPas);
        }
        list<Messaging.singleEmailMessage> mailList = New List<Messaging.singleEmailMessage>();
        for(Passport__c objPas : passportList){
            if(appMap.containskey(objPas.Applicant__c)){
                if(appMap.get(objPas.Applicant__c).passport_message__c != ''){
                   objPas.Status__c = 'Rejected'; 
                }
               
                else{
                    if(objPas.Status__c == 'Rejected'){
                        Messaging.singleEmailMessage mail = New Messaging.singleEmailMessage();
                        mail.setToAddresses(New string [] {appMap.get(objPas.Applicant__c).Email__c});
                        mail.setSubject('Passport is Rejected');
                        mail.setSenderDisplayName('Spartan IT Solution');
                        mail.setPlainTextBody('Hi Team, As per your age or you did not fill Email field that is why your passport application is Rejected \n Team Spartan ');
                        maillist.add(mail);
                        
                    }
                }
            }
        }
        if(!passportList.isEmpty() && !mailList.isEmpty()){
          Database.update(passportList,false);
          Messaging.sendEmail(mailList, false);
        }
    }
    global void finish(Database.BatchableContext BC){
        system.debug('From Batch class2 finish method');
    }
}