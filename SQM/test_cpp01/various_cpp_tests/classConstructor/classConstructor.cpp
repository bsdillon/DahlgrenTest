#include <iostream>
using namespace std;

class Car {        // The class
  public:          // Access specifier
    string brand;  // Attribute
    string model;  // Attribute
    int year;      // Attribute
    Car(string x, string y, int z) { // Constructor with parameters
      brand = x;
      model = y;
      year = z;
    }
	friend bool operator==(const Car &lhs, const Car &rhs);
};

bool operator==(const Car &lhs, const Car &rhs){
	return lhs.brand == rhs.brand && lhs.model==rhs.model && lhs.year == rhs.year;
}

bool bigFunny(const Car &lhs, const Car &rhs){
	bool returnable = lhs.brand == rhs.brand && lhs.model==rhs.model && lhs.year == rhs.year;
	return returnable;
}

class MyClass {
  private:   // Private access specifier
    int priv;   // Private attribute
  protected:   // Protected access specifier
    int prot;   // Protected attribute
  public:    // Public access specifier
    static int returnZero(){return 0;}
    int pub;   // Public attribute
	int *pointy;
	MyClass(int pub){
		this->pub = pub;
	}
	// this code breaks the pass somehow
	// possibly it breaks opt itself but I have no ability to tell
	MyClass dubiousCopy(){
		MyClass copyInstance(pub);
		return copyInstance;
	}
};

int main() {
  // Create Car objects and call the constructor with different values
  Car carObj1("BMW", "X5", 1999);
  Car carObj2("Ford", "Mustang", 1969);

  // Print values
  cout << carObj1.brand << " " << carObj1.model << " " << carObj1.year << "\n";
  cout << carObj2.brand << " " << carObj2.model << " " << carObj2.year << "\n";
  
  cout << (carObj1 == carObj2) << "\n";
  cout << (carObj1 == carObj1) << "\n";
  bool bigFunny = bigFunny(carObj1, carObj2);
  
  carObj1.year = 2100;
  carObj2.year = carObj1.year;
  // Create MyClass object
  MyClass instance(13);
  MyClass::returnZero();
  MyClass newInstance = instance.dubiousCopy();
  return 0;
}