import java.util.*;

public class ForEach{

     public static void main(String []args){
         String[] stringArray = {"yes","no","maybe"};
         for (String q : stringArray){
             System.out.println(q);
         }
		 
		 List<String> stringList = new ArrayList<String>(Arrays.asList("up","down","left","right"));
		 for (String q : stringList){
             System.out.println(q);
         }
     }
}