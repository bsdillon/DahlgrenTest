#include <cwctype>
#include <iostream>
#include <clocale>
using namespace std;

int main()
{
	setlocale(LC_ALL, "en_US.UTF-8");
	
	wchar_t wc1 = L'\u00b6';
	wchar_t wc2 = L'\u00c5';
	wcout << L"In the current locale" << endl;
	
	iswalnum(wc1)?wcout << wc1 << " is alphanumeric ":wcout << wc1 << " is not alphanumeric ";
	wcout << endl;
	iswalnum(wc2)?wcout << wc2 << " is alphanumeric ":wcout << wc2 << " is not alphanumeric ";
	
	return 0;
}