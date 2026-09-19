public class BatchOnAccount implements database.Batchable<Sobject>{

    public database.QueryLocator start(database.BatchableContext bc){
        String Query = 'Select id, Name From Account';
        return database.getQueryLocator(Query);
    }
    
    public void execute(database.BatchableContext bc, List<Account> listacc){
        for(Account acc : listacc ){
            acc.name = acc.name + '- SalesforceBatch';
        }
        try{
            update listacc;
        }catch(Exception e ){
            System.debug(e);
        }
    }
    
    public void finish(database.BatchableContext bc){
        System.debug('@@ batch job completed');
    }
}