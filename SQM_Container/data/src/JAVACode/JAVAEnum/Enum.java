enum Level {
  LOW,
  MEDIUM,
  HIGH
}

enum NumericLevel {
	LOW (0),
	MEDIUM (1),
	HIGH (2)
	;
	
	private final int powerLevel;
	
	private NumericLevel(int powerLevel){
		this.powerLevel = powerLevel;
	}
}

public class Enum {
  public static void main(String[] args) {
    Level myVar = Level.MEDIUM;

    switch(myVar) {
      case LOW:
        System.out.println("Low level");
        break;
      case MEDIUM:
         System.out.println("Medium level");
        break;
      case HIGH:
        System.out.println("High level");
        break;
    }
  }
}
