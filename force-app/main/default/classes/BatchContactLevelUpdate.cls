global class BatchContactLevelUpdate implements Database.Batchable<sObject>{
   
    global Database.QueryLocator start(Database.BatchableContext BC){
        
      return Database.getQueryLocator('Select id, Level__c, Email From Contact');
        
    }
    global void execute(Database.BatchableContext BC, list<Contact> conList){
        if(!conList.isEmpty()){
            For(Contact objCon : conList){
                if(string.isNotBlank(objCon.Email)){
                    objCon.Level__c = 'Primary';
                }
                else{
                    objCon.Level__c = '';
                }
            }
            database.update(conList, false);
        }
        
    }
    global void finish(Database.BatchableContext BC){
        
    }
    
}