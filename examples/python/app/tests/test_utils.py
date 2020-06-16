from app.core.utils import add, remove_spaces

import pytest


@pytest.mark.parametrize('num1, num2, result', [
    (10, 10, 20),
    (5, 5, 10),
    (6, 6, 12)
])
def test_add(num1, num2, result):
    """ Test for the add function
    ensures that two numbers are added correctly
    """
    assert add(num1, num2) == result


@pytest.mark.parametrize('num1, num2, wrong_result', [
    (14, 10, 20),
    (5, 2, 10),
    (1, 6, 12)
])
def test_fail_add(num1, num2, wrong_result):
    """ Negative test for the add function
    Ensures that two numbers add corectly
    by asserting num1 + num2 != wrong_result like 2+2!=5
    """
    assert add(num1, num2) != wrong_result


@pytest.mark.parametrize('data, result', [
    ('john doe', 'johndoe'),
    ('john        doe', 'johndoe'),
    (' ', '')
])
def test_remove_spaces(data, result):
    """ Test for removing spaces from a string
    """
    assert remove_spaces(data) == result
