#include <cstring>
#include <iostream>

using namespace std;

int main()
{
    char ptr[] = "This is a random string";
    char ch = 'r';
    int count = 15;
    
    if (memchr(ptr,ch, count))
        cout << ch << " is present in first " << count << " characters of \"" << ptr << "\"";
    else
        cout << ch << " is not present in first " << count << " characters of \"" << ptr << "\"";

    return 0;
}