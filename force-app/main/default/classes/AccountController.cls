/**
 * Fetch 10 ACcount records
*/
public with sharing class AccountController {

    // AuraEnabled tag is mandatory to expose Apex method to LWC
    // method modifier - public/global; static method defination -- Mandatory
    // cacheable feature is only referred - if we are using Wire Adapters
    // WITH SECURITY_ENFORCED will impose FLS (Field Level Security) check by deafult
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsApex() {
        return [SELECT Id, Name, Type, Industry, AnnualRevenue 
                FROM Account 
                WHERE AnnualRevenue != null 
                WITH SECURITY_ENFORCED 
                ORDER BY AnnualRevenue 
                LIMIT 10 ];
    }

    @AuraEnabled
    public static List<Account> searchAccountsByName ( String searchKeyword){
        searchKeyword = '%' + searchKeyword + '%' ; 
        
        return [SELECT Id,Name,Type, Industry,AnnualRevenue,AccountNumber
                FROM Account
                WHERE Name 
                LIKE: searchKeyword
                WITH SECURITY_ENFORCED];
    }

    @AuraEnabled
    public static List<Account> getAccountsIndustryinApex ( String selectedIndustry){
                
        return [SELECT Id,Name,Type, Industry,AnnualRevenue
                FROM Account
                WHERE Industry=:selectedIndustry
                WITH SECURITY_ENFORCED];
    }

   

}