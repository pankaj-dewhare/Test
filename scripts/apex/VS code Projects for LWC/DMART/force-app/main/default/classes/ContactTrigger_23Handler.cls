public class ContactTrigger_23Handler {
    public static void beforeInsert(list<Contact> conListNew){
        ContactTrigger_23Helper.beforeInsertHelperMethod(conListNew);
    }
    public static void beforeUpdate(list<Contact> conListNew){
        ContactTrigger_23Helper.beforeInsertHelperMethod(conListNew);
    }
    public static void afterInsert(list<Contact> conList){
        ContactTrigger_23Helper.contactRecordCreation(conList);
    }
    public static void afterUpdate(list<Contact> conList){
        ContactTrigger_23Helper.contactRecordCreation(conList);
    }
    

}