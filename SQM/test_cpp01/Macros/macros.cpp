// C++ program to illustrate macros
#include <iostream>
#include <cstdio>
#include <cstdarg>

// Macro definition
#define LIMIT 5

// Macro definition
#define AREA(l, b) (l * b)

// Function-like Macro definition
#define min(a, b) (((a) < (b)) ? (a) : (b))
 
// Macro definition
#define DATE 31
 
// Driver Code
int main()
{
    // Print the value of macro defined
    std::cout << "The value of LIMIT"
         << " is " << LIMIT << std::endl;

    // Print the message
    std::cout << "Lockdown will be extended"
         << " upto " << DATE
         << "-MAY-2020" << std::endl;


    // Given lengths l1 and l2
    int l1 = 10, l2 = 5, area;
 
    // Find the area using macros
    int area = AREA(l1, l2);

    // Find the min using macros
    int minimum = min(l1, l2);

    printf("Area of rectangle is: %i", area);
 
    return 0;
}