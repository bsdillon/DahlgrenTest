import pytest
from app.core.utils import add, remove_spaces


@pytest.mark.parametrize('x, y, result', [
    (10, 10, 20),
    (5, 5, 10),
    (6, 6, 12)
])
def test_add(x, y, result):
    """ Test for the add function
    ensures that two numbers are added correctly
    """
    assert add(x, y) == result


@pytest.mark.parametrize('x, y, wrongResult', [
    (14, 10, 20),
    (5, 2, 10),
    (1, 6, 12)
])
def test_fail_add(x, y, wrongResult):
    """ Negative test for the add function
    Ensures that two numbers add corectly
    by asserting x + y != z like 2+2!=5
    """
    assert add(x, y) != wrongResult


@pytest.mark.parametrize('data, result', [
    ('john doe', 'johndoe'),
    ('john        doe', 'johndoe'),
    (' ', '')
])
def test_remove_spaces(data, result):
    """ Test for removing spaces from a string
    """
    assert remove_spaces(data) == result
