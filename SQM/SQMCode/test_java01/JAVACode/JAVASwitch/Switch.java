// Java program to demonstrate switch case
// with primitive(int) data type
public class Test {
    public static void main(String[] args)
    {
        int day = 5;
        String dayString;
  
        // switch statement with int data type
        switch (day) {
        case 1:
            dayString = "Monday";
            break;
        case 2:
            dayString = "Tuesday";
            break;
        case 3:
            dayString = "Wednesday";
            break;
        case 4:
            dayString = "Thursday";
            break;
        case 5:
            dayString = "Friday";
            break;
        case 6:
            dayString = "Saturday";
            break;
        case 7:
            dayString = "Sunday";
            break;
        default:
            dayString = "Invalid day";
        }
        System.out.println(dayString);
		
		char ch = 'O';
		String chString = "";
		
		switch (ch) {
		case 'a':
		case 'e':
		case 'i':
		case 'o':
		case 'u':
			chString = "Lowercase";
		case 'A':
		case 'E':
		case 'I':
		case 'O':
		case 'U':
			chString += "Vowel";
			break;
		default:
			chString = "Consonant";
			break;
		}
		System.out.println(chString);
    }
}