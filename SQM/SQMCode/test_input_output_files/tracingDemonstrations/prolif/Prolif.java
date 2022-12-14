public class Prolif
{
  private int dontMessUp = 0;
  private int y = 1;
  private errorInFunc messy = new errorInFunc();

  public Prolif() {
    dontMessUp = 9;
  }

  public void tryNotToMessUp(){
    dontMessUp = messy.multiply(dontMessUp);
    getdontMessUp();
    System.out.println("line 13");
    dontMessUp = messy.multiply(8);
  }

  public int getdontMessUp(){
    dontMessUp = dontMessUp * y;
    return dontMessUp;
  }

}
