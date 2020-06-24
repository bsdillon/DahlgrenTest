cmake_minimum_required(VERSION 3.10)
project(C++ Tests)

set(CMAKE_CXX_STANDARD 11)

include_directories(src)

enable_testing()

add_subdirectory(src)
add_subdirectory(tst)
add_subdirectory(lib/googletest)
