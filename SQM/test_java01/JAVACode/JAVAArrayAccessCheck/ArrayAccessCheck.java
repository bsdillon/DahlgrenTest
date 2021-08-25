import java.util.*;
class Point{
	
	private int x = 0, y = 0;
	
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
	public void setX(int x){
		this.x = x;
	}
	public void setY(int y){
		this.y = y;
	}
	public void setXY(int x, int y){
		this.x = x;
		this.y = y;
	}
}

public class ArrayAccessCheck{

     public static void main(String[] args){
		Point newPoint = new Point(10, 24);
        Point pointArray[] = {new Point(1,2), new Point(3,4), new Point(45,56), newPoint};
		Point mPointArray[][] = {{new Point(1,2), new Point(3,4)}, {new Point(45,46), newPoint}};
        int pos = 2;
        int output = pointArray[pos].getX();
		pointArray[0].setY(20);
		pointArray[1].setXY(4, 20);
        output = pointArray[3].getY();
		mPointArray[0][0].setX(0);
		mPointArray[mPointArray[0][0].getX()][mPointArray[0][0].getX()].setY(0);
        System.out.println(output);
     }
}