from code.utils import add, remove_spaces
import pytest


@pytest.mark.parametrize('x, y, result', [
    (10, 10, 20),
    (5, 5, 10),
    (6, 6, 12)
])
def test_add(x, y, result):
    assert add(x, y) == result


@pytest.mark.parametrize('data, result', [
    ('john doe', 'johndoe'),
    ('john        doe', 'johndoe'),
    (' ', '')
])
def test_remove_spaces(data, result):
    assert remove_spaces(data) == result
