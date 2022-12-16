/**
 * Example of Inbound Integration to Salesforce
 * Create Apex WebService - Expose it through REST Api
 * HTTP Methods - GET, POST, PATCH, DELETE
 * Good Pratice - Always try to Use Global modifier when exposing Web Service - So it can be accessed externally
 * UrlMapping - Resource Identifier. e.g. Domain + UrlMapping = EndPoint
 *
 * Whenever we are setting up any Inbound Integration with Salesforce
 * 1. Authroziatiom - Create Connected App (Monitoring tool) - BEST PRACTICE
 * 2. Authentication - Create a User Account (Username + Password)
 * https://login.salesforce.com/
 *
 * Connected APp Details
 * Consumer Key: 3MVG9n_HvETGhr3AXgdfTQAhPAh1UWGFuhKtJB5pO9BAnqM1Ty_o4DhkFYCFzgl36d0rqmoT2le_om_UrGrk6
 * Consumer Secret: 3661D827A3C7E80FCF7F87C3DAC0012DD1B7D87CD6979D7B3CC6934735996299
 */
@RestResource(urlmapping='/CaseManager/*')
global with sharing class RestWebService {

    /**
     * This Method is exposing Case record by their Salesforce Id
     * Endpoint - https://abinash-panigrahi-0113-dev-ed.my.salesforce.com/services/apexrest/CaseManager/5002w000003zzJxAAI
     */
    @HttpGet
    global static Case getCasebyId(){
        // grab the caseId from the end of tyhe URL
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        System.debug('Case RecordId : '+ caseId);
        Case result = [SELECT CaseNumber, Status, Subject, Origin, Priority, Description FROM Case WHERE Id=: caseId];
        System.debug('Case Record : '+ result);
        return result;
    }
 /**
     * This Method is deleting Case record by their Salesforce Id
     * Endpoint - https://polat4-dev-ed.my.salesforce.com/services/apexrest/CaseManager/5008d000008bdhBAAQ
     * HTTP Method - DELETE
     */


    @HttpDelete
    global static void deleteCase(){
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        List<Case> result = [SELECT Id FROM Case WHERE Id =: caseId];
        //delete result;
        RestResponse response = RestContext.response;
        if(!result.isEmpty()){
            delete result[0];
            response.statusCode = 204;
            response.responseBody = Blob.valueOf('Deletion Successful! :)');
        } else {
            response.statusCode = 404;
            response.responseBody = Blob.valueOf('Error encountered, Record doesnot exist ! :(');
        }


    }


}