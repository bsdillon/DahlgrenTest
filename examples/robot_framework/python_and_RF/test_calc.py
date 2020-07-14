from calc import add, subtract, multiply, divide, add_sub_mul_div

import pytest

@pytest.mark.parametrize('num1, num2, result', [
    (1, 1, 2),
    (2, 5, 7),
    (0, 2, 2)
])

def test_add(num1, num2, result):
    assert add(num1, num2) == result

@pytest.mark.parametrize('num1, num2, result', [
    (1, 0, 1),
    (4, 4, 0),
    (5, 2, 3)
])

def test_subtract(num1, num2, result):
    assert subtract(num1, num2) == result

@pytest.mark.parametrize('num1, num2, result', [
    (1, 1, 1),
    (4, 4, 16),
    (10, 2, 20) 
])

def test_multiply(num1, num2, result):
    assert multiply(num1, num2) == result

@pytest.mark.parametrize('num1, num2, result', [
    (4, 2, 2),
    (4.0, 8.0, 0.5),
    (10, 2, 5)
])

def test_divide(num1, num2, result):
    assert divide(num1, num2) == result

@pytest.mark.parametrize('num1, num2, num3, num4, num5, result', [
    (7.0, 36.0, 11.0, 3.0, 24.0, 41.625),
    (4.0, 4.0, 4.0, 4.0, 4.0, 4.0),
    (44.3, 2.0, 7.2, 4.0, 9.91, 43.39384460141271)
])

def test_add_sub_mul_div(num1, num2, num3, num4, num5, result):
    assert add_sub_mul_div(num1, num2, num3, num4, num5) == result

