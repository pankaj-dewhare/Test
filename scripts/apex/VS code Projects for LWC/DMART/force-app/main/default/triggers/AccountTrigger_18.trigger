//User story : Send an Email when Account Rating is updated to “Hot”.

trigger AccountTrigger_18 on Account(after update){
    list<Messaging.singleEmailMessage> mailList = new list<Messaging.singleEmailMessage>();
    For(Account objAcc : trigger.new){
        if(objAcc.rating != trigger.oldMap.get(objAcc.Id).rating){
            if(objAcc.rating == 'Hot'){
                Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
                mail.setToAddresses(new string[] {'pankaj.dewhare11@gmail.com'});
                mail.setSubject('Account rating is updated');
                mail.setSenderDisplayName('Pankaj Dewhare');
                mail.setPlainTextBody('Hi Team, Account Rating is updated to hot \n Team Spartan');
                mailList.add(mail);
            }
        }
    }
    if(!mailList.isEmpty()){
        Messaging.sendEmail(mailList,false);
    }
}