@istest
public class AccountProcessorTest {

    @isTest
    public static void TestNoContacts(){
        
        Account acc = new Account ();
        acc.Name='TestAccount';
        acc.AccountNumber='1';
        insert acc;
            
       Contact con = new Contact ();
        con.FirstName='TestCon';
        con.LastName='Contact1';
        con.AccountId =acc.Id;
       
       Contact con1 = new Contact ();
        con1.FirstName='TestCon2';
        con1.LastName='Contact2';
        con1.AccountId=acc.Id;
        
        List<id> accid = new List<id> ();
            accid.add(acc.Id);
        Test.startTest();
        AccountProcessor.countContacts(accid);
        Test.stopTest();
    }
}