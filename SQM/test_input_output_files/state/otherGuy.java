public class OtherGuy
{
  private Stateful state = new Stateful();

  public OtherGuy()
  {
    state.setOtherState(true);
  }

  public void UselessLoop()
  {
    while(true)
    {
      if(state.getOtherState())
      {
        state.setOtherState(!state.getOtherState());
        System.out.printl("I did it");
      }
      else
      {
        state.setOtherState(state.getOtherState());
        System.out.println("No I didn't");
      }
    }
  }
}
