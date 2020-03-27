public class RazorpayAuth {
    /**
* Razorpay API support basic authorization
* 
*/ 
    
    public static void createCustomers(String name, String email, String contact, String notes){
        try{
            Razorpay__c razorpayCredentials = new Razorpay__c();
            razorpayCredentials = Razorpay__c.getOrgDefaults();
            if(razorpayCredentials != null && razorpayCredentials.Key_Id__c != null 
               && razorpayCredentials.End_Point__c != null && razorpayCredentials.Key_Secret__c != null){
                   System.debug('custom setting value ');
                   RazorpayWrappers.RazorpayCreateCustomer requestCustomer = new RazorpayWrappers.RazorpayCreateCustomer();
                   requestCustomer.name = 'name tiwari';
                   requestCustomer.email = 'email@gamil.com';
                   requestCustomer.contact = '+918966987896';  
                   requestCustomer.notes = 'notes for customer';
                   System.debug('requestCustomer '+requestCustomer);
                   HttpRequest httpRequest = new HttpRequest();   
                   //Set Credential for basic Authorization in Header
                   Blob credentialsInfo = Blob.valueOf(razorpayCredentials.Key_Id__c + ':' + razorpayCredentials.Key_Secret__c);
                   String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(credentialsInfo);
                   httpRequest.setHeader('Authorization', authorizationHeader);
                   if(razorpayCredentials.End_Point__c.endsWith('/')){
                       razorpayCredentials.End_Point__c += 'customers';
                   }else{
                       razorpayCredentials.End_Point__c += '/customers';
                   }
                   // Set Methods
                   httpRequest.setMethod('POST');
                   // Set End Point
                   httpRequest.setEndpoint(razorpayCredentials.End_Point__c);
                   // Set Content Type
                   httpRequest.setHeader('Content-Type','application/josn'); 
                   //Set Body
                   String bodyString = JSON.serialize(requestCustomer);
                   httpRequest.setBody(bodyString);
                   
                   
                   HttpResponse httpResponse = new HttpResponse();
                   httpResponse = UtilCallout.sendHttpRequest(httpRequest);
                   System.debug('httpResponse  '+httpResponse);
                   System.debug('Status Code :: '+httpResponse.getStatusCode());
                   System.debug('Status  :: '+httpResponse.getStatus());
                   System.debug('Body  :: '+httpResponse.getBody());
                   if(httpResponse.getStatusCode() == 200){
                       RazorpayWrappers.RazorpayCustomer customerResponse = new RazorpayWrappers.RazorpayCustomer();
                       customerResponse = (RazorpayWrappers.RazorpayCustomer) JSON.deserialize(httpResponse.getBody(), RazorpayWrappers.RazorpayCustomer.class);
                       System.debug('customerResponse  :: '+customerResponse);
                   }
                   
                   
               }
            
        }catch(Exception exp){
            System.debug('Exception message :: '+exp.getMessage()+' at line :: '+exp.getLineNumber()+' Apex '+exp.getStackTraceString() + ' Type :: '+exp.getTypeName());
        }
    }
    public static void updateCustomers(String customerId){
        try{
            Razorpay__c razorpayCredentials = new Razorpay__c();
            razorpayCredentials = Razorpay__c.getOrgDefaults();
            if(razorpayCredentials != null && razorpayCredentials.Key_Id__c != null 
               && razorpayCredentials.End_Point__c != null && razorpayCredentials.Key_Secret__c != null){
                   System.debug('custom setting value ');
                   RazorpayWrappers.RazorpayCreateCustomer requestCustomer = new RazorpayWrappers.RazorpayCreateCustomer();
                   requestCustomer.name = 'name tiwari';
                   requestCustomer.email = 'email@gamil.com';
                   requestCustomer.contact = '+918966987896';  
                   requestCustomer.notes = 'notes for customer';
                   System.debug('requestCustomer '+requestCustomer);
                   HttpRequest httpRequest = new HttpRequest();   
                   //Set Credential for basic Authorization in Header
                   Blob credentialsInfo = Blob.valueOf(razorpayCredentials.Key_Id__c + ':' + razorpayCredentials.Key_Secret__c);
                   String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(credentialsInfo);
                   httpRequest.setHeader('Authorization', authorizationHeader);
                   if(razorpayCredentials.End_Point__c.endsWith('/')){
                       razorpayCredentials.End_Point__c += 'customers/'+customerId;
                   }else{
                       razorpayCredentials.End_Point__c += '/customers/'+customerId;
                   }
                   // Set Methods
                   httpRequest.setMethod('PUT');
                   // Set End Point
                   httpRequest.setEndpoint(razorpayCredentials.End_Point__c);
                   // Set Content Type
                   httpRequest.setHeader('Content-Type','application/josn'); 
                   //Set Body
                   String bodyString = JSON.serialize(requestCustomer);
                   httpRequest.setBody(bodyString);
                   
                   
                   HttpResponse httpResponse = new HttpResponse();
                   httpResponse = UtilCallout.sendHttpRequest(httpRequest);
                   System.debug('httpResponse  '+httpResponse);
                   System.debug('Status Code :: '+httpResponse.getStatusCode());
                   System.debug('Status  :: '+httpResponse.getStatus());
                   System.debug('Body  :: '+httpResponse.getBody());
                   if(httpResponse.getStatusCode() == 200){
                       RazorpayWrappers.RazorpayCustomer customerResponse = new RazorpayWrappers.RazorpayCustomer();
                       customerResponse = (RazorpayWrappers.RazorpayCustomer) JSON.deserialize(httpResponse.getBody(), RazorpayWrappers.RazorpayCustomer.class);
                       System.debug('customerResponse  :: '+customerResponse);
                   }
                   
                   
               }
            
        }catch(Exception exp){
            System.debug('Exception message :: '+exp.getMessage()+' at line :: '+exp.getLineNumber()+' Apex '+exp.getStackTraceString() + ' Type :: '+exp.getTypeName());
        }
    }
    public static void getCustomers(){
        try{
            Razorpay__c razorpayCredentials = new Razorpay__c();
            razorpayCredentials = Razorpay__c.getOrgDefaults();
            if(razorpayCredentials != null && razorpayCredentials.Key_Id__c != null 
               && razorpayCredentials.End_Point__c != null && razorpayCredentials.Key_Secret__c != null){
                   
                   HttpRequest httpRequest = new HttpRequest();   
                   //Set Credential for basic Authorization in Header
                   Blob credentialsInfo = Blob.valueOf(razorpayCredentials.Key_Id__c + ':' + razorpayCredentials.Key_Secret__c);
                   String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(credentialsInfo);
                   httpRequest.setHeader('Authorization', authorizationHeader);
                   if(razorpayCredentials.End_Point__c.endsWith('/')){
                       razorpayCredentials.End_Point__c += 'customers';
                   }else{
                       razorpayCredentials.End_Point__c += '/customers';
                   }
                   // Set Methods
                   httpRequest.setMethod('GET');
                   // Set End Point
                   httpRequest.setEndpoint(razorpayCredentials.End_Point__c);
                   
                   
                   HttpResponse httpResponse = new HttpResponse();
                   httpResponse = UtilCallout.sendHttpRequest(httpRequest);
                   System.debug('httpResponse  '+httpResponse);
                   System.debug('Status Code :: '+httpResponse.getStatusCode());
                   System.debug('Status  :: '+httpResponse.getStatus());
                   System.debug('Body  :: '+httpResponse.getBody());
                   if(httpResponse.getStatusCode() == 200){
                       RazorpayWrappers.Customers customersResponse = new RazorpayWrappers.Customers();
                       customersResponse = (RazorpayWrappers.Customers) JSON.deserialize(httpResponse.getBody(), RazorpayWrappers.Customers.class);
                       System.debug('customerResponse  :: '+customersResponse);
                   }
                   
                   
               }
            
        }catch(Exception exp){
            System.debug('Exception message :: '+exp.getMessage()+' at line :: '+exp.getLineNumber()+' Apex '+exp.getStackTraceString() + ' Type :: '+exp.getTypeName());
        }
    }
    public static void getCustomer(String customerId){
        try{
            if(String.isNotBlank(customerId)){
                Razorpay__c razorpayCredentials = new Razorpay__c();
                razorpayCredentials = Razorpay__c.getOrgDefaults();
                if(razorpayCredentials != null && razorpayCredentials.Key_Id__c != null 
                   && razorpayCredentials.End_Point__c != null && razorpayCredentials.Key_Secret__c != null){
                       
                       HttpRequest httpRequest = new HttpRequest();   
                       //Set Credential for basic Authorization in Header
                       Blob credentialsInfo = Blob.valueOf(razorpayCredentials.Key_Id__c + ':' + razorpayCredentials.Key_Secret__c);
                       String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(credentialsInfo);
                       httpRequest.setHeader('Authorization', authorizationHeader);
                       if(razorpayCredentials.End_Point__c.endsWith('/')){
                           razorpayCredentials.End_Point__c += 'customers/'+customerId;
                       }else{
                           razorpayCredentials.End_Point__c += '/customers/'+customerId;
                       }
                       // Set Methods
                       httpRequest.setMethod('GET');
                       // Set End Point
                       httpRequest.setEndpoint(razorpayCredentials.End_Point__c);
                       
                       
                       HttpResponse httpResponse = new HttpResponse();
                       httpResponse = UtilCallout.sendHttpRequest(httpRequest);
                       System.debug('httpResponse  '+httpResponse);
                       System.debug('Status Code :: '+httpResponse.getStatusCode());
                       System.debug('Status  :: '+httpResponse.getStatus());
                       System.debug('Body  :: '+httpResponse.getBody());
                       if(httpResponse.getStatusCode() == 200){
                           RazorpayWrappers.RazorpayCustomer customersResponse = new RazorpayWrappers.RazorpayCustomer();
                           customersResponse = (RazorpayWrappers.RazorpayCustomer) JSON.deserialize(httpResponse.getBody(), RazorpayWrappers.RazorpayCustomer.class);
                           System.debug('customerResponse  :: '+customersResponse);
                       }
                       
                       
                   }
            }
            
        }catch(Exception exp){
            System.debug('Exception message :: '+exp.getMessage()+' at line :: '+exp.getLineNumber()+' Apex '+exp.getStackTraceString() + ' Type :: '+exp.getTypeName());
        }
    }
    
    
}