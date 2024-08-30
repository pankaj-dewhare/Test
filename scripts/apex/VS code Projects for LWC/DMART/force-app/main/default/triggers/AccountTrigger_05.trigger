/*Send an Email 

   When a new Account is Created.  (Welcome)
   When an Account is updated to “Cold”. (Updated)
*/
trigger AccountTrigger_05 on Account (after insert, after update) {
list<Messaging.singleEmailMessage> mailList = new list<Messaging.singleEmailMessage>();
    for(Account objAcc : trigger.new){
        if(trigger.isAfter && trigger.isInsert){
            Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
            mail.setToAddresses( new string[] {'pankaj.dewhare11@gmail.com'});
            mail.setSubject('Welcome Dude');
            mail.setSenderDisplayName('Pankaj Welcome');
            mail.setPlainTextBody('Hi Tean \n Welcome in India \n Team Pankaj');
            mailList.add(mail);
        }
        if(trigger.isAfter && trigger.isUpdate){
            if(objAcc.rating != trigger.oldMap.get(objAcc.Id).rating){
                if(objAcc.rating == 'Cold'){
            Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
            mail.setToAddresses( new string[] {'pankaj.dewhare11@gmail.com'});
            mail.setSubject('Rating updated');
            mail.setSenderDisplayName('Pankaj Update mail');
            mail.setPlainTextBody('Hi Tean, \n Rating is updated to cold \n Team Airtel');
            mailList.add(mail);
                }
            }
        }
    }
    if(!mailList.isEmpty()){
        Messaging.sendEmail(mailList, false);
    }
}