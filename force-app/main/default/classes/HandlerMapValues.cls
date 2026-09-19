public class HandlerMapValues {
@AuraEnabled     // Method must be AuraEnabled in apex
    public static map<String,String> getmymap(){
        map<String,String> putkeyValues = new map<String,String>();
        putkeyValues.put('key1','Value1');
        putkeyValues.put('key2','Value2');
        putkeyValues.put('key3','Value3');
        
        return putkeyValues;
        
    }
}