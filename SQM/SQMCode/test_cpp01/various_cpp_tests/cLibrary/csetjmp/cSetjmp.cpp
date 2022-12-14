#include <iostream>
#include <csetjmp>
using namespace std;

int main()
{
	jmp_buf env;
	int val;
	
	val = setjmp(env);
	if (val==0)
	{
		cout << "setjmp returned " << val << endl;
		longjmp(env,val);
	}
	else
	{
		cout << "setjmp returned " << val << endl;
		cout << "Program terminating" << endl;
	}

	return 0;
}