public class RandomContactFactory {

    public Static List<Contact> generateRandomContacts(Integer num, String LastName){
        list<Contact> listcon = new list<Contact>();
        for(Integer i=0; i<num; i++){
            Contact con = new Contact(FirstName ='Test'+i, LastName ='Test1');
            listcon.add(con);
        }
        return listcon;
    }
}