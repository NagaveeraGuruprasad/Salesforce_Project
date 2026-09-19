public class AddPrimaryContact Implements Queueable {

    Private Contact con;
    Private String state; 
        
    public AddPrimaryContact(Contact con, String state){
        this.con=con;
        this.state=state;
        
    }
    public void execute(QueueableContext context ){
        List<Account> listacc = [Select Id,Name,(Select Id, FirstName,LastName from Contacts)
                                 from Account where BillingState =: state limit 200 ];
        
        List<Contact> listcon = new List<Contact>();
        for(Account acc : listacc){
            contact con = new Contact();
            con.AccountId=acc.Id;
            listcon.add(con);
        }
        if(listcon.size() > 0){
            insert listcon;
        }
    }
}