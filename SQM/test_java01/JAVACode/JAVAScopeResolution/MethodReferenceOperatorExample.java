import java.util.stream.*;   
public class MethodReferenceOperatorExample   
{   
public static void main(String[] args)   
{   
//invoking the of() method of the Stream class that returns a sequential ordered stream  
Stream<String> st = Stream.of("San Jose", "Las Vegas", "Austin", "New York", "Denver", "Portland");   
//using method reference operator to print the stream  
st.forEach(System.out::println);   
}   
}