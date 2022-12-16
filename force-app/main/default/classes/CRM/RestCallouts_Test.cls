/**
 * Error: Methods defined as TestMethod do not support Web service callouts
 * Rest Callout Test Scenario can be covered using 2 Approaches:
 *  1. Static Resource Callout Mock
 *  2. Creating a Mock Response Using HttpCallout
 */
@IsTest
public with sharing class RestCallouts_Test {

    /**
     * Unit Test Sccess Response Scenario for Animal Heroku Callout - GET Method
     * Static resource Mock Approach
     * Step 1: Upload Response Body as a Static Resource
     * Step 2: Fetching Mock Response from Static Resource
     * Step 3: Link/Assosiate the MOCK Response to Unit Test context
     * Step 4: Invoke REST Callout
     * Step 5: Assertion Statements
     */
    @IsTest
    public static void getAnimalSuccessTestUsingStaticResource(){
        // Create a mock response based on our Static resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type' , 'application/json; charset=utf-8');
        //Assosiate the callout with this mock response
        Test.setMock(HttpCalloutMock.class, mock);

        Test.startTest();
        HttpResponse response = RestCallouts.getAnimals();
        Test.stopTest();

        System.assertNotEquals(null, response, 'The Callout returned not a null response');
        System.assertEquals(200, response.getStatusCode(), 'Success Response should be 200');
        System.assertEquals('application/json; charset=utf-8', response.getHeader('Content-Type'));

        //Verify JSON Body

        System.debug('Mock response prepared is : ' + response.getBody());
    }

    @isTest
    public static void getAnimalSuccessTestUsingCalloutMock(){
        // Create a mock response based on our Static resource

        Test.setMock(HttpCalloutMock.class, new GetAnimalCalloutMockResponse());

        Test.startTest();
        HttpResponse response = RestCallouts.getAnimals();
        Test.stopTest();

        System.assertNotEquals(null, response, 'The Callout returned not a null response');
        System.assertEquals(200, response.getStatusCode(), 'Success Response should be 200');
        System.assertEquals('application/json; charset=utf-8', response.getHeader('Content-Type'));

        //Verify JSON Body

        System.debug('Mock response prepared is : ' + response.getBody());
    }
    @istest
    public static void postAnimalsSuccessTest(){
                // Create a mock response based on our Static resource

        Test.setMock(HttpCalloutMock.class, new PostAnimalCalloutMockSuccessResponse());

        Test.startTest();
        HttpResponse response = RestCallouts.postAnimals();
        Test.stopTest();

        System.assertNotEquals(null, response, 'The Callout returned not a null response');
        System.assertEquals(201, response.getStatusCode(), 'Success Response should be 201');
        System.assertEquals('application/json; charset=utf-8', response.getHeader('Content-Type'));

        //Verify JSON Body

        System.debug('Mock response prepared is : ' + response.getBody());
    }
}
