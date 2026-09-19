trigger LeadTrigger on Lead (before delete) {
   
    if(Trigger.isBefore && Trigger.isDelete){
        LeadTriggerHandler.OnBeforeUpdateleadTriggerHandler(Trigger.old);
    }
}