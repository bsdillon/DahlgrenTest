#include <iostream>

struct Employee
{
    int id {-1};
    int age {-1};
    double wage {-1};
};

class Employer
{
private:
    Employee employees[5];
public:
    void addEmployee(Employee emp, int index)
    {
        employees[index] = emp;
    }
    Employee getEmployee(int index)
    {
        return employees[index];
    }
    void PrintEmployees()
    {
        std::cout << "Employees:" << std::endl;
        for(Employee x : employees)
        {
            if (x.id != -1)
            {
                std::cout << "id: " << x.id << ";  Age: " << x.age << ";  Wage: " << x.wage << std::endl;
            }
        }
    }
};

//union onion
//{
//    int a;
//    char b;
//    bool c;
//};

int main()
{
    Employer Robert;
    Robert.addEmployee(Employee{001, 24, 100000}, 0);
    Robert.PrintEmployees();

    onion o = {(int)4000000000}; //Should be long long int
    //o.a should now be active, with undefined behavior from o.b and o.c

    std::cout << "o = {(int)16}:" << std::endl;

    std::cout << "o.a is now " << o.a << "\n"
              << "o.b is now " << o.b << "\n"
              << "o.c is now " << o.c << std::endl;

    o = {'3'};
    std::cout << "o = {'3'}:" << std::endl;
    std::cout << "o.a is now " << o.a << "\n"
              << "o.b is now " << o.b << "\n"
              << "o.c is now " << o.c << std::endl;

    o = {true};
    std::cout << "o = {true}:" << std::endl;
    std::cout << "o.a is now " << o.a << "\n"
              << "o.b is now " << o.b << "\n"
              << "o.c is now " << o.c << std::endl;
    return 0;
}