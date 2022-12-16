@IsTest
public with sharing class SoapCalloutMockPart2 implements WebServiceMock {
    public void doInvoke(
        Object stub,
        Object request,
        Map<String, Object> response,
        String endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType
    ){
        ParkServices.byCountryResponse response_x = new ParkServices.byCountryResponse();
        List<String> indianParks = new List<String>{'Anamudi Shola National Park', 'Anshi National Park', 'Bandipur National Park'};
        response_x.return_x = indianParks;
        response.put('response_x', response_x);
    }
}