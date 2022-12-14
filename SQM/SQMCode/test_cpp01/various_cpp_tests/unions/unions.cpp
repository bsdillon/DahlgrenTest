#include <iostream>

struct Employee
{
    int m_id {-1};
    int m_age {-1};
    double m_wage {-1};

    void setData(int id, int age, double wage)
    {
        m_id = id;
        m_age = age;
        m_wage = wage;
    }
}emp1{001, 24, 100000}, emp2{002, 26, 100000}, emp3{003, 53, 180000};

Employee emp4 = {4, 28, 110000};

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
            if (x.m_id != -1)
            {
                std::cout << "id: " << x.m_id << ";  Age: " << x.m_age << ";  Wage: " << x.m_wage << std::endl;
            }
        }
    }
};

union onion
{
    int a;
    char b;
    bool c;
}o{3}, o2{true};


typedef int JEREMY; 

class BOB
{
private:
int X = 0;
public:
    BOB(int x) {X = x;}
    void Print() {std::cout << "x = " << X << std::endl;}
}aye(2);

// Anonymous Class : Class is not having any name
class
{
    int i; 
public:
    void setData(int i)
    {
        this->i = i;
    }
    void print()
    {
        std::cout << "Value for i : " << this->i << std::endl;
    }
      
} Anon1, Anon2;    // multiple objects for anonymous class

/*
typedef struct {
    double x;
    double y;
} Point;
*/

int main()
{
    JEREMY x = 3;
    aye.Print();
    //Point a {1, 2};
    //a.x = 3;
    //std::cout << "x: " << a.x << ";  y: " << a.y << std::endl;
    
    Employer Robert;
    Robert.addEmployee(emp1, 0);
    Robert.addEmployee(emp2, 1);
    Robert.addEmployee(emp3, 2);
    Robert.addEmployee(emp4, 3);
    Robert.PrintEmployees();

    o = {(int)16}; //Should be long long int
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