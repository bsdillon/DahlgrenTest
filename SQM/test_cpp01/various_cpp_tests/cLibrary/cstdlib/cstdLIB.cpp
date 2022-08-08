#include <iostream>
#include <cstdlib>
using namespace std;

void bye()
{
	cout << "Program Exiting Successfully";
}

int main()
{
	int x;
	x = atexit(bye);

	if (x != 0)
	{
		cout << "Registration Failed";
		exit(1);
	}

	cout << "Registration successful" << endl;
	return 0;
}