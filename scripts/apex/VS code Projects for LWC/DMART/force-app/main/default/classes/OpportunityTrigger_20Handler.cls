public class OpportunityTrigger_20Handler {
    
    public static void beforeInsert(List<Opportunity> oppList){
        OpportunityTrigger_20Helper.preventDupOpportunity(oppList);
    }
    
    public static void beforeUpdate(List<Opportunity> oppList){
         OpportunityTrigger_20Helper.preventDupOpportunity(oppList);
    }
    
    public static void afterUndelete(List<Opportunity> oppList){
         OpportunityTrigger_20Helper.preventDupOpportunity(oppList);
    }

}