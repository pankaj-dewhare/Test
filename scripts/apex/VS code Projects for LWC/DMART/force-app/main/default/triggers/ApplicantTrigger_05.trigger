//Send an Email When Pan Card is Updated.
trigger ApplicantTrigger_05 on Applicant__c (after insert, after update) {
    List<Messaging.singleEmailMessage> mailList = new list<Messaging.singleEmailMessage>();
    For(Applicant__c objApp : trigger.new){
        if(trigger.isAfter && trigger.isInsert){
            if(!string.isBlank(objApp.pan_card__c)){
                Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
                mail.setToAddresses(New string [] {'pankaj.dewhare11@gmail.com'});
                mail.setSubject('Pan card is updated');
                mail.setSenderDisplayName('Pankaj insert record with pan field filled');
                mail.setPlainTextBody('Hi Team, Pan card added record added');
                mailList.add(mail);
            }
        }
        if(trigger.isAfter && trigger.isUpdate){
            if(objApp.pan_card__c != trigger.oldMap.get(objApp.id).pan_card__c){
                Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
                mail.setToAddresses(New string [] {'pankaj.dewhare11@gmail.com'});
                mail.setSubject('Pan card is newly updated');
                mail.setSenderDisplayName('Pankaj update pan record');
                mail.setPlainTextBody('Hi Team, Pan card updated record added');
                mailList.add(mail);
            }
        }
    }
    if(!mailList.isEmpty()){
        Messaging.sendEmail(mailList,false);
    }
}