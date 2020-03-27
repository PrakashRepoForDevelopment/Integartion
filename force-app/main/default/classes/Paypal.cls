public class Paypal {
    
    public static void getAccessToken(){
        try{
            Paypal__c paypalCredentials = new Paypal__c();
            paypalCredentials = Paypal__c.getOrgDefaults();
            if(paypalCredentials != null && paypalCredentials.Client_Id__c != null 
               && paypalCredentials.End_Point__c != null && paypalCredentials.Client_Secret__c != null){
                   String endPointUrl = '';
                   HttpRequest httpRequest = new HttpRequest();   
                   //Set Credential for basic Authorization in Header
                   Blob credentialsInfo = Blob.valueOf(paypalCredentials.Client_Id__c + ':' + paypalCredentials.Client_Secret__c);
                   String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(credentialsInfo);
                   httpRequest.setHeader('Authorization', authorizationHeader);
                   if(paypalCredentials.End_Point__c.endsWith('/')){
                       endPointUrl = paypalCredentials.End_Point__c + 'oauth2/token?grant_type=client_credentials';
                   }else{
                       endPointUrl = paypalCredentials.End_Point__c + '/oauth2/token?grant_type=client_credentials';
                   }
                   // Set Methods
                   httpRequest.setMethod('POST');
                   // Set End Point
                   httpRequest.setEndpoint(endPointUrl);
                   // Set Content Type
                   httpRequest.setHeader('Content-Type','application/x-www-form-urlencoded'); 
                   HttpResponse httpResponse = new HttpResponse();
                   httpResponse = UtilCallout.sendHttpRequest(httpRequest);
                   System.debug('httpResponse  '+httpResponse);
                   System.debug('Status Code :: '+httpResponse.getStatusCode());
                   System.debug('Status  :: '+httpResponse.getStatus());
                   System.debug('Body  :: '+httpResponse.getBody());
                   if(httpResponse.getStatusCode() == 200){
                       PaypalData.AccessTokenResponse customerResponse = new PaypalData.AccessTokenResponse();
                       customerResponse = (PaypalData.AccessTokenResponse) JSON.deserialize(httpResponse.getBody(), PaypalData.AccessTokenResponse.class);
                       paypalCredentials.Access_Token__c = customerResponse.access_token;
                       paypalCredentials.Nonce__c = customerResponse.nonce;
                       paypalCredentials.Expires_In__c = customerResponse.expires_in;
                       Database.update(paypalCredentials, false);
                   }
                   
                   
               }
            
        }catch(Exception exp){
            System.debug('Exception message :: '+exp.getMessage()+' at line :: '+exp.getLineNumber()+' Apex '+exp.getStackTraceString() + ' Type :: '+exp.getTypeName());
        }
    }
    

}