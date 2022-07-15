#include <iostream>
#include <vector>
 
int main() {
    
    


    try {
        int x;
        int y = 5;
        const int z = 7;
        std::cout << "Throwing an integer exception...\n";
        throw 42;
    } catch (int i) {
        std::cout << " the integer exception was caught, with value: " << i << '\n';
    }

    try {
        std::vector<int> v(5);
        std::cout << v.at(10); // vector::at() throws std::out_of_range
    } catch (const std::exception& e) { // caught by reference to base
        std::cout << " a standard exception was caught, with message '"
                  << e.what() << "'\n";
    }
    
}