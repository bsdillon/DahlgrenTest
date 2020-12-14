#include "abstractdriver.h"
#include "AllFields.h"
// #include "AllFields_Driver"


int main()
{
  AbstractDriver testDriver = new AbstractDriver()
  AllFields allFields = new AllFields()

  // Test methods
  print(testDriver.getTypeDescription(INT))
  print(testDriver.getTypeDescription(DOUBLE))
  print(testDriver.getTypeDescription(FLOAT))
}
