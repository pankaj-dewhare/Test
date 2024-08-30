public class EmailVerificationIntegration {
    
    public static void EmailVerificationIntegrationMethod(){
        
        Http http = New Http();
        httpRequest request = New httpRequest();
        request.setEndPoint('https://emailvalidation.abstractapi.com/v1/?api_key=0e588202da4d41e8a98c58b507fc261e&email=pankaj.dewhare11@gmail.com');
        request.setMethod('GET');
        
        httpResponse response = http.send(request);
        
        system.debug('response status='+response.getStatusCode());
        system.debug('response body='+response.getBody());
        
        EmailVerificationIntegrationWrapper objWrap = New EmailVerificationIntegrationWrapper();
        EmailVerificationIntegrationWrapper objWrapInstance = objWrap.parse(response.getBody());
        
        system.debug('email value='+objWrapInstance.email);
        system.debug('deliverability value='+objWrapInstance.deliverability);
        
    }
    
    public class EmailVerificationIntegrationWrapper {
        
        public String email;
        public String autocorrect;
        public String deliverability;
        public String quality_score;
        
        public EmailVerificationIntegrationWrapper parse(String json) {
            return (EmailVerificationIntegrationWrapper) System.JSON.deserialize(json, EmailVerificationIntegrationWrapper.class);
        }
    }
}