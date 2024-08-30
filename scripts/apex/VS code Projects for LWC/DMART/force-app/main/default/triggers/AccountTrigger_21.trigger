// When an Account is updated to “Cold”. (Updated)
trigger AccountTrigger_21 on Account(after update){
    list<Messaging.singleEmailMessage> mailList = new list<Messaging.singleEmailMessage>();
    for(Account objAcc : trigger.new){
        if(objAcc.rating != trigger.oldMap.get(objAcc.id).rating){
            if(objAcc.rating == 'Cold'){
                Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
                mail.setToAddresses(new string [] {'pankaj.dewhare11@gmail.com'});
                mail.setSubject('Account Rating is updated to cold');
                mail.setSenderDisplayName('Pankaj Dewhare');
                mail.setplainTextBody('Hi team, Account rating is updated to cold must check \n Team Spartan');
                mailList.add(mail);
            }
        }
    }
    if(!mailList.isEmpty()){
        Messaging.sendEmail(mailList,false);
    }
    
}