public with sharing class OpportunityControllerForAssignment {
    @AuraEnabled(Cacheable = true)
    public static List<Opportunity> getOppsAmountTop10() {
        return [SELECT Id,Name,Type, StageName, Amount 
                FROM Opportunity 
                WHERE Amount != null 
                WITH SECURITY_ENFORCED
                ORDER BY Amount 
                DESC
                LIMIT 10

                ];
        }
    }
    