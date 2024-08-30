/*Send an Email 

   When a new Account is Created.  
   When an Account is updated to “Cold” from “Hot”. 
   When an Account is deleted.*/
trigger AccountTrigger_06 on Account (after insert, after update, after delete) {
    list<Messaging.singleEmailMessage> mailList = New list<Messaging.singleEmailMessage>();
    For(Account objAcc : trigger.new){
        if(trigger.isAfter && trigger.isInsert){
        Messaging.singleEmailMessage mail = New Messaging.singleEmailMessage();
        mail.setToAddresses(New string [] {'pankaj.dewhare11@gmail.com'});
        mail.setSubject('New Account is created');
        mail.setSenderDisplayName('Pankaj New account is created');
        mail.setPlainTextBody('Hi Team, \n New account is created in the system \n Team Airtel');
        mailList.add(mail);
            }
        if(trigger.isAfter && trigger.isUpdate){
            if(objAcc.rating == 'Cold' && trigger.oldMap.get(objAcc.id).rating == 'Hot'){
                Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
                mail.setToAddresses(New string [] {'pankaj.dewhare11@gmail.com'});
                mail.setSubject('Account is updated from Hot to Cold');
                mail.setSenderDisplayName('New account is updated');
                mail.setPlainTextBody('Hi Team, \n New account is updated from Hot to Cold must check \n Team Airtel');
                mailList.add(mail);
            }
        }
     }
    if(trigger.isAfter && trigger.isDelete){
    For(Account objAcc : trigger.old){
            Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
            mail.setToAddresses(New String [] {'pankaj.dewhare11@gmail.com'});
            mail.setSubject('Account is deleted');
            mail.setSenderDisplayName('Pankaj Account is deleted');
            mail.setPlainTextBody('Hi team, \n Account is deleted from system please check \n Team Airtel');
            mailList.add(mail);
        }
    }
    if(!mailList.isEmpty()){
        Messaging.sendEmail(mailList,false);
    }
}