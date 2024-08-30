public with sharing class IntegrationWithMobileClass {
    
    public static void integrationWithMobileMethod(){

        Http http = new http();
        httpRequest request = new httpRequest();
        request.setEndPoint('https://api.veriphone.io/v2/verify?phone=+917776804669&key=1167FD97AA2241C39EE61024E0083DD0');
        request.setMethod('GET');

       HttpResponse response = http.send(request);

        system.debug('response='+response.getStatusCode());
        system.debug('response='+response.getBody());

    }
}