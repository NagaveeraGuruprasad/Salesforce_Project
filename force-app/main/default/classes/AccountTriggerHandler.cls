public class AccountTriggerHandler {
   public static boolean firstRun = true;
    
    public static void AccountTriggerHandlerUpdate(List<Account> listaccRecords, Map<Id,Account> OldMapRecords){
        for(Account accRecords : listaccRecords ){
            if(accRecords.Industry == 'Agriculture' && accRecords.Type =='Prospect'){
                if(OldMapRecords.get(accRecords.id).Ownership != accRecords.Ownership && accRecords.Ownership == 'Private' ){
                    accRecords.addError('do not allow');
                }
            }
        }
    }
    
    /**
    public static void OnUpdateAccActivetoOppsStage(List<Account> listacc, Map<id,Account> OldMapAcc){
        List<Opportunity> oppList=new List<Opportunity>();
        Set<id> accId = new Set<id>();
        for(Account acc : listacc){
            if(acc.Active__c == 'NO' && acc.Active__c!=OldMapAcc.get(acc.Id).Active__c){
                accId.add(acc.Id);
            }
        }
        List <Account> acct =[Select Id, Name, Active__C,(Select Id, Name, StageName From Opportunities) From Account Where Id IN: accId];
        for(Account ac :acct ){
            if(ac.Opportunities!=null){
                for(Opportunity opp:ac.Opportunities){
                    if(opp.StageName!='Closed Won' && opp.StageName!='Closed Lost'){
                        opp.StageName='Closed Lost';
                        oppList.add(opp);
                    }     
                }
            }
        }
        if(oppList.size()>0){
            Update oppList;
        }
    }
    public static void OnUpdateAccPhone(List<Account> listacc, Map<Id,Account> mapacc){
        List<Contact> listCont = new List<Contact> ();
        Map<Id,Account> MapaccPhoneUpdate = new Map<Id,Account>();
        for(Account acc : listacc){
            if((acc.Phone!=Null && acc.Phone!= mapacc.get(acc.Id).Phone) && mapacc!=Null){
                acc.Description ='Phone is updated! Old Values:'+ mapacc.get(acc.Id).Phone+' & New Value:'+acc.Phone;
                MapaccPhoneUpdate.put(acc.Id,acc);
            }
        }
        List<Contact> listCon = [Select Id, Name, HomePhone, AccountId From Contact Where AccountId In:MapaccPhoneUpdate.KeySet()];
        for(Contact con : listCon){
            if(MapaccPhoneUpdate.containsKey(con.AccountId)){
                con.Phone = MapaccPhoneUpdate.get(con.AccountId).Phone;
                listCont.add(con);
            }
        }
        if(!listCont.isEmpty()){
            update listCont;
        }
       
            if(listCont.size()>0){
               update listCont; 
            }
    }
    
    
    public static void OnAccounttoCreateOpportunity(List<Account> listAcc){
        List<Opportunity> listOpp = new List<Opportunity>();
        for(Account acc : listAcc){
            if(acc.Active__c == 'Yes'){
            Opportunity opp = new Opportunity();
            opp.AccountId = acc.Id;
            opp.Name = acc.Name;
            opp.StageName = 'Prospecting';
            opp.CloseDate = System.today();
            listOpp.add(opp);
        }
        }
        if(listOpp!=Null){
            Insert listOpp;
        }
    }
    
    public static void OnAccounttoCreateContact(List<Account> listAcc){
        List<Contact> listCon = new List<Contact>();
        for(Account acc : listAcc){
            Contact con = new Contact();
            con.FirstName = acc.Name + 'FN';
            con.LastName = acc.Name + 'FN';
            con.AccountId = acc.Id;
            listCon.add(con);
        }
        if(listCon!= Null){
            Insert listCon;
    }
    }
    
    public static  void OnAccountBillingAddress(List<Account> listAcc, Map<Id,Account> oldMap){
        for(Account acc : listAcc){
            if((oldMap == Null && acc.Active__c =='True') || (oldMap.get(acc.Id).Active__c !='True' && acc.Active__c !='True'))/*acc.Active__c == 'Yes' && acc.BillingCity!=Null
              && acc.BillingCountry!=Null && acc.BillingState!=Null
               && acc.BillingStreet!=Null && acc.BillingPostalCode!=Null){
                   acc.ShippingCity = acc.BillingCity;
                   acc.ShippingCountry = acc.BillingCountry;
                   acc.ShippingState = acc.BillingState;
                   acc.ShippingStreet = acc.BillingStreet;
                   acc.ShippingPostalCode = acc.BillingPostalCode;
               }
        }
    }
    
    
    public static void onUpdateRating(List<Account> listAcc){
        for(Account acc :listAcc ){
            if(acc.Industry!=null && acc.Industry=='Media'){
                acc.Rating = 'Hot';
            }
        }
     
    } **/
}