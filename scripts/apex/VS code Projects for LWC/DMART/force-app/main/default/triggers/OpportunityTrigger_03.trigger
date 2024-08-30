//User Story 4] Send an Email to silvermicrosystems@gmail.com when an opp record gets deleted.
trigger OpportunityTrigger_03 on Opportunity (after delete) {
    list<Messaging.SingleEmailMessage> mailList = new list<Messaging.SingleEmailMessage>();
    For(Opportunity objOpp : trigger.old){
        Messaging.SingleEmailMessage mail = New Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] {'pankaj.dewhare11@gmail.com'});
        mail.SetSubject('Records gets deleted'); 
        mail.SetSenderDisplayName('Pankaj');
        mail.setPlainTextBody(objOpp.Name+'Opportunity Records Deleted \n Team Pankaj');
        mailList.add(mail);
    }
    if(!mailList.isEmpty()){
        Messaging.sendEmail(mailList,false);
    }
}