public class AccountProcessor {

    @future
    public static void countContacts(list<id> accountids){
        List<Account> accounts = [Select id, Name From Account Where Id IN:accountids];
        List<Account> listacc = new List<Account>();
        for(Account acc : accounts){
            acc.Number_Of_Contacts__c=[Select Count() from Contact Where AccountId=:acc.Id];
            System.debug('No.Contacts=' + acc.Number_Of_Contacts__c );
            listacc.add(acc);
        }
        update listacc;
    }
}