trigger TaskTrigger on Task (before insert,before update) {

    if(Trigger.isBefore && Trigger.isInsert){
        updateTask.updateTaskHigh(Trigger.new);
    }
    if(Trigger.isBefore &&Trigger.isUpdate){
        updateTask.updateTaskStatus(Trigger.new);
    }
    
}