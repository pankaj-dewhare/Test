public class ContactTrigger_22Handler {

    public static void beforeDelete(list<Contact> oldConList){
        ContactTrigger_22Helper.deleteMethod(oldConList);
    }
    public static void afterInsert(list<Contact> conList){
        ContactTrigger_22Helper.contactRecordInsert(conList);
    }
    
    public static void afterUpdate(list<Contact> conList){
       ContactTrigger_22Helper.contactRecordInsert(conList); 
    }
 
}