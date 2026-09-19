@isTest
public class TestRestrictContactByName {

    static testmethod void testmethod1(){
        Contact con = new Contact();
        con.FirstName = 'Test';
        con.LastName = 'Invalid';
        Test.startTest();
        insert con;
        Test.stopTest();
    }
}