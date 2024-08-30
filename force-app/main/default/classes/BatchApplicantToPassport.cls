/*Create a new Field “Passport Message” on Applicant Object.
If Applicant Age < 18 or Age is null, then update Passport Message as “Your Passport has been rejected”.
Update Passport Object Status to “Rejected”. After that, send mail to all the rejected Applicant’s that, your passport has been rejected.
*/
global class BatchApplicantToPassport implements Database.Batchable<sObject>{

    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('Select Id, Age__c, Passport_message__c From Applicant__c Where Age__c < 18 or Age__c = null');
    }
    global void execute(Database.BatchableContext BC, list<Applicant__c> appList){
        if(!appList.isEMpty()){
            For(Applicant__c objApp : appList){
                objApp.passport_message__c = 'Your Passport has been rejected';
            }
            database.update(appList,false);
        }
    }
    global void finish(Database.BatchableContext BC){
        Database.executeBatch(New BatchPassportToApplicant());
        system.debug('From Batch class1 finish method');
    }
   
}