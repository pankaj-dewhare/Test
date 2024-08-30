public class FutureMethodDemoClass {
    
    public FutureMethodDemoClass(){
        system.debug('I am in Constructor method');
        method1();
        method2();
       
        method4(5, 'Ram');
     
    list<string> nameList = new list<string>();
    nameList.add('Eena');
    nameList.add('meena');
    nameList.add('deeka');
    
    set<Id> idSet = new set<Id>();
        idSet.add('001GC00003es2aAYAQ');
        idSet.add('001GC00003es2XfYAI');
        idSet.add('001GC00003es0V0YAI');
        
         method3(nameList,idSet);
        
        //Inserting account record
        Account a = new Account();
        a.Name = 'Cinemax';
        Insert a;
        
        List<Contact> conList = new list<Contact>();
        Contact c = new contact();
        c.LastName = 'Vaidya';
        conList.add(c);
        
        Contact c1 = new contact();
        c1.LastName = 'Lokhande';
        conList.add(c1);
        
        INSERT conList;
        
   //    method5(a, conList);
        method6(a, conList);
   }
    public void method1(){
        system.debug('I am in method1 method');
    }
   
    public void method2(){
        system.debug('I am in method2 method');
    }
    @Future (callout = true)
    public static void method3(list<String> nList, set<Id> iSet){
        system.debug('I am static void method3 method');
        system.debug('nList='+nList);
        system.debug('iSet='+iSet);
    }
    @Future
    public static void method4(integer i, string s){
         system.debug('I am static void method4 method');
        system.debug('I='+i);
        system.debug('S='+s);
        
    }
   /* @future
    public static void method5(Account objAcc , List<Contact> cList){
         system.debug('I am static void method5 method');
    }*/
    
    public static void method6(Account objAcc , List<Contact> cList){
         system.debug('I am static void method6 method');
    }
    
}