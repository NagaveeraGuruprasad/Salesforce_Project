@isTest
public class LeadProcessorTest {

    @isTest
    public static void testsetup(){
        List<lead> led = new List<lead> ();
        for(integer counter=0; counter<200; counter++){
            lead le = new lead ();
            le.FirstName='testlead';
            le.LastName='lead1'+counter;
            le.Company='demo'+counter;
            led.add(le);      
        }
        insert led;

        Test.startTest();
        LeadProcessor leadpro = new LeadProcessor();
        Id batchId = Database.executeBatch(leadpro);
        Test.stopTest();
    }
}