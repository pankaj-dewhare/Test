public class QueuebleDemoClass2 implements Queueable {

    public void execute(QueueableContext Qc){
        system.debug('I am in Queueable demo class');
        Applicant__c objApp = new Applicant__c();
        objApp.First_Name__c = 'Madan Rao ';
        objApp.Last_Name__c = 'Pandhare';
        objApp.Gender__c = 'Male';
        INSERT objApp;
        
        
    }
}