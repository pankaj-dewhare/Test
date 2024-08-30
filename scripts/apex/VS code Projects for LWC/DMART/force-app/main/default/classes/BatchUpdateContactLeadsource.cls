//Update contact leadsource web and send the success and failed result in mail
global class BatchUpdateContactLeadsource implements Database.Batchable<sObject>, Database.Stateful{
    
    global integer count = 0;
    set<string> successRecords = New set<String>();
    set<string> FailedRecords = New set<String>();
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('Select Id, Leadsource, Name From Contact Where Leadsource != \'Web\'');
    }
    global void execute(Database.BatchableContext BC, List<Contact> conList){
        if(!conList.isEmpty()){
            For(Contact objCon : conList){
                objCon.LeadSource = 'Web';
                count++;
            }
            
            Database.SaveResult[] result = Database.update(conList,false);
            
            integer index = 0;
            
            For(Database.SaveResult sr : result){
                if(sr.isSuccess()){
                    system.debug('Success ='+conList[index].Name);
                    successRecords.add(conList[index].Name);
                    index++;
                }
                else{
                    system.debug('Failed ='+conList[index].Name);
                    failedRecords.add(conList[index].Name);
                    index++;
                }
            }
            
        }
    }
    global void finish(Database.BatchableContext BC){
        List<Messaging.singleEmailMessage> mailList = new List<Messaging.singleEmailMessage>();
        Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
        mail.setToAddresses(New string [] {'pankaj.Dewhare11@gmail.com'});
        mail.setSubject('Success and failed records');
        mail.setSenderDisplayName('Spartan IT Solution');
        mail.setPlainTextBody('Success ='+successRecords  + 'Failed ='+failedRecords);
        mailList.add(mail);
        
        if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList,false);
        }
       system.debug('Count='+count); 
    }
}