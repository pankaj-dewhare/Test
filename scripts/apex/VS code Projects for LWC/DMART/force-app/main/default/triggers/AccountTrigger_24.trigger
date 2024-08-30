/* When a new Account is Created.  (Welcome)
   When an Account is updated to “Cold”. (Updated)*/
trigger AccountTrigger_24 on Account (after insert, after update) {
    list<Messaging.singleEmailMessage> mailList = new list<Messaging.singleEmailMessage>();
    for(Account objAcc : trigger.new){
        if(trigger.isInsert && trigger.isAfter){
            Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
            mail.setToAddresses(New String [] {'pankaj.dewhare11@gmail.com'});
            mail.setSubject('Welcome Candidate..!');
            mail.setSenderDisplayName('Pankaj Dewhare');
            mail.setPlainTextBody('Hi Team, New account is created in the org \n Team Pankaj');
            mailList.add(mail);
        }
        if(trigger.isAfter && trigger.isUpdate){
            if(objAcc.Rating != trigger.oldMap.get(objAcc.Id).rating){
                if(objAcc.Rating == 'cold'){
                    Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
                    mail.setToAddresses(New String [] {'pankaj.dewhare11@gmail.com'});
                    mail.setSubject('Account rating is updated..!');
                    mail.setSenderDisplayName('Spartan IT solution');
                    mail.setPlainTextBody('Hi Team, Account rating is updated to cold \n Team Spartan');
                    mailList.add(mail);
                }
            }
        }
    }
    if(!mailList.isEmpty()){
        Messaging.sendEmail(mailList,false);
    }
}