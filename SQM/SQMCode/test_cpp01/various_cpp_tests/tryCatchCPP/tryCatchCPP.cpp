// exceptions
#include <iostream>
using namespace std;

int main () {
  try {
    int i;
  } catch (const std::overflow_error& e) {
  } catch (const std::runtime_error& e) {
  } catch (const std::exception& e) {
  } catch (...) {
  }
}