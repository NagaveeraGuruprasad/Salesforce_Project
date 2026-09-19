public class CaseTriggerHandler {
     
    public static void updatecaseNotoAcc(List<Case> listcas){
        List<Account> listacc = new List<Account>();
        for(Case ca : listcas){
            if(ca.AccountId!=Null ){
                Account acc = new Account();
                acc.Id = ca.AccountId;
                acc.Latest_Case_Number__c = ca.CaseNumber;
                listacc.add(acc);
            }
        }
        if(listacc!=Null){
            Update listacc;
        }
    }
}