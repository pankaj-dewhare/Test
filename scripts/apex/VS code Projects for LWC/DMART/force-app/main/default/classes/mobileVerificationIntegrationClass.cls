public class mobileVerificationIntegrationClass {
    
    @AuraEnabled
    public static void integrationMobileVerifyMethod(Id contactId){

        string mobileNumber = [Select Id, mobilePhone From Contact Where Id =: contactId].mobilePhone;
        
        Http http = new Http();
        httpRequest request = new httpRequest();
        request.setEndpoint('https://api.veriphone.io/v2/verify?phone='+mobileNumber+'&key=1167FD97AA2241C39EE61024E0083DD0');
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        
        system.debug('response='+response.getStatusCode());
        system.debug('response='+response.getBody());

        
        
        mobileVerificationIntegrationClassWrapper objWrap = New mobileVerificationIntegrationClassWrapper();
        mobileVerificationIntegrationClassWrapper objWrapInstance = objWrap.parse(response.getBody());
        
        system.debug('Status='+objWrapInstance.status);
        system.debug('Phone valid ='+objWrapInstance.phone_valid);
        
        Contact objCon = new contact(Id=contactId);

        objCon.Mobile_Verified__c = true;

        if(objWrapInstance.phone_valid == true){
            objCon.Mobile_Active__c = true;
            objCon.Mobile_Service_Operator__c = objWrapInstance.carrier;
        }
        else{
            objCon.Mobile_Active__c = false;
            objCon.Mobile_Service_Operator__c = '';
        }

        update objCon;
        
    }
    
    public class mobileVerificationIntegrationClassWrapper{
        
        public String status;
        public String phone;
        public Boolean phone_valid;
        public String phone_type;
        public String phone_region;
        public String country;
        public String country_code;
        public String country_prefix;
        public String international_number;
        public String local_number;
        public String e164;
        public String carrier;
        
        
        public mobileVerificationIntegrationClassWrapper parse(String json) {
            return (mobileVerificationIntegrationClassWrapper) System.JSON.deserialize(json, mobileVerificationIntegrationClassWrapper.class);
        }
    }
    
}