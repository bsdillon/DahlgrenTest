from awesomecode.validate import validate_email

import pytest


@pytest.mark.parametrize('email, is_ok', [
    ('john.doe@somecompany.com', True),
    ('jdsfhjo89980209', False),
    ('', False)
])
def test_validate_email(email, is_ok):
    assert validate_email(email) == is_ok
