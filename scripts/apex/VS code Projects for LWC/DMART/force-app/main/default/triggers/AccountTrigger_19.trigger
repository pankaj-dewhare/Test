//User story : Send an Email when Account Rating is updated from “Cold” to “Hot”.

trigger AccountTrigger_19 on Account(after update){
    List<Messaging.singleEmailMessage> mailList = new list<Messaging.singleEmailMessage>();
    for(Account objAcc : trigger.new){
        if(objAcc.rating != trigger.oldMap.get(objAcc.id).rating){
            if(objAcc.rating == 'Hot' && trigger.oldMap.get(objAcc.id).rating == 'Cold'){
             Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
            mail.setToAddresses(new string[] {'pankaj.dewhare11@gmail.com'});
            mail.setSubject('Rating is updated from Cold to Hot');
            mail.setSenderDisplayName('Spartan IT Solution');
            mail.setPlainTextBody('Hi Team, Account Rating is updated Hot from cold must check \n Team Spartan');
            mailList.add(mail);
          }
       }
    }
    if(!mailList.isEmpty()){
        Messaging.sendEmail(mailList,false);
    }
}