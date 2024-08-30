
public with sharing class CntProvider {
    @AuraEnabled
    public static string contactCreationMethod(string frstName, string lstName, string emil){
        try {
            contact objCon = new contact(FirstName = frstName, LastName = lstName, Email = emil);

            if(objCon != null){
             INSERT objCon;
             return 'Record Has Been Created';
            }
            else{
                return 'Oops, Something went wrong';
            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}