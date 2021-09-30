public class Main
{
  public static void main(String[] args) {
    int[] list = {1, 2, 3, 4, 1, 2, 3};
    bubblesort(list);
  }

  public static void bubblesort(int[] list)
  {
    //int temp = list[0];
    //boolean changed = true;
    isAscending(list);
  }

  public static boolean isAscending( int[] list )
  {
    boolean ascending = true;
  	int index = 1;
    while( ascending && index < list.length )
    {
      assert index >= 0 && index < list.length;





      index++;
    }
  	return ascending;
  }
}
