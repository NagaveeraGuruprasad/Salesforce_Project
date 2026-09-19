public class AccountQueueable implements Queueable{
    Private List<Account> listacc;
   
    Public AccountQueueable(List<Account> listaccExepTri){
        This.listacc=listaccExepTri;
}
    public void execute(QueueableContext qcon){
        //List<Account> listac = new List<Account>();
        for(Account acc : listacc){
            acc.Name=acc.Name + 'Queable';
           // listac.add(acc);
        }
        Update listacc;
    }
}