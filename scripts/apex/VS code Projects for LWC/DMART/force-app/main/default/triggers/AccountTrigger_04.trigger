trigger AccountTrigger_04 on Account (after update) {
    List<Messaging.singleEmailMessage> mailList = new List<Messaging.singleEmailMessage>();
    For(Account objAcc : trigger.new){
        if(!string.isBlank(objAcc.rating)){
            if(objAcc.rating == 'Hot'){
                if(objAcc.rating != trigger.oldMap.get(objAcc.id).rating && trigger.oldMap.get(objAcc.id).rating == 'Cold'){
                Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
                mail.setToAddresses(New String[] {'pankaj.dewhare11@gmail.com'});
                mail.setSubject('Rating updated from cold to hot');
                mail.setSenderDisplayName('Vodafone');
                mail.setPlainTextBody('Hi Team \n Rating is updated from Cold to hot must check \n Team Vodafone');
                mailList.add(mail);
            }
        }
               }
    }
    if(!mailList.isEmpty()){
        Messaging.sendEmail(mailList, false); 
    }
}