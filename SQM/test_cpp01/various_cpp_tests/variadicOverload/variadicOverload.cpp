#include <iostream>
#include <cstdarg>
int function(){
	return 0;
}

int function(int x){
	return 1;
}

//int function(int x, int y){
//	return 2;
//}

int function(int x, int y ... ){
	int z = x + y;
	std::va_list args;
	va_start(args, y);
	while (int v = va_arg(args, int)){
		z += v;
	}
	va_end(args);
	return 3;
}
int main(){
	while (int x = 0)
	{
		
	}
	int y=0;
	while (y = 1)
	{
		
	}
	std::cout << function() << std::endl;
	std::cout << function(1) << std::endl;
	std::cout << function(1,2) << std::endl;
	std::cout << function(1,2,3) << std::endl;
	std::cout << function(1,2,3,4) << std::endl;
	std::cout << function(1,2,3,4,5) << std::endl;
	return 0;
}