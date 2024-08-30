global class BatchContactLeadsourceWeb implements Database.Batchable<sObject>, Database.Stateful{

    integer count = 0;
    set<string> successRecordSet = new set<string>();
    set<string> FailedRecordSet = new set<string>();
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('Select Id, level__c, Leadsource From Contact Where Leadsource != \'Phone Inquiry\'');
    }
    global void execute(Database.BatchableContext BC, list<Contact> conList){
        if(conList.isEmpty()){
            for(Contact objCon : conList){
                objCon.LeadSource = 'Phone Inquiry';
                count++;
            } 
           Database.SaveResult[] result = Database.update(conList,false);
            
            integer index = 0;
            for(Database.SaveResult sr : result){
                if(sr.isSuccess()){
                    system.debug('Success ='+conList[Index].Name);
                    successRecordSet.add(conList[Index].Name);
                    index++;
                }else{
                    system.debug('Failed ='+conList[Index].Name);
                    FailedRecordSet.add(conList[Index].Name);
                    index++;
                }
            }
        }
    }
    global void finish(Database.BatchableContext BC){
        List<Messaging.singleEmailMessage> mailList = new List<Messaging.singleEmailMessage>();
        Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
        mail.setToAddresses(New string [] {'pankaj.dewhare11@gmail.com'});
        mail.setSubject('Success and Failed Records');
        mail.setSenderDisplayName('Spartan IT');
        mail.setPlainTextBody('Success = '+successRecordSet+ 'Failed ='+FailedRecordSet);
        mailList.add(mail);
        
        if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList,False);
        }
        system.debug('Count = '+count);
        system.debug('From finish method');
    }
}