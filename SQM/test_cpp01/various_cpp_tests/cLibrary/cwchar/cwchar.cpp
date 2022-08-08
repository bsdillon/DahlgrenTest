#include <cwchar>
#include <cstring>
#include <iostream>
using namespace std;

int main()
{
	char str[] = "Hello\xf4\xdf";
	wchar_t wc;
	int count = 0;
	
	for (int i=0; i<strlen(str); i++)
	{
		wc = btowc(str[i]);
		if (wc != WEOF)
		count++;
	}
	
	cout << count << " out of " << strlen(str) << " characters were successfully widened";
	return 0;
}