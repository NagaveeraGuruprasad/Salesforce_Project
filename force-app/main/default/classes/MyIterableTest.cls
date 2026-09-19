@IsTest
public class MyIterableTest {
@IsTest
    Static void testIterableForLoop(){
        List<String> strings = new List<String>{'Hello','World'};
        MyIterable iterable = new MyIterable(strings);
        for(String str : iterable){
            System.debug(str);
        }
    }
}