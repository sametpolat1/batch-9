@IsTest
public with sharing class SoapCallout_Test {

    @IsTest
    public static void makeCalloutSuccessTest(){
        //Fake Response setting up
        Test.setMock(WebServiceMock.class, new SoapCalloutMock());
        // Call the Soap Callout class
        Test.startTest();
        Double num1 = 5.0;
        Double num2 = 2.0;
        Double result = SoapCallout.makeCallout();
        Test.stopTest();
        //Verify Results
        System.assertEquals(10.0, result, 'Fake Response check to match the result');
    }

    @IsTest
    public static void makeCalloutPart2SuccessTest(){
        //Fake Response setting up
        Test.setMock(WebServiceMock.class, new SoapCalloutMockPart2());
        //Call the Soap Callout Class
        Test.startTest();
        String countryName = 'India';
        List<String> parks = SoapCallout.makeCalloutPart2();
        Test.stopTest();
        //Verify Results
        List<String> expectedResponse = new List<String>{'Anamudi Shola National Park', 'Anshi National Park', 'Bandipur National Park'};
        System.assertEquals(expectedResponse, parks, 'We should be getting 3 park results from India');
    }
}