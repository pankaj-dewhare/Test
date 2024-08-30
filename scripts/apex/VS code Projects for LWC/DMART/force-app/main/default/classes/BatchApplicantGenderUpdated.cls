/*User Story 2] Update all the Applicants as per following condition,
A] If Gender is “Male”, then Police Verification = true and Special Mark of Body “Yahooo…!!!”.
B] If Gender is “Female”, then Police Verification = false and Special Mark on Body ‘Google..!!’.
*/
global class BatchApplicantGenderUpdated implements Database.Batchable<sObject>{
    
    global database.queryLocator start(Database.BatchableContext BC){
        
        string query = 'Select Id, Gender__c, police_verification__c, Special_mark_on_body__c From Applicant__c where gender__c != \'Transgender\'';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, list<Applicant__c> appList){
        for(Applicant__c objApp : appList){
            if(objApp.gender__c == 'Male' && !objApp.Police_Verification__c){
                objApp.Police_Verification__c = true;
                objApp.Special_mark_on_body__c = 'Yahoo';
            }
            else if (objApp.Gender__c == 'Female'){
                objApp.Police_Verification__c = false;
                objApp.Special_mark_on_body__c = 'Google';
            }
            
        }
        if(!appList.isEmpty()){
            database.update(appList,false);
        }
    }
    
    global void finish(Database.BatchableContext BC){
        
        list<Messaging.singleEmailMessage> mailList = new list<Messaging.singleEmailMessage>();
        
        Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
        mail.setToAddresses(New string [] {'pankaj.dewhare11@gmail.com'});
        mail.setSubject('police verification & special mark on body is updated');
        mail.SetSenderDisplayName('Spartan IT');
        mail.setPlainTextBody('Hi Team, \n Police verification & special mark on body field is updated as per the gender updatation');
        mailList.add(mail);
        
        if(!mailList.isEmpty()){
           Messaging.sendEmail(mailList, false); 
        }
    }

}