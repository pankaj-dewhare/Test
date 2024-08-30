//When a new Account is Created.  (Welcome)
trigger AccountTrigger_20 on Account(after insert){
    List<Messaging.singleEmailMessage> mailList = new list<Messaging.singleEmailMessage>();
    For(Account objAcc : trigger.new){
        Messaging.singleEmailMessage mail = New Messaging.singleEmailMessage();
        mail.setToAddresses(New string[] {'pankaj.dewhare11@gmail.com'});
        mail.setSubject('New Account Is Inserted');
        mail.setSenderDisplayName('Pankaj Dewhare');
        mail.setPlainTextBody('Hi Team, New Account is inserted \n Team Spartan');
        mailList.add(mail);
    }
    if(!mailList.isEmpty()){
        Messaging.sendEmail(mailList,false);
    }
}