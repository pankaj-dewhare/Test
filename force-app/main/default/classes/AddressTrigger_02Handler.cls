public class AddressTrigger_02Handler {

    public static void beforeInsert(list<Address__c> AddressList){
        AddressTrigger_02Helper.UpdateAddressRecord(AddressList);
    }
    public static void beforeUpdate(list<Address__c> AddressList){
         AddressTrigger_02Helper.UpdateAddressRecord(AddressList);
    }
    public static void afterUndelete(list<Address__c> AddressList){
         AddressTrigger_02Helper.UpdateAddressRecord(AddressList);
    }
}