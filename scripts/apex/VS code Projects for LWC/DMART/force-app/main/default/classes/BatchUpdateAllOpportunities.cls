/*Update All Opps
- If Amount is less than 5000 and Close Date Month is “August”, then Stage should be “Closed Lost”.
- If Amount is Greater or equals to 5000 but less than 30000, and Close Date Month is “Jan”, “April”, “Dec”, then Stage should be “Closed Won”.
- Otherwise,  None.
*/
global class BatchUpdateAllOpportunities implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext BC){
        string query = 'Select Id, Amount,CloseDate, StageName From Opportunity';
        return database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, list<Opportunity> oppList){
        if(!oppList.isEmpty()){
            For(Opportunity objOpp : oppList){
                if(objOpp.Amount < 5000 && objOpp.CloseDate.month() == 8){
                    objOpp.StageName = 'Closed Lost';
                }else{
                    if((objOpp.Amount >= 5000 || objOpp.Amount < 30000) && (objOpp.CloseDate.Month() == 1 || objOpp.CloseDate.Month() == 4 || objOpp.CloseDate.Month() == 12)){
                        objOpp.StageName = 'Closed Won';
                    }
                    else{
                        objOpp.StageName = '';
                    }
                }
            }
        }  
    }
    global void finish(Database.BatchableContext BC){
        List<Messaging.singleEmailMessage> mailList = New List<Messaging.singleEmailMessage>();
        
        Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
        mail.setToAddresses(New string [] {'pankaj.dewhare11@gmail.com'});
        mail.setSubject('Update opportunity');
        mail.setSenderDisplayName('Pankaj Dewhare');
        mail.setPlainTextBody('Hi Team \n Opportunity is updated \n Team Airtel');
        mailList.add(mail);
        
        if(!mailList.isEmpty()){
           Messaging.sendEmail(mailList, false); 
        }
    }
}