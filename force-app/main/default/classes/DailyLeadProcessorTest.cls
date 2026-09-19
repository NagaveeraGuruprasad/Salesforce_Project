@isTest
public class DailyLeadProcessorTest {

    public static string CRON_EXP='0 0 1 * * ?';
    
    Static testmethod void testscedulejob(){
        List<lead> listle = new List<Lead>();
        for(Integer i=0; i<200; i++){
            lead le = new lead(FirstName ='testlead' +i, 
                               LastName ='testlastname',
                               Company ='the INC');
            listle.add(le);
        }
        insert listle;
        
       Test.startTest();
        String jobId = System.schedule('ScheduledApesTest', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();	
        
        List<lead> cheklistle = new List<lead>();
        cheklistle=[Select Id, Name From Lead Where LeadSource='Dreamforce' and Company='The INC'];
        System.assertEquals(200, cheklistle.size(),' leads were not created');
    } 
}