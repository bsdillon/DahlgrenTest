#include <string>
#include <iostream>

int main(){
	
	int day = 5;
	std::string dayString;
	
	
	switch (day){
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
	
	int digit = 0;
	bool isZero;
	
	switch (digit){
		case 0:
			isZero = true;
			break;
		case 1:
			// fallthrough testing
			std::cout << "It's 1!" << std::endl;
		case 2:
		case 3:
		case 4:
		case 5:
		{
			std::cout << "It's 5 or less!" << std::endl;
		}
		case 6:
		case 7:
		case 8:
		case 9:
			switch (day)
			{
				case 6:
				case 7:
					dayString = "Weekend!!!";
					break;
				default:
					dayString = "Weekday...";
					break;
			}
			std::cout << "It's 9 or less!" << std::endl;
			isZero = false;
			break;
		default:
			// not a digit
			isZero = false;
			break;
	}
	
	int testy = 1;
	int count = 0;
	
	switch (testy){
		case 1: count += testy;
		case 2: count += testy;
	}
/**	
	// the statement doesn't have to be a compound statement
    switch(0)
        std::cout << "this does nothing\n";
**/ 
    // labels don't require a compound statement either
    switch(int n = 1)
        case 0:
        case 1: std::cout << n << '\n';

	return 0;
}