public class RettyCheck{
    
    static int rettyCheck(int x){
        if (x == 0){
            return 13;
        } else if (x == 1) {
            return 256;
        }
        return 0;
    }

     public static void main(String []args){
        System.out.println(rettyCheck(0));
        System.out.println(rettyCheck(1));
        System.out.println(rettyCheck(200));
     }
}