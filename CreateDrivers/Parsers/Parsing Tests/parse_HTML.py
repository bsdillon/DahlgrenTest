import requests
import urllib.request
from bs4 import BeautifulSoup

url = 'The TCP_IP Guide - IP Datagram General Format.html'
out = open("html_out.txt", "w")
tree = html.parse('The TCP_IP Guide - IP Datagram General Format.html')
out.write(str(html.tostring(tree)))
out.close()