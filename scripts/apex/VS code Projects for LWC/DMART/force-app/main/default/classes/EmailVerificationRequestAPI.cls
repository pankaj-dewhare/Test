public class EmailVerificationRequestAPI {

    public static void EmailVerificationRequestAPIMethod(){
        
        Http http = new Http();
        HttpRequest request = New HttpRequest(); 
        
        request.setEndpoint('https://emailvalidation.abstractapi.com/v1/?api_key=0e588202da4d41e8a98c58b507fc261e&email=pankaj.dewhare11@gmail.com');
        
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        
        system.debug('Status code ='+response.getStatusCode());
        system.debug('Status code ='+response.getBody());  
        
        EmailVerificationRequestAPIWrapper objWrap = New EmailVerificationRequestAPIWrapper();
        EmailVerificationRequestAPIWrapper objWrapInstance = objWrap.parse(response.getBody());
        
        system.debug('Email Id'+objWrapInstance.email);
        system.debug('Deliverability ='+objWrapInstance.deliverability);
    }
    
    
   public class EmailVerificationRequestAPIWrapper {

	public String email;
	public String autocorrect;
	public String deliverability;
	public String quality_score;

	
	public EmailVerificationRequestAPIWrapper parse(String json) {
		return (EmailVerificationRequestAPIWrapper) System.JSON.deserialize(json, EmailVerificationRequestAPIWrapper.class);
	}
  }
}