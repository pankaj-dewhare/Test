//User Story 4] Send an Email to silvermicrosystems@gmail.com when an opp record gets deleted.

trigger OpportunnityTrigger_15 on Opportunity(after delete){
    list<Messaging.singleEmailMessage> mailList = new list<Messaging.singleEmailMessage>();
    for(Opportunity objOpp : trigger.old){
        Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
        mail.setToAddresses(New String [] {'pdewhare11@gmail.com'});
        mail.setSubject('Opportunity records is deleted');
        mail.setSenderDisplayName('Pankaj Dewhare');
        mail.setPlainTextBody('Hi Team, Opportunity record is deleted \n Team Spartan');
        mailList.add(mail);
    }
    if(mailList.isEmpty()){
        Messaging.sendEmail(mailList,false);
    }
    
}