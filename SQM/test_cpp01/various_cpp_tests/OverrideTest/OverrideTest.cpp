#include <iostream>

//---------------------------------------------------------------------------
class Rectangle {
 public:
  Rectangle(double l, double w) : length_(l), width_(w) {}
  virtual void Print() const;

 private:
  double length_;
  double width_;
};

//---------------------------------------------------------------------------
void Rectangle::Print() const {
  // Print method of base class.
  std::cout << "Length = " << length_ << "; Width = " << width_;
}

//---------------------------------------------------------------------------
class Box : public Rectangle {
 public:
  Box(double l, double w, double h) : Rectangle(l, w), height_(h) {}
  void Print() const override;

 private:
  double height_;
};

//---------------------------------------------------------------------------
// Print method of derived class.
void Box::Print() const {
  // Invoke parent Print method.
  Rectangle::Print();
  std::cout << "; Height = " << height_;
}

int main(int argc, char** argv) {
  Rectangle rectangle(5.0, 3.0);

  // Outputs: Length = 5.0; Width = 3.0
  rectangle.Print();

  Box box(6.0, 5.0, 4.0);

  // The pointer to the most overridden method in the vtable in on Box::print,
  // but this call does not illustrate overriding.
  box.Print();

  // This call illustrates overriding.
  // outputs: Length = 6.0; Width = 5.0; Height= 4.0
  static_cast<Rectangle&>(box).Print();
}