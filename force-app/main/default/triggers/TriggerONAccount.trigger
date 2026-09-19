trigger TriggerONAccount on Account (before insert, before update, after insert, after update) {
    if(AccountTriggerHandler.firstRun){
        AccountTriggerHandler.firstRun = False;
        //Update new AccountTriggerHandler();
    }
    If(Trigger.isBefore && Trigger.isupdate){
       //  AccountTriggerHandler.OnAccountBillingAddress(Trigger.new, Trigger.oldMap);
       // AccountTriggerHandler.OnUpdateAccPhone(Trigger.new, Trigger.oldMap);
        AccountTriggerHandler.AccountTriggerHandlerUpdate(Trigger.new, Trigger.oldMap);
    } /**
    else if(Trigger.isBefore && Trigger.isInsert){
        AccountTriggerHandler.onUpdateRating(Trigger.new);
        Id JobId = System.enqueueJob(New AccountQueueable(Trigger.new));
       
    }
   else if(Trigger.isAfter && Trigger.isInsert){
     AccountTriggerHandler.OnAccounttoCreateContact(Trigger.new);
     AccountTriggerHandler.OnAccounttoCreateOpportunity(Trigger.new);   
    }
   else if(Trigger.isBefore && Trigger.isUpdate){
        AccountTriggerHandler.OnUpdateAccPhone(Trigger.new, Trigger.oldMap);
    }
    else if(Trigger.isAfter && Trigger.isUpdate){
        AccountTriggerHandler.OnUpdateAccActivetoOppsStage(Trigger.new, Trigger.oldMap);
    } **/
}