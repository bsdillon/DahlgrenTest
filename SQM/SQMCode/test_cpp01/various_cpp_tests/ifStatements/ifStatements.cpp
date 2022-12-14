#include <iostream>

bool isEqual(int x, int y)
{
    return x == y;
}

int main()
{
    if (isEqual(1, 2) == !(false))
    {
        std::cout << "ALL BRACKETS THEN" << std::endl;
    }
    else if ((1 + 1) != 2)
    {
        std::cout << "ALL BRACKETS ELSE IF" << std::endl;
    }
    else
    {
        std::cout << "ALL BRACKETS ELSE" << std::endl;
    }

    if (isEqual(1, 2) == !(false))
        std::cout << "This is impossible" << std::endl;
    else if ((1 + 1) != 2)
        std::cout << "Again, impossible" << std::endl;
    else
        std::cout << "But this is possible" << std::endl;

    if (1 == 2)
    {
        std::cout << "AA" << std::endl;
    }
    else if (1 == 3)
        std::cout << "AB" << std::endl;
    else
        std::cout << "AC" << std::endl;

    if (2 == 1)
        std::cout << "BA" << std::endl;
    else if (2 == 3)
        std::cout << "BB" << std::endl;
    else
    {
        std::cout << "BC" << std::endl;
    }

    if ((1 + 1) == 2)
        std::cout << "CA" << std::endl;

    if ((2 + 2) == 4)
    {
        std::cout << "CB" << std::endl;
    }

    if (true)
        int x = 1;
    else if (true)
        int x = 2;
    else if (true)
        int x = 3;
    else if (true)
        int x = 4;
    else if (true)
        int x = 5;
    else if (true)
    {
        int x = 6;
    }
    else if (true)
    {
        int x = 7;
    }
    else
        int x = 8;

    return 0;
}