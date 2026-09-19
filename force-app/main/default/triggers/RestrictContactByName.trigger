trigger RestrictContactByName on Contact (after insert, after delete, after update, after undelete, before insert, before update) {
   
    if(Trigger.isAfter && Trigger.isInsert){
        NumberOfContacts.OnNoOfConAmounttoAcc(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isUndelete){
        NumberOfContacts.ONAccConUndelete(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isInsert){
        NumberOfContacts.AccNoOfContacts(Trigger.new);
        
    }
      
    if(Trigger.isAfter && Trigger.isDelete){
        NumberOfContacts.AccNoOfConDelete(Trigger.old);
    }
    
    if(Trigger.isAfter && Trigger.isUpdate){
        NumberOfContacts.AccNoConChange(Trigger.new);
    }
    
    if(Trigger.isBefore && Trigger.isInsert){
        NumberOfContacts.OnBeforeInsertAccAdressToContact(Trigger.new);
    }
   /* for(Contact c : Trigger.New){
        if(c.LastName == 'INVALIDNAME' ){
            c.AddError('The Last Name "'+c.LastName+'" is not allowed for DML');
        }
}*/
    
}