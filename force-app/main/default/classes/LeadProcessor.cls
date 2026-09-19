global class LeadProcessor implements  Database.Batchable <sObject>{

    global integer count =0;
    public database.QueryLocator Start(Database.BatchableContext bc ){
        
        return database.getQueryLocator([Select Id, LeadSource from Lead]);
    }   
    
    global void execute(Database.BatchableContext bc,List<lead> leads ){
     List<lead> listlead = new List<lead>();
        for(Lead le : leads){
            le.LeadSource = 'Dreamforce';
            listlead.add(le);
            count +=1;
        }
        update listlead;
    }
    global void finish(Database.BatchableContext bc ){
        System.debug('Count='+Count);
    }
}