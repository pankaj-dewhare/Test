//Send an Email when Account Rating is updated to “Hot”.
trigger AccountTrigger_03 on Account (after update) {
    list<Messaging.SingleEmailMessage> mailList = new list<Messaging.singleEmailMessage>();
    For(Account objAcc : trigger.new){
       // string newRating = objAcc.rating;
       // string oldRating = trigger.oldMap.get(objAcc.id).rating;
        
        //if(newRating != oldRating){
       if(!string.isBlank(objAcc.rating) && objAcc.rating != trigger.oldMap.get(objAcc.Id).rating){
            if(objAcc.rating == 'Hot'){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(New string [] {'pankaj.dewhare11@gmail.com'});
            mail.setSubject('Rating is updated');
            mail.setSenderDisplayName('Pankaj');
            mail.setPlainTextBody('Hi Team \n  The rating to be updated \n Team Pankaj');
            mailList.add(mail);
        }
            }
        }
    
    if(!mailList.isEmpty()){
        Messaging.sendEmail(mailList, false);
    }
}