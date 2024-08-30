public class QueuableDemoClass implements Queueable{
    
    public void execute(QueueableContext Qc){
        system.debug('I am in Queueable demo class');
        Account objAcc = new Account();
        objAcc.Name = 'Test Queueable Account';
        INSERT objAcc;
        system.debug('Record is inserted='+objAcc.Name);
        
        Id jobId = system.enqueueJob(new QueuebleDemoClass1());
       system.debug('Queueable Jod QueuableDemoClass1  ='+jobId);
    }

}

 // Below code is running a queueable class by anonomous window for getting a job id
        // By UI Level
        /*QueuableDemoClass qd = new QueuableDemoClass();
          Id jobId = system.enqueueJob(qd);
          system.debug('Queueable Jod Id ='+jobId);*/
        
        // SOQL Level
        // Select status, NumberOfErrors From AsyncApexJob Where Id = '707GC0000MnPhLG'