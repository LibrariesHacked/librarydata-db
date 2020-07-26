"""Web scrapes Northern Ireland library pages """

from datetime import datetime
import json
import os
import csv
import requests
import re
from bs4 import BeautifulSoup

WEBSITE = 'https://www.librariesni.org.uk'
LIST_PAGE = '/Libraries/Pages/libraries-home.aspx'
DATA_OUTPUT = '..//data//libraries_northern_ireland.csv'


def run():
    """Runs the main script"""

    libraries = []

    # A single web page listing mobiles
    url = WEBSITE + LIST_PAGE
    library_list_html = requests.get(url)
    library_list_soup = BeautifulSoup(library_list_html.text, 'html.parser')

    links = library_list_soup.find_all('a')

    for link in links:
      href = link.get('href')
      if href is not None and 'Library' in href:
        library_name = link.string.replace(' Library', '')

        url = WEBSITE + href
        library_html = requests.get(WEBSITE + href)
        library_soup = BeautifulSoup(library_html.text, 'html.parser')

        contact_table = library_soup.find('table', { 'class': 'LNI_Contact'})
        table_rows = contact_table.find('tbody').find_all('tr')
        address_1 = table_rows[3].find('td').text.strip()
        address_2 = table_rows[4].find('td').text.strip()
        address_3 = table_rows[5].find('td').text.strip()
        postcode = table_rows[6].find('td').text.strip()

        libraries.append(
            [library_name, address_1, address_2, address_3, postcode, url]
        )

    with open(DATA_OUTPUT, 'w', encoding='utf8', newline='') as out_csv:
      libraries = sorted(libraries, key=lambda row: (row[0]))
      lib_writer = csv.writer(out_csv, delimiter=',',
                              quotechar='"', quoting=csv.QUOTE_MINIMAL)
      lib_writer.writerow(['Library name', 'Address 1',
                           'Address 2', 'Address 3', 'Postcode', 'URL'])

      for lib in libraries:
        lib_writer.writerow([lib[0], lib[1], lib[2], lib[3], lib[4], lib[5]])


run()
