/**
 * SOAP (Simple Object Access Protocol) API Callout involves 3 Steps for Implementation:
 * 1. Get WSDL (Web Service Description Language) from External System
 * 2. Convert WSDL to APex Class Using Salesforce framework
 * 3. Consume the Apex Class to make Callout
 * 4. Remote Site Setting - Add only Domain
 */
public with sharing class SoapCallout {

    /**
     * Soap Callout to Calculator API
     */
    public static Double makeCallout(){
        CalculatorServices.CalculatorImplPort  calc = new CalculatorServices.CalculatorImplPort();
        Double num1 = 5.0;
        Double num2 = 2.0;
        Double result = calc.doMultiply(num1, num2);
        System.debug('Multiply Result: ' + result);
        return result;
    }

    /**
     * Soap Callout to Park API
     */
    public static List<String> makeCalloutPart2(){
        ParkServices.ParksImplPort park = new ParkServices.ParksImplPort();
        String countryName = 'India';
        List<String> result = park.byCountry(countryName);
        System.debug('Park Result: '+ result);
        return result;
    }

}