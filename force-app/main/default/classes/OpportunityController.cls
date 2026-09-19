public with sharing class OpportunityController {
   
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunityList() {
        return [SELECT Id, Name, StageName, CloseDate, Amount FROM Opportunity LIMIT 10];
    }

}