public class GetAnimalInfo {
    public static void doCallout(){
        Http http = new Http();

        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        // request.setHeader('Authorization', 'access_token');

        HttpResponse response = new HttpResponse();
        response = http.send(request);

        System.debug('Response : ' + response);

        System.debug('Response : '+ response);
        if(response.getStatusCode() == 200){ //Success Callout
            System.debug('Response Body : '+ response.getBody());

            //Deserialize the JSON Response
            Map<String, Object> animalResults = (Map<String, Object>) JSON.deserializeUntyped (response.getBody());

            //Type cast from object to List of String

            List<Object> animals = (List<Object>) animalResults.get('animals');
            for(Object animal : animals){
                System.debug('Animal: ' + animal);
            }
        }
    }
}

