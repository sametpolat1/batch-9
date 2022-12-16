public with sharing class OpportunityController {
@AuraEnabled(Cacheable = true)
public static List<Opportunity> getOppsByStage(String stageNameInput) {
    return [SELECT Id, Name, Type, Amount, StageName, Account.Name
            FROM Opportunity
            WHERE StageName=: stageNameInput
            WITH SECURITY_ENFORCED];
    }


//Get Opportunities whose Type name matches with Salesforce Opportunity data

    @AuraEnabled
public static List<Opportunity> getOppsByType(String typeNameInput) {
    return [SELECT Id, Name, Type, Amount, StageName, Account.Name
            FROM Opportunity
            WHERE type=: typeNameInput
            WITH SECURITY_ENFORCED];
    }
 
}
