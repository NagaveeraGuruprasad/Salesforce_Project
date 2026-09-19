public with sharing class ApexUseCase {

    /*Write a method that accepts an account name and a contact name and checks if a parent child combo exists for the same or not.
       If it does, it returns a boolean value of true. */

    public static Boolean checkIfCombinationExist(String accountName, String contactName){

        List<Contact> listContacts = [SELECT Id, Name From Contact Where Name = :contactName AND Account.Name = : accountName];
          if(listContacts.size() > 0){
                return true;
          }
              return false;
    }
    public static List<String> getAccountOfContactEmailIds(String accountName){
          List<String> emailList = new List<String>();
        List<Contact> listContRec = [Select Id, Name, Email From Contact Where Account.Name =:accountName];
        if(listContRec.size()>0){
            for(Contact con : listContRec){
                if(con.Email != null){
                emailList.add(con.Email);
            }
        }
        }
        return emailList;
    }
}