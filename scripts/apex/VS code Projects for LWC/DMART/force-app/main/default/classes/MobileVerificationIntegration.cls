public class MobileVerificationIntegration {
    
    @AuraEnabled
    public static void EmailVerificationIntegrationMethod(Id leadId){

      string mobileNumber = [Select Id, MobilePhone From Lead Where Id =: leadId].MobilePhone;
        
        Http http = New Http();
        httpRequest request = New httpRequest();
        request.setEndPoint('https://api.veriphone.io/v2/verify?phone='+mobileNumber+'&key=1167FD97AA2241C39EE61024E0083DD0');
        
        request.setMethod('GET');
        
      httpResponse response =  http.send(request);
        
        system.debug('code ='+response.getStatusCode());
        system.debug('Body='+response.getBody());

      

        if(response.getStatusCode() == 200){
        
        MobileVerificationIntegrationWrapper objWrap = New MobileVerificationIntegrationWrapper();
        MobileVerificationIntegrationWrapper objWrapInstance =  objWrap.parse(response.getBody());

        Lead objLead = New Lead(Id =leadId);
        objLead.Mobile_Verified__c = true;

        if(objWrapInstance.phone_valid == true){
          objLead.Mobile_Active__c = true;
          objLead.Mobile_Service_Operator__c = objWrapInstance.carrier;
        }
        else{
          objLead.Mobile_Active__c = false;
          objLead.Mobile_Service_Operator__c = '';
        }

        Update objLead;
    }
  }
    
    public class MobileVerificationIntegrationWrapper {

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

	
	public MobileVerificationIntegrationWrapper parse(String json) {
		return (MobileVerificationIntegrationWrapper) System.JSON.deserialize(json, MobileVerificationIntegrationWrapper.class);
	}
}


}