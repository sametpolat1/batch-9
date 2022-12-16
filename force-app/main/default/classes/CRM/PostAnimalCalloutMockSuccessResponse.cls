@istest
public with sharing class PostAnimalCalloutMockSuccessResponse implements HttpCalloutMock{
    public HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setStatusCode(201);
        response.setHeader('Content-Type', 'application/json; charset=utf-8');
        response.setBody('{"animals": ["majestic badger","fluffy bunny","scary bear","chicken","tiger"]}');
        return response;
    }
}
