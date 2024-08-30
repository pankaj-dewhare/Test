Public class AccountTrigger_33Helper{
    public static void deleteAccRecord(list<Account> accOldList){
        if(trigger.isBefore && trigger.isDelete){
        for(Account objAccOld : accOldList){
            if(objAccOld.SLA__c == 'Gold'){
                objAccOld.SLA__c.AddError('Account record can not be deleted if SLA is equal to Gold');
            }
        }
            }
    }
    public static void accountRecordCreation(List<Account> accList, Map<Id,Account> oldMapList){
        List<Messaging.singleEmailMessage> mailList = New List<Messaging.singleEmailMessage>();
        For(Account objAcc : accList){
            if(trigger.isInsert && trigger.isBefore){
                if(objAcc.type == 'Prospect'){
                    objAcc.rating = 'Hot';
                }else{
                    objAcc.rating = '';
                }
            }
            if(trigger.isBefore && trigger.isUpdate){
                if(objAcc.type != oldMapList.get(objAcc.id).type){
                    if(objAcc.type == 'Prospect'){
                        objAcc.rating = 'Hot';
                        Messaging.singleEmailMessage mail = New Messaging.singleEmailMessage();
                        mail.setSubject('Type = prospect');
                        mail.setToAddresses(new String[] {'pankaj.dewhare11@gmail.com'});
                        mail.setSenderDisplayName('Spartan IT Solution');
                        mail.setPlainTextBody('Rating is updated');
                        mailList.add(mail);
                    }else{
                        objAcc.rating = '';
                    }
                }
            }
        }
        if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList,false); 
            
        }
    } 
}