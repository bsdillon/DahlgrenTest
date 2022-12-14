#include <vector>
#include <iostream>

int main() {
	// ArrayInvoke node check
	int array[3]{0,1,2};
	
	// ForEachLoop
	
	for (int p : array) {
		std::cout << p << std::endl;
	}
	
	std::vector<std::string> stringVec = {"yes","no","maybe","sometimes","often","perhaps"};
	
	for (std::string q : stringVec){
		std::cout << q << std::endl;
	}
	
	int strCount = 0;
	
	for (std::string r : stringVec){
		strCount+=1;
	}
	
	std::cout << strCount << std::endl;
	
	for (std::string s : stringVec){
		for (std::string t : stringVec){
			std::cout << s << ", well, " << t << std::endl;
		}
	}
	
	return 0;
}