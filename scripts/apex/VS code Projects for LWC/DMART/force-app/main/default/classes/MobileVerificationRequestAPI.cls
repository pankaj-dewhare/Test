public class MobileVerificationRequestAPI {
    
    public static void mobileVerificationMethod(){
        
        Http http = New Http();
        HttpRequest request = New HttpRequest();
        
        request.setEndpoint('https://api.veriphone.io/v2/verify?phone=+919730237637&key=1167FD97AA2241C39EE61024E0083DD0');
        
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        system.debug('Response code= '+response.getStatusCode());
        system.debug('Response Body='+response.getBody());
        
        if(response.getStatusCode() == 200){
            
            mobileVerificationMethodWrapper objWrapper = New mobileVerificationMethodWrapper();
            mobileVerificationMethodWrapper objWrapperInstance = objWrapper.parse(response.getBody());
            
            system.debug('Status code wrapper status ='+objWrapperInstance.status);
            system.debug('Status code wrapper phone_valid ='+objWrapperInstance.phone_valid);
            
            
        }
        
    }
    
    public class mobileVerificationMethodWrapper {
        
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
        
        
        public mobileVerificationMethodWrapper parse(String json) {
            return (mobileVerificationMethodWrapper) System.JSON.deserialize(json, mobileVerificationMethodWrapper.class);
        }
    }
}