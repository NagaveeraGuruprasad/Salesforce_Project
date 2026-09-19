trigger TriggerOnCase on Case (before insert, after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        CaseTriggerHandler.updatecaseNotoAcc(Trigger.new);
    }
}