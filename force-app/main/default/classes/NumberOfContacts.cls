public class NumberOfContacts {
     
    public static void OnBeforeInsertAccAdressToContact(List<Contact> listRecords){
        Set<Id> AccId = new Set<Id>();
        for(Contact cont : listRecords){
            AccId.add(cont.AccountId);
        }
        Map<Id, Account> AccMapRec = new Map<Id, Account>([Select Id, Name, BillingStreet,BillingCity,BillingState,BillingPostalCode,
                                                            BillingCountry From Account Where Id IN :AccId ]);
        for(Contact con : listRecords){
            if(AccMapRec.containsKey(con.AccountId)){
                con.MailingStreet = AccMapRec.get(con.AccountId).BillingStreet;
                con.MailingCity = AccMapRec.get(con.AccountId).BillingCity;
                con.MailingState = AccMapRec.get(con.AccountId).BillingState;
                con.MailingPostalCode = AccMapRec.get(con.AccountId).BillingPostalCode;
                con.MailingCountry = AccMapRec.get(con.AccountId).BillingCountry;
            }
        }
    }
    
   /* public static void OnNoOfConAmounttoAcc(List<Contact> ListCont){
        Set<Id> AccId = new Set<Id>();
        for(Contact con : ListCont){
            AccId.add(con.AccountId);
            System.debug('AccId' + AccId);
        }
        List<Account> listAcc = [Select Id, Name, No_Of_Contacts__c,Sum_Of_Account_Contacts__c,(Select Id, Name,Amount__c From Contacts) From Account Where ID IN :AccId];
        for(Account acc :listAcc){
            acc.Sum_Of_Account_Contacts__c = 0;
            for(Contact con : acc.Contacts){
                if(con.Amount__c != Null){
                acc.Sum_Of_Account_Contacts__c += con.Amount__c;
            }    
        }
        }
        Update listAcc;
    }
    
    public static void ONAccConUndelete(list<Contact> listcont){
        Set<id> accid = new Set<id>();
        for(Contact con :listcont){
            accid.add(con.AccountId);
        }
        List<Account> listOFAccCon =[Select Id, Name, No_Of_Contacts__c,(Select Id, Name From Contacts) From Account Where Id IN :accid ];
        for(Account acc :listOFAccCon){
            acc.No_Of_Contacts__c =acc.Contacts.size();
        }
        Update listOFAccCon;
    }
    public static  void AccNoOfContacts(list<Contact> listcon){
        
        Set<id> AccId = new Set<id>();
        for(Contact con : listcon ){
            AccId.add(con.AccountId);
        }
        List<Account> AccOfRelatedCon =[Select Id, Name, No_Of_Contacts__c,	Sum_Of_Account_Contacts__c, (Select Id, Name,Amount__c From Contacts) From Account Where ID IN :AccId];
        System.debug('AccOfRelatedCon' +AccOfRelatedCon);
    For(Account Acc: AccOfRelatedCon){
        Acc.No_Of_Contacts__c = Acc.Contacts.Size();
    }
        Update AccOfRelatedCon;
    }
    
    public static void AccNoOfConDelete(List<Contact> listConDel){
      Set<id> AccId = new Set<id>();
        for(Contact con:listConDel){
            accId.add(con.AccountId);
        }
        
        List<Account> AccOfReltedConDel =[Select Id, Name, No_Of_Contacts__c, (Select Id, Name From Contacts) From Account Where Id IN : AccId];
        For(Account acc : AccOfReltedConDel){
            acc.No_Of_Contacts__c = acc.Contacts.size();
        }
     Update AccOfReltedConDel;
    }
    
   Public static void AccNoConChange(List<Contact> listconChange){
        Set<Id> accId = new Set<Id>();
        for(Contact con : listconChange){
            accId.add(con.AccountId);
            Contact oldValueCon = (Contact)Trigger.oldMap.get(con.Id);
           // Contact cont = new Contact();
          //  Contact = Trigger.oldMap.get(Contact.Id);
            accId.add(con.AccountId);
        }
        List<Account> accOfConChangetoOtherAcc = [Select Id, Name, No_Of_Contacts__c,(Select Id,Name From Contacts) From Account Where ID IN :accId ];
        for(Account acc: accOfConChangetoOtherAcc){
            acc.No_Of_Contacts__c = acc.Contacts.size();
        }    
       // Update accOfConChangetoOtherAcc;
    } */
}