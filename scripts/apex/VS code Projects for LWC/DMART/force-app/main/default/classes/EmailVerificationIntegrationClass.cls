public class EmailVerificationIntegrationClass {
    
    @AuraEnabled
    public static void EmailVerificationIntegrationClassMethod(Id accId){

      string EmailId = [Select Id, Email__c From Account Where Id =: accId].Email__c;
        
        Http http = New Http();
        httpRequest request = New httpRequest();
        request.setEndpoint('https://emailvalidation.abstractapi.com/v1/?api_key=0e588202da4d41e8a98c58b507fc261e&email='+EmailId+'');
        
        request.setMethod('GET');
        
        httpResponse response = http.send(request); // it will hit the target
        
        system.debug('Status code ='+response.getStatusCode());
        system.debug('Body='+response.getBody());

        if(response.getStatusCode() == 200){

        EmailVerificationIntegrationClassWrapper objWrap = new EmailVerificationIntegrationClassWrapper();
        EmailVerificationIntegrationClassWrapper objWrapInstance = objWrap.parse(response.getBody());

        Account objAcc = New Account(id=accId);
        objAcc.Mail_Verified__c = true;

        if(objWrapInstance.deliverability == 'DELIVERABLE'){
          objAcc.Mail_Active__c = true;

        }
        else{
          objAcc.Mail_Active__c = false;
        }

        update objAcc;
        
        system.debug('objWrapInstance='+objWrapInstance.email);
        system.debug('objWrapInstance='+objWrapInstance.autocorrect);
        system.debug('objWrapInstance='+objWrapInstance.deliverability);
        system.debug('objWrapInstance='+objWrapInstance.quality_score);
        
         }
      }
    
    public class EmailVerificationIntegrationClassWrapper {

	public String email;
	public String autocorrect;
	public String deliverability;
	public String quality_score;

	
	public EmailVerificationIntegrationClassWrapper parse(String json) {
		return (EmailVerificationIntegrationClassWrapper) System.JSON.deserialize(json, EmailVerificationIntegrationClassWrapper.class);
	}
}


}