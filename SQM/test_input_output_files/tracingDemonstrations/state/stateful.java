public class Stateful
{
  private boolean nativeState = false;
  private boolean otherState = false;

  public Stateful()
  {
    nativeState = false;
  }

  public void changeState(boolean value)
  {
    if(value!=nativeState)
    {
        nativeState = value;
    }
  }

  public boolean getOtherState()
  {
    return otherState;
  }

  public void setOtherState(boolean value)
  {
    otherState = value;
  }
}
