public class TernaryCheck{

     public static void main(String []args){
         int val1 = 10;
         int val2 = 20;
         
         int max = val1 >= val2 ? val1 : val2;
         System.out.println(max);
         
         int input = 0;
         
         int value = input == 0 ? 0 : input > 0 ? 1 : -1;
         System.out.println(value);
     }
}