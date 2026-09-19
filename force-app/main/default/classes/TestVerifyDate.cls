@isTest
public class TestVerifyDate {


     static testmethod void testmethod1(){
        Date d = VerifyDate.CheckDates(System.today(), System.today()+1);
        Date d1 = VerifyDate.CheckDates(System.today(), System.today()+60); 
}
}