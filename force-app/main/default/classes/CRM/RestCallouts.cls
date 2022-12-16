/**
Main GOAL: APEX REST Callout from Salesforce to External System
Step 1: Create Remote Site Setting
Step 2: Dry Run with Insomnia/Postman to replicate Our Callout Scenario
Step 3: Create REST Request
Step 4: Sending REST Request
Step 5: Geting REST Response
Step 6: Parsing REST Response
    6.a - Manually Deserialising JSON Response. Then Looping through and find the correct Key and Value
    6.a - Using Apex Wrapper Class for desearialisation
*/
public with sharing class RestCallouts {

    public static HttpResponse getAnimals(){
        //Prepare REST Request
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');

        // Make REST Callout
        Http http = new Http();

        HttpResponse response = new HttpResponse();
        response = http.send(request);

        // Receive REST Response
        System.debug('Response Object: ' + response);
        System.debug('Response Staus: ' + response.getStatus());
        System.debug('Response StatusCode: ' + response.getStatusCode());
        System.debug('Response Body: ' + response.getBody());

        if(response.getStatusCode() == 200){ // Successful Response
            /**
                Status Code to remember:
                200 - Success Reposne code for GET Request
                201 - Sucess Response code for POST/PUT Request
                401 - UnAuthroized
                400 - Error URI
             */

            // Map<String, Object> animalInfo = (Map<String, Object>) JSON.deserializeUntyped (response.getBody());

            // List<Object> animals = (List<Object>) animalInfo.get('animals');
            // for(Object animal : animals){
            //     String animalName = (String) animal;
            //     System.debug('Animal : ' + animal);
            // }

            AnimalWrapper result = (AnimalWrapper) JSON.deserialize(response.getBody(), AnimalWrapper.class);

            for(String anm : result.animals){
                System.debug('Animals : ' + anm);
            }


        } 
        return response;
    }

    public class AnimalWrapper {
        public List<String> animals;
    }

    public static HttpResponse postAnimals(){
        //Prepare REST Request

        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setHeader('Content-Type','application/json');
        String requestBody = '{"name" : "fluffy bunny"}';
        request.setBody(requestBody);

        Http http = new Http();

        HttpResponse response = new HttpResponse();
        response = http.send(request);

        // Receive REST Response
        System.debug('Response Object: ' + response);
        System.debug('Response Staus: ' + response.getStatus());
        System.debug('Response StatusCode: ' + response.getStatusCode());
        System.debug('Response Body: ' + response.getBody());

        //Process REST Response
        if(response.getStatusCode() == 201){
            System.debug('Animal Resource is CREATED!!!');
        }else{
            System.debug('Animal Resource is NOT CREATED!!!');
        }

        return response;
    }

    public static HttpResponse getUsers(){
        //Prepare HTTP Request
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://gorest.co.in/public/v2/users');
        //Make REST Callout

        Http http = new Http();
        HttpResponse response = new HttpResponse();
        response = http.send(request);

        // Receive REST Response
        System.debug('Response Object: ' + response);
        System.debug('Response Staus: ' + response.getStatus());
        System.debug('Response StatusCode: ' + response.getStatusCode());
        System.debug('Response Body: ' + response.getBody());

        if(response.getStatusCode() == 200){
            String jsonString = response.getBody();
            //Approach 1 - Manual Deserialization
            List<Object> userInfo = (List<Object>) JSON.deserializeUntyped(jsonString);
            for(Object user : userInfo){
                Map<String, Object> result = (Map<String, Object>) user;
                String userName = (String) result.get('name');
                System.debug('Famous Person Name : ' + userName);

                String userEmail = (String) result.get('email');
                System.debug('Famous Person Email : ' + userEmail);

                System.debug('Famous Person Gender : ' + result.get('gender'));
                System.debug('Famous Person Status : ' + result.get('status'));
                Integer id = (Integer) result.get('id');
                System.debug('Famous Person Id : ' + id);
            }

            // Approach 2 - 
            List<UserResponse> users = (List<UserResponse>) JSON.deserialize(jsonString, List<UserResponse>.class);
            for(UserResponse user : users){
                String userName = user.name;
                System.debug('Famous Person Name #2: ' + userName);

                String userEmail = user.email;
                System.debug('Famous Person Email #2: ' + userEmail);

                System.debug('Famous Person Gender #2: ' + user.gender);
                System.debug('Famous Person Status #2: ' + user.status);
                System.debug('Famous Person Id #2: ' + user.id);
            }
        }
        return response;
    }

    // Inner Wrapper Class
    public class UserResponse{
        public Integer id;
        public String name;
        public String email;
        public String gender;
        public String status;
    }

    public static HttpResponse deleteUser(){
        HttpRequest request = new HttpRequest();
        request.setMethod('DELETE');
        request.setEndpoint('https://reqres.in/api/users/2');

        Http http = new Http();
        HttpResponse response = new HttpResponse();
        response = http.send(request);

        // Receive REST Response
        System.debug('Response Object: ' + response);
        System.debug('Response Staus: ' + response.getStatus());
        System.debug('Response StatusCode: ' + response.getStatusCode());
        System.debug('Response Body: ' + response.getBody());

        if(response.getStatusCode() == 204){
            System.debug('Resources Successfully Deleted!');
        }else{
            System.debug('Resources deletion Failed');
        }
        return response;
    }

    /*
    * REST Callout - POST Method 
    * Create a resource in Server
    */

    public static void postUser(){
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('https://reqres.in/api/users');

        //Prepare JSON Body
        UserRequest obj = new UserRequest();
        obj.name = 'Ozhan Gunes';
        obj.job = 'Salesforce Architecth';
        String jsonString = JSON.serialize(obj); //'{"name" : "Ozhan Gunes","job" : "Salesforce Developer"}'
        System.debug('JsonString : ' + jsonString);

        request.setBody(jsonString);
        request.setHeader('Content-Type','application/json');


        Http http = new Http();
        HttpResponse response = new HttpResponse();
        response = http.send(request);


        // Receive REST Response
        System.debug('Response Object: ' + response);
        System.debug('Response Staus: ' + response.getStatus());
        System.debug('Response StatusCode: ' + response.getStatusCode());
        System.debug('Response Body: ' + response.getBody());

        if(response.getStatusCode() == 201){
            System.debug('Resources Successfully Created!');
        }else{
            System.debug('Resources creation Failed');
        }
    }

    // Inner Wrapper Class
    public class UserRequest {
        public String name;
        public String job;
        public String id;
        public String createdAt; 
    }

    /**
    *REST Callout - GET Method with Authentication */

    public static HttpResponse getAnimalWithAuthentication(){
        //Prepare REST Request
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');

        //pass on Authentication Details

        /**
         * 3 Commonly Used AUthentication Modules/Approaches
         * 1. BASIC Authenication - Username & Password are key attributes.
         * 2. API Token Authentication - APi Token 30-128 Characters Alpha Numeric act as Identifier
         * 3. OAuth 2.0 - ClientId, ClientSecret (Identify Client identication), Username, Password (Identify User/Account)
         */
        String username = 'ozhan@test.com';
        String password = 'Test1234';
        Blob requestblob = Blob.valueOf(username + ':' + password);
        String authorizationString = 'BASIC' + EncodingUtil.base64Encode(requestblob);
        request.setHeader('Authorization', authorizationString);


        // Make REST Callout
        Http http = new Http();

        HttpResponse response = new HttpResponse();
        response = http.send(request);

        // Receive REST Response
        System.debug('Response Object: ' + response);
        System.debug('Response Staus: ' + response.getStatus());
        System.debug('Response StatusCode: ' + response.getStatusCode());
        System.debug('Response Body: ' + response.getBody());

        if(response.getStatusCode() == 200){ // Successful Response
            /**
                Status Code to remember:
                200 - Success Reposne code for GET Request
                201 - Sucess Response code for POST/PUT Request
                401 - UnAuthroized
                400 - Error URI
             */

            // Map<String, Object> animalInfo = (Map<String, Object>) JSON.deserializeUntyped (response.getBody());

            // List<Object> animals = (List<Object>) animalInfo.get('animals');
            // for(Object animal : animals){
            //     String animalName = (String) animal;
            //     System.debug('Animal : ' + animal);
            // }

            AnimalWrapper result = (AnimalWrapper) JSON.deserialize(response.getBody(), AnimalWrapper.class);

            for(String anm : result.animals){
                System.debug('Animals : ' + anm);
            }
        } 
        return response;
    }
}
