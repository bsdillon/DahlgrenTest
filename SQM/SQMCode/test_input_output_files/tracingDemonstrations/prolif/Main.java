public class Main
{
  public static void main(String[] args) {
    Prolif pls = new Prolif();
    System.out.println("Start: " + pls.getdontMessUp());
    pls.tryNotToMessUp();
    int x = pls.getdontMessUp();
    System.out.println("After Mess Up: " + x);
    x = x + 1;
  }

  public void extraMain(Prolif p){
    p.tryNotToMessUp();
  }

  public int doMath(int x){
    return x;
  }

}
