public class UtilCallout {
    
    
    /** This method is dedicated to send Http Request and return the response from API */
    public static HttpResponse sendHttpRequest(HttpRequest httpRequest) {
        System.debug('sendHttpRequest '+String.valueOf(httpRequest));
        httpRequest.setTimeout(5000);
        Http http = new Http();
        HttpResponse httpResponse = new HttpResponse();
        httpResponse = http.send(httpRequest);
        System.debug('inside httpResponse ::'+httpResponse.getBody());
        return httpResponse;
    }
}