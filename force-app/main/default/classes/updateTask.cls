public class updateTask {

    public static void updateTaskHigh(List<Task> listask){
     List<Task> listtask = new List<Task>();   
        for(Task tas : listask){
            tas.Priority='High';
            listtask.add(tas);
        }
      //  update listtask;
    }
    public static void updateTaskStatus(List<Task> listask){
        List<Task> listtsk = new List<Task>();
        for(Task tak : listask){
            tak.Status='In Progress';
            listtsk.add(tak);
        }
    }
}