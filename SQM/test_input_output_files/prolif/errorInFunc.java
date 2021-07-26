public class errorInFunc
{
  private int multiplier = 140000;
  private int div = 4;
  private int re = 0;

  public errorInFunc(){
    multiplier = multiplier * 2;
    int x = multiplier * div;
    x = x/div;
  }

  public int multiply(int numToMult){
    re = numToMult * multiplier;
    return re;
  }

}
