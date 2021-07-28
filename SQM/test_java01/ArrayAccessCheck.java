import java.util.*;

class Point{
    private int x = 0;
    private int y = 0;
    public Point(int a, int b){
        x = a;
        y = b;
    }
    public int getX(){
        return x;
    }
    public int getY(){
        return y;
    }
}

public class ArrayAccessCheck{

     public static void main(String []args){
         
        Point[] pointArray = new Point[] {new Point(1,2), new Point(3,4), new Point(45,56)};
        
        int pos = 2;
        
        int output = pointArray[pos].getX();
        
        System.out.println(output);
     }
}
