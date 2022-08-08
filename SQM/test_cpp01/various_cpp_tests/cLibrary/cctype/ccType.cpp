#include <cctype>
int main()
{
    char x = 'X';

    isalnum(x);
    isalpha(x);
    isblank(x);
    iscntrl(x);
    isdigit(x);
    isgraph(x);
    islower(x);
    isprint(x);
    ispunct(x);
    isspace(x);
    isupper(x);
    isxdigit(x);

    x = tolower(x);
    x = toupper(x);
    return 0;
}