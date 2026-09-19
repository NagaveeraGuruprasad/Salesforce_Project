public with sharing class AccountDetailsGenerate {
    
    @AuraEnabled
    
    Public static List<Account> getAccountdetails(Id acctId){
        
        List<Account> listacc =[Select Id, Name, Type, Rating From Account where Id=:acctId];
            
            return listacc;
    }	

}