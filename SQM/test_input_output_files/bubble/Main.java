public class Main
{
  public static void main(String[] args) {
    int[] list = {1, 2, 3, 4, 1, 2, 3};
    bubblesort(list); //--
  }

  public static void bubblesort(int[] list /*implicated*/) //--
  {
    //int temp = list[0]; //impl
    //boolean changed = true; //impl //this line causes hanging too??
    isAscending(list); //--
  }

  public static boolean isAscending( int[] list /*impl*/ ) //--
  {
    boolean ascending = true; //impl --
  	int index = 1;
    while( ascending && index < list.length ) //impl //--
    {
      assert index >= 0 && index < list.length;

      //the line below causes antlr to hang sometimes vv
      //ascending = (list[index - 1] <= list[index]);
      //why does the line above cause antlr to hang? ^^

      index++;
    }
  	return ascending; //impl --
  }
}
