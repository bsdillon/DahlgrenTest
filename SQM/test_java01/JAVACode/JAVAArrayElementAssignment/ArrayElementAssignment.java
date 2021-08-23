public class ArrayElementAssignment{

     public static void main(String []args){
        int[] intArray = new int[] {1,2,3,4,5};
		int[] otherArray = new int[5];
        int pos = 2;
        intArray[pos] = 9;
        intArray[4] = 25;
        for (int i : intArray){
            System.out.println(i);
        }
     }
}