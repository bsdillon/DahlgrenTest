"""
WSGI config for newPrototypeWithCustomUserAPI project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/3.2/howto/deployment/wsgi/
"""

import os, sys

from django.core.wsgi import get_wsgi_application

#these lines may be required for some setups
#sys.path.append('C:/path/to/newPrototypeWithCustomUserAPI')
#sys.path.append('C:/path/to/newPrototypeWithCustomUserAPI/newPrototypeWithCustomUserAPI')

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'newPrototypeWithCustomUserAPI.settings')

application = get_wsgi_application()
