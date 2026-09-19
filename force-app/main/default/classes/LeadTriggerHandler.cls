public class LeadTriggerHandler {
  
    public static void OnBeforeUpdateleadTriggerHandler(List<Lead> listLeadRecords){
        
        for(Lead lere : listLeadRecords){
            if(lere.Status == 'Working - Contacted'){
                lere.addError('Do not allow Lead deletion if the status is Working Contacted');
            }
        }
    }
}