public with sharing class googleAddressAutofill {
    
     /**
    * @description : Auto suggestion Web Service 
    * @param : input: SearchAddress , types: Results Types , langug : language for getting the      results
    * @return : string
    **/  
    @AuraEnabled
    public static string getSuggestions(String input) {
       String url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?'
            + 'input=' + EncodingUtil.urlEncode(input, 'UTF-8')
            + getKey();   
      
        String response = getResponse(url); 
        system.debug('Response suggestions***'+response);
        return response;
    }
    
     /**
    * @description : Place Details Web Service 
    * @param : PlaceId: Unique Place Id , langug : language for getting the results
    * @return : string
    **/ 
    @AuraEnabled
    public static string getPlaceDetails(String placeId) {
        String url = 'https://maps.googleapis.com/maps/api/place/details/json?'
            + 'placeid=' + EncodingUtil.urlEncode(placeId, 'UTF-8')
            + getKey(); 
        String response = getResponse(url);
        system.debug('Response places****'+response);
        return response;
    }
    
      /**
    * @description : Common Utility method for making call out
    * @param : String
    * @return : string
    **/
    
    public static string getResponse(string strURL){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        req.setMethod('GET');
        req.setEndpoint(strURL);
        req.setTimeout(120000);
        res = h.send(req); 
        String responseBody = res.getBody(); 
        system.debug('responseBody---'+responseBody);
        return responseBody; 
    }
    
     /**
    * @description : To get the google Api key from custom label
    * @param : 
    * @return : string
    **/
    public static string getKey(){
        /*Enter your API key here*/
        string key = 'AIzaSyB4NU2FCJTX_z0_FYKM2bs-v3Etd3PZ8K8';
        string output = '&key=' + key;   
        return output;
    }
    
    @AuraEnabled
    public static string getAddress(String recordId, String street, String city , String state, String country,string zip){
    	
    	Opportunity opp = new Opportunity();
    	warpper wrap = new warpper();
    	if(recordId != null){
    		try{
    			opp = [select id
                       from Opportunity
                       where id=: recordId];
    			
    			update opp;
    			system.debug('*****Successfully updated the Deal');
    			
                wrap.isSuccess = true;
    		}catch(Exception e){
                wrap.isSuccess = false;
                wrap.errormessage = e.getMessage().substringAfter(',');
    			system.debug('Exception**'+e.getLinenumber());
    		}
    	}
    	return JSON.serialize(wrap);
    } 
    
    
    
    public class warpper{
        @AuraEnabled
        public boolean isSuccess{get;set;}
        
        @AuraEnabled
        public String errormessage{get;set;}
    }
}