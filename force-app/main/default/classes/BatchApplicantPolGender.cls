/*User Story 2] Update all the Applicants as per following condition,

A] If Gender is “Male”, then Police Verification = true and Special Mark of Body “Yahooo…!!!”.
B] If Gender is “Female”, then Police Verification = false and Special Mark on Body ‘Google..!!’.*/

global class BatchApplicantPolGender implements Database.Batchable<sObject> {
    
    global Database.Querylocator start(Database.BatchableContext BC){
        
        string query = 'Select Id, Gender__c, police_verification__c, Special_mark_on_body__c From Applicant__c Where Gender__c != \'Transgender\'  ';
        
        return Database.getQuerylocator(query);
        
    }
    global void execute(Database.BatchableContext BC, list<Applicant__c> appList){
        if(!appList.isEmpty()){
            for(Applicant__c objApp : appList){
              
                    if(objApp.gender__c == 'Male' && !objApp.Police_Verification__c){
                        objApp.Police_Verification__c = true;
                        objApp.Special_mark_on_body__c = 'Yahoo';
                        
                    }
                    else{
                        if(objApp.gender__c == 'Female' && objApp.Police_Verification__c){
                            objApp.Police_Verification__c = false;
                            objApp.Special_mark_on_body__c = 'Google';
                        }
                  }
            }
            database.update(appList,false);
        }
    }
        global void finish(Database.BatchableContext BC){
            list<Messaging.singleEmailMessage> mailList = new list<Messaging.singleEmailMessage>();
            
            Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
            mail.setToAddresses(New string [] {'pankaj.dewhare11@gmail.com'});
            mail.setSubject('Database update');
            mail.setSenderDisplayName('Pankaj Dewhare');
            mail.setPlainTextBody('Gender is equal to email');
            mailList.add(mail);
            
            if(!mailList.isEmpty()){
                Messaging.sendEmail(mailList,false);
            }
        }
    }