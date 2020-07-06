//============================================================================
// Name        : SortSearch.hpp
// Author      : Carlos Gomes
// Version     :
// Copyright   : Copyright Carlos Gomes
// Description : Classes providing the methods for sorting and search vectors.
//============================================================================
#ifndef DAHLGRENTEST_SRC_SORTINGSEARCH_HPP
#define DAHLGRENTEST_SRC_SORTINGSEARCH_HPP

#pragma once

#include <assert.h>
#include <limits>
#include <random>

namespace sorting_and_searching {
  
class Add {
public:
  /*
   * Adds two integer values and returns the result.
   * @param num1 the first integer value.
   * @param num2 the second integer value to be added to num1
   * @return Returns the result of num1 + num2
   */
  int addTwoNumbers(int num1, int num2);
};

class Obtain {
public:
  /*!
   * Creates a vector with a certain size, fills it with random values within a
   * range and returns it.
   * @param vector_size is the size of the vector, which should be returned.
   * @param range is the max and min value of the vector, it ranges from -range
   * to +range.
   * @return Returns the vector.
   */
  std::vector<int> getVector(std::size_t vector_size, std::size_t range);
};

class Sort {
public:
  /*!
   * Sorts the values within a given vector in increasing order.
   * @param v is a vector with integers which should be sorted.
   */
  void sortVector(std::vector<int> &v);
};

class Search {
public:
  /*!
   * Method to search the position of a value inside a vector. If there are
   * multiple entries with the same value, one entry positions of them is
   * returned.
   * @param vec is the input vector.
   * @param X is the value which should be found within the vector.
   * @return -1 if not found, otherwise the position on the vector.
   */
  int binary_search(const std::vector<int> &vec, int X);
    
};

} // namespace sorting_and_searching

#endif //DAHLGRENTEST_SRC_SORTING_AND_SEARCHING_CPP