public with sharing class OpportunityProviderNew {
    @AuraEnabled
    public static list<Opportunity> getOppRecords(Opportunity objOpp){
        try {
            if(objOpp != null){
            return [Select Id, Name, StageName, CreatedDate From opportunity Where StageName =: objOpp.StageName order by CreatedDate desc LIMIT 10];
        }
        else{
            return null;
        }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}