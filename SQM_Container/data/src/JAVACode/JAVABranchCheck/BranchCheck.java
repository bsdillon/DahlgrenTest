public class BranchCheck{

     public static void main(String []args){
        int x=0;
        int y=0;
        if (x == 0){
            y=1;
        }else if (x==1){
            y = -1;
        }else{
            y=0;
        }

        if (x == 0) y=1;
        else if (x==1) y = -1;
        else y=0;
     }
}