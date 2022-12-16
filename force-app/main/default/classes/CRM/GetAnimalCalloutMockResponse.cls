@isTest

public with sharing class GetAnimalCalloutMockResponse {
    //Implemnt respond Interface method
    public HttpResponse respond(HttpRequest request) {
        //Create a fake response
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setBody('{"animals": ["majestic badger","fluffy bunny","scary bear","chicken", "tavuk"]}');
        response.setHeader('Content-Type', 'application/json; charset=utf-8');
        return response;

    }
}
