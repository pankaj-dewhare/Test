//User Story 4] Send an Email to silvermicrosystems@gmail.com when an opp record gets deleted.

trigger ContactTrigger_15 on Contact(after delete){
    list<Messaging.singleEmailMessage> mailList = new list<Messaging.singleEmailMessage>();
    For(Contact objCon : trigger.old){
        Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
        mail.setToAddresses(New String[] {'pankaj.dewhare11@gmail.com'});
        mail.setSubject('COntact is deleted');
        mail.setSenderDisplayName('pankaj dewhare');
        mail.setPlainTextBody('Hi Team, Contact has been deleted \n Team Spartan');
        mailList.add(mail);
    }
    if(!mailList.isEmpty()){
        Messaging.sendEmail(mailList,false);
    }
}
/*trigger ContactTrigger_15 on Contact(after delete){
    list<Messaging.singleEmailMessage> mailList = new list<Messaging.singleEmailMessage>();
    for(Contact objCon : trigger.old){
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
    
}*/