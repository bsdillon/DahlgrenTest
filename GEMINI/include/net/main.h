#ifndef MAIN_H
#define MAIN_H

#include "AllFields.h"
// #include "AllFields_Driver"


public int main()
{

  return 0;
}

public void testDriver(AbstractDriver driver) {
  print(driver.getTypeDescription(INT));
  print(driver.getTypeDescription(DOUBLE));
  
}
