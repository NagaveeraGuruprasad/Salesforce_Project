trigger TriggerOnOpportunity on Opportunity (before insert, after insert, before update, after update, after delete) {
    if(Trigger.isBefore &&Trigger.isInsert){
        OpportunityTriggerHandler.OnOppAmount(Trigger.new);
    }
    
    if(Trigger.isAfter && Trigger.isInsert){
        OpportunityTriggerHandler.OnOppAmountOfAccount(Trigger.new);
    }
    
    if(Trigger.isBefore && Trigger.isUpdate){
        //OpportunityTriggerHandler.OnOppStageChanges(Trigger.new, Trigger.oldMap);
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        OpportunityTriggerHandler.OnOppStageChangeCreateTask(Trigger.new, Trigger.oldMap);
        OpportunityTriggerHandler.OnAfterUpdateOpportunityTeam(Trigger.new, Trigger.oldMap);
        OpportunityTriggerHandler.OnOppStageChanges(Trigger.new, Trigger.oldMap);
    }
    
    if(Trigger.isAfter && Trigger.isDelete){
        OpportunityTriggerHandler.OnAfterDeleteOpportunityTriggerHandler(Trigger.old, Trigger.oldMap);
    }
}