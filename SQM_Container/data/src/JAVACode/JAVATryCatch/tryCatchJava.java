public class tryCatchJava {
    public static void main(String[] args) {
        try {
            int i;
			throw new ArithmeticException();
        }
        catch (ArithmeticException e) {
        }
        catch (Exception e) {
            System.out.println("Unknown exception caught");
        }
    }
	
	static void checkAge(int age) {
		if (age < 18) {
			throw new ArithmeticException("Access denied - You must be at least 18 years old.");
		}
		else {
			System.out.println("Access granted - You are old enough!");
		}
	}
}