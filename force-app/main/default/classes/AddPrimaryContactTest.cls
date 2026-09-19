@isTest
public class AddPrimaryContactTest {


    public static testmethod void testQueueable(){
        List<Account> listacc = new List<Account>();
        for(Integer i=0; i<50; i++ ){
           listacc.add(new Account (Name='TestAccount'+ i, BillingState='CA'));
        }
        for(Integer j=0; j<50; J++){
              listacc.add(new Account(Name='TestAccount1' + j,BillingState='NY'));
        }
        insert listacc;
        
        Contact con = new Contact ();
        con.FirstName='TestCon';
        con.LastName='Contact';
        insert con;
        
        AddPrimaryContact addprim = new AddPrimaryContact(con,'CA');
        Test.startTest();
        System.enqueueJob(addprim);
        Test.stopTest();
        System.assertEquals(50, [Select Count() from Contact Where accountId in (Select Id from Account Where BillingState ='CA')]);
    }
}