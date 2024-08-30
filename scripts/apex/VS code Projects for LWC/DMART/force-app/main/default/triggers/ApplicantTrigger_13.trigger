//Send an Email When Pan Card is Updated.
trigger ApplicantTrigger_13 on Applicant__c (after update) {
    list<Messaging.singleEmailMessage> mailList = new list<Messaging.singleEmailMessage>();
        for(Applicant__c objApp : trigger.new){
            if(trigger.isAfter && trigger.isUpdate){
            if(objApp.PAN_Card__c != trigger.oldMap.get(objApp.id).pan_card__c){
               Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
                mail.setToAddresses(New string [] {'pankaj.dewhare11@gmail.com'});
                mail.setSubject('Pan card is updated');
                mail.setSenderDisplayName('Pankaj');
                mail.setPlainTextBody('Hi Team, The pan card is updated must check \n Team Airtel');
                mailList.add(mail);
            }
        }
    }
    if(!mailList.isEmpty()){
        Messaging.sendEmail(mailList, false);
    }
}