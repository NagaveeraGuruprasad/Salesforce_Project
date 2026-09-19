public class OpportunityTriggerHandler {
    
    public static void OnAfterUpdateOpportunityTeam(List<Opportunity> listNewRecords, Map<Id,Opportunity> OldMapRec){
       List<User> OppUser = [Select Id, Name, UserRole.Name From User Where isActive = True AND UserRole.Name = 'Opportunity Team'];
        System.debug('OppUser' +OppUser);
        List<OpportunityTeamMember> ListOppsTeam = new List<OpportunityTeamMember>();
        for(Opportunity Opp :listNewRecords ){
            if(Opp.StageName == 'Needs Analysis' && Opp.StageName != OldMapRec.get(Opp.id).StageName){
                for(User Us : OppUser){
                OpportunityTeamMember OppTeam = new OpportunityTeamMember();
                OppTeam.OpportunityId = Opp.Id;
                OppTeam.OpportunityAccessLevel= 'Edit';
                OppTeam.UserId = Us.Id;
                ListOppsTeam.add(OppTeam);     
                }
            }
        } 
        if(!ListOppsTeam.isEmpty()){
            insert ListOppsTeam;
        }
    }
    public static void OnAfterDeleteOpportunityTriggerHandler(List<Opportunity>listOppsRec, Map<Id,Opportunity>oldOppsRec){
        Set<Id> AccId = new Set<Id>();
        for(Opportunity Opps : listOppsRec){
            if(Opps.AccountId != Null){
                AccId.add(Opps.AccountId);
            }
        }
        Map<Id,Account> mapOfAcc = new Map<Id,Account>([Select Id, Name, OwnerId From Account Where Id In: AccId]);
        List<Task> listTaskRec = new List<Task>();
        for(Opportunity Opp : listOppsRec){
            Task taskRec = new Task();
            taskRec.OwnerId = mapOfAcc.get(Opp.AccountId).OwnerId;
            taskRec.Description ='Task Created Successfully';
            taskRec.Subject = 'Please find out the reason of deletetion of opportunity ';
            taskRec.Status = 'High';
            listTaskRec.add(taskRec);
        }
        if(!listTaskRec.isEmpty()){
            insert listTaskRec;
        }
    }
    
    public static void OnOppStageChangeCreateTask(List<Opportunity> Opplist, Map<id,Opportunity> OldMapOpp){
        List<Task> listTas = new List<Task>();
        for(Opportunity opp : Opplist ){
            if(opp.StageName!= OldMapOpp.get(opp.id).StageName){
                Task tas = new Task();
                tas.WhatId=opp.Id;
                tas.Subject='Email';
                tas.Status='Not Started';
                tas.Priority='Normal';
                tas.OwnerId=Userinfo.getUserId();
                listTas.add(tas);  
            }
        }
        if(listTas.size()>0){
            Insert listTas;	
        }
    }
    public static void OnOppStageChanges(List<Opportunity> listOpp, Map<Id,Opportunity> OldMapOpp){
        
       //If an Opportunity is Closed Won, send an email to opportunity owner, account owner, team members Opportunity Public Group
       
        Set<Id> setOfSendEmailToOwners = new Set<Id>();
        Set<Id> setOfAccountId = new Set<Id>();
        Set<Id> setOfOppsTeamMembers = new Set<Id>();
        list<Id> setOfGroupMembers = new list<Id>();
        
        if(setOfAccountId != null && !setOfAccountId.isEmpty()){
            List<Account> listacc = [Select id, Name, OwnerId From Account Where Id In: setOfAccountId];
            
            if(!listacc.isEmpty() && listacc != null){
                for(Account acc : listacc){
                    If(acc.OwnerId != null){
                        setOfSendEmailToOwners.add(acc.OwnerId);
                    }
                }
            }   
        }
        
        if(setOfOppsTeamMembers != null && !setOfOppsTeamMembers.isEmpty()){
            List<OpportunityTeamMember> listOppTeam = [Select Id, Name, TeamMemberRole, UserId From OpportunityTeamMember Where OpportunityId IN : setOfOppsTeamMembers];
            if(!listOppTeam.isEmpty()){   
                for(OpportunityTeamMember OppTeam : listOppTeam){
                    if(OppTeam.UserId != null ){
                        setOfSendEmailToOwners.add(OppTeam.UserId);
                    }
                }
            }
        }
        
        List<GroupMember> listGroup = [Select Id, UserorGroupId From GroupMember WHERE GroupId IN (SELECT Id FROM Group WHERE Name = 'Opportunity Public Group') ];
            
        if(!listGroup.isEmpty() && listGroup != null){
            for(GroupMember groupmem : listGroup){
                if(groupmem.UserOrGroupId != null){
                   setOfGroupMembers.add(groupmem.UserOrGroupId); 
                }
            }
        } 
 
        for(Opportunity Opp : listOpp){
            if(Opp.StageName == 'Closed Won' && Opp.StageName != OldMapOpp.get(Opp.Id).StageName){
                setOfSendEmailToOwners.add(Opp.OwnerId);
                if(Opp.AccountId != null){
                    setOfAccountId.add(Opp.AccountId);
                }
                setOfOppsTeamMembers.add(Opp.Id);
                setOfSendEmailToOwners.addAll(setOfGroupMembers);
            }
        }
        
        if(!setOfSendEmailToOwners.isEmpty()){
           sendEmailtoOwners(setOfSendEmailToOwners);
        }
    }
        public static void sendEmailtoOwners(Set<Id> setOfuserIds){
            List<String> setofUserEmail = new List<String>();
            List<User> listuser = [Select Id, Name, Email from User Where Id In :setOfuserIds];
             List<Messaging.SingleEmailMessage> emailLists = new List<Messaging.SingleEmailMessage>();
            
            if(!listuser.isEmpty()){
                for(User us : listuser){
                    if(us.Email != null){
                    setofUserEmail.add(us.Email);
                    }
            if(!setofUserEmail.isEmpty()){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
               // mail.toAddresses = setofUserEmail;
                mail.setToAddresses(setofUserEmail);
                mail.setSubject('Take a look the Opportunity');
                mail.setPlainTextBody('This is High priority');
               
                emailLists.add(mail);
            }
                }
                
                if(!emailLists.isEmpty()){
                    Messaging.sendEmail(emailLists);
                    System.debug('emailLists===' +emailLists);
                }
            }
        }
    
        
        /* for(Opportunity opp : listOpp){
            if((OldMapOpp == Null) || (opp.StageName!= OldMapOpp.get(opp.Id).StageName )){
                if(opp.StageName =='Closed Won'){
                    opp.Description='Opportunity is Closed won';
                }else if(opp.StageName == 'Closed Lost'){
                    opp.Description='Opportunity is Closed Lost';
                }else{
                    opp.Description ='Opportunity is open';
                }
            }
        }*/
        
    public static void OnOppAmountOfAccount(List<Opportunity> listOpp){
      List<Account> listAcc = new List<Account>();
      Set<Id> setOfAccId = new Set<Id>(); 
      Map<Id, Decimal> mapOfAccToAmount = new Map<Id, Decimal>();
        for(Opportunity opp : listOpp){
            if(opp.AccountId != null){
                setOfAccId.add(opp.AccountId);
            }
        }
        if(setOfAccId != null && !setOfAccId.isEmpty()){
             listAcc = new List<Account>([Select Id, Name,Opportunity_Of_Amount__c From Account Where Id IN : setOfAccId]);
        }
       
        if(listAcc != null && !listAcc.isEmpty()){
            for(Opportunity opp : [select Id, Name, Amount,AccountId From Opportunity Where AccountId IN :setOfAccId AND Amount !=null ]){
                opp.StageName = 'Prospecting';
                opp.CloseDate = System.today();
                mapOfAccToAmount.put(opp.AccountId, (mapOfAccToAmount.containsKey(opp.AccountId) ? mapOfAccToAmount.get(opp.AccountId) : 0) + opp.Amount);
            }
        }
        
        if(listAcc != null && !listAcc.isEmpty() && !mapOfAccToAmount.isEmpty()){
            for(Account acc : listAcc){
                acc.Opportunity_Of_Amount__c = mapOfAccToAmount.containsKey(acc.Id) ? mapOfAccToAmount.get(acc.Id) : 0;
            }
            Update listAcc;
        }
        
        
        
        /*  Set<Id> accId = new Set<Id>();
        for(Opportunity opp :listOpp ){
            accId.add(Opp.AccountId);
        }
        List<Account> listacc = [Select id,Name,Opportunity_Of_Amount__c,(Select Id,Name, Amount From Opportunities)From Account where ID IN : accId];
        for(Account acc : listacc){
            acc.Opportunity_Of_Amount__c =0;
            for(Opportunity opp : acc.Opportunities){
                if(opp.Amount!= Null){
                    opp.StageName ='Prospecting';
                    opp.CloseDate = System.today();
                    //opp.Amount += acc.Opportunity_Of_Amount__c;
                    acc.Opportunity_Of_Amount__c += opp.Amount;
                }
            }   
        }
        
        update listacc;  */
    
    }
    public static void OnOppAmount(List<Opportunity> listOpp){
        for(Opportunity opp : listOpp){
            if(opp.Amount!=Null && opp.Amount>100000 ){
                opp.Description='Hot Opportunity';
            }
        }
    }
}