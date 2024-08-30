/*Send an Email 
   When a new Account is Created.  
   When an Account is updated to “Cold” from “Hot”. 
   When an Account is deleted.*/
trigger AccountTrigger_25 on Account (after insert, after update, after delete) {
    list<Messaging.singleEmailMessage> mailList = new list<Messaging.singleEmailMessage>();
    for(Account objAcc : trigger.new){
        if(trigger.isInsert && trigger.isAfter){
            Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
            mail.setToAddresses(New string [] {'pankaj.dewhare11@gmail.com'});
            mail.setSubject('New account inserted');
            mail.setPlainTextBody('Hi Team, New account is inserted must check org \n Team Airtel');
            mail.setSenderDisplayName('Pankaj Dewhare');
            mailList.add(mail);
        }
          if(trigger.isAfter && trigger.isUpdate){
            if(objAcc.rating != trigger.oldMap.get(objAcc.id).rating){
                if(objAcc.rating == 'Cold' && trigger.oldMap.get(objAcc.id).rating == 'Hot'){
                    Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
                    mail.setToAddresses(New string [] {'pankaj.dewhare11@gmail.com'});
                    mail.setSubject('Account rating is updated to cold');
                    mail.setSenderDisplayName('Spartan IT Solution');
                    mail.setPlainTextBody('Hi Team, Account rating is updated \n Team Spartan');
                    mailList.add(mail);
                }
            }
        }
        
    }
        if(!mailList.isEmpty()){
        Messaging.sendEmail(mailList,false);
    } 
    list<Messaging.singleEmailMessage> mailListOld = new list<Messaging.singleEmailMessage>();
   for(Account objAcc : trigger.old){
        if(trigger.isAfter && trigger.isDelete){
            Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
            mail.setToAddresses(New string [] {'pankaj.dewhare11@gmail.com'});
            mail.setSubject('Account is Deleted');
            mail.setSenderDisplayName('Pankaj D');
            mail.setPlainTextBody('Hi Team, Account is deleted as per the task \n Team Airtel');
            mailList.add(mail);
        }
       
    }
    if(!mailListOld.isEmpty()){
        Messaging.sendEmail(mailListOld,false);
    }
}