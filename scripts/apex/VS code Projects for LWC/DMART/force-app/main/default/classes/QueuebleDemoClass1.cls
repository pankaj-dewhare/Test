public class QueuebleDemoClass1 implements Queueable {

    public void execute(QueueableContext Qc){
        system.debug('I am in Queueable demo class');
        Contact objCon= new Contact();
        objCon.LastName = 'Test Queueable Contact';
        INSERT objCon;
        system.debug('Record is inserted='+objCon.LastName);
        
         Id jobId = system.enqueueJob(new QueuebleDemoClass2());
       system.debug('Queueable Jod QueuableDemoClass2  ='+jobId);
    }

}