#include <iostream>
#include <ctime>
using namespace std;

int main()
{
	time_t curr_time;
	curr_time = time(NULL);

	char *tm = ctime(&curr_time);
	cout << "Today is : " << tm;
	
	return 0;
}