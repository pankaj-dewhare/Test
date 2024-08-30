public with sharing class OpportunityProvider {
    @AuraEnabled
    public static list<Opportunity> opportunityRecordShowInTebleMethod(date frmDate, date tooDate, decimal minimumAmt, decimal maximumAmt, string Stage){
        try {


    
            return [Select Id, Name, CloseDate, StageName, Amount, CreatedDate From Opportunity Where CreatedDate >=: frmDate and CreatedDate <=: tooDate and Amount <=: minimumAmt and Amount >=: maximumAmt and StageName =: Stage];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}