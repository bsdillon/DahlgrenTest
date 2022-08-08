#include <cuchar>
#include <iostream>
using namespace std;

int main()
{
	const char16_t str[] = u"Hello World!";
	char s[50];
	mbstate_t ps{};
	size_t length;
	int j = 0;

	while (str[j])
	{
		length = c16rtomb(s, str[j], &ps);
		if ((length == 0) || (length > 50))
			break;
		for (int i=0; i<length; ++i)
			cout << s[i];
		++j;
	}

	return 0;
}