#!/usr/bin/env python

def numInput1():
    return int(input("Please input the first number:\n"))

def numInput2():
    return int(input("Please input the second number:\n"))

def add(num1, num2):
    return num1 + num2

def subtract(num1, num2):
    return num1 - num2

def multiply(num1, num2):
    return num1 * num2

def divide(num1, num2):
    return num1 / num2

def add_sub_mul_div(num1, num2, num3, num4, num5):
    return subtract(add(num1, num2), divide(multiply(num3, num4), num5))

def main():
    num1 = numInput1()
    num2 = numInput2()
    print(add(num1, num2))
    print(subtract(num1, num2))
    print(multiply(num1, num2))
    print(divide(num1, num2))
    print(add(1,2))
    print(subtract(2,1))
    print(multiply(4,2))
    print(divide(4.0,8.0))
    print(add_sub_mul_div(7.0, 36.0, 11.0, 3.0, 24.0))
    print(add_sub_mul_div(4.0, 4.0, 4.0, 4.0, 4.0))
    print(add_sub_mul_div(44.3, 2.0, 7.2, 4.0, 9.91))

if __name__ == "__main__":
    main()
