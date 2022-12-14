#include <iostream>

int main(){
	// ArrayInvoke node check
	int array[3]{0,1,2};
	// For3Loop node check
	for(int i = 0; i <= 2; i++) {
		std::cout << array[i] << std::endl;
	}
	
	int m, w;
	w = 2;
	
	for(m = 0; m <= w; ++m)
		std::cout << array[m] << std::endl;
	
	for(;;){
		w++;
		if (w >= 400){
			break;
		} else if (w == 100){
			continue;
		}
	}
	
	return 0;
}