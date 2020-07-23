"""Web scrapes Scotland's libraries from SLIC """

from urllib.parse import quote
import os
import csv
import re
from bs4 import BeautifulSoup

# HTML obtained using: curl "https://web.archive.org/web/20200425101045/https://scottishlibraries.org/find-a-library/" > raw/scotland.html
HTML = '../raw/scotland.html'
DATA_OUTPUT = '..//data//scotland.csv'


def run():
    """Runs the main script"""

    libraries = []

    library_soup = BeautifulSoup(open(HTML), 'html.parser')

    for library in library_soup.find_all('div', {'class': 'markerDetails'}):

        public_library = library.find('div', {'mapoverlaycat': 'Public'})

        if (public_library is not None):

            name = library['markericontitle']
            location = library['location'].split(',')
            latitude = location[0]
            longitude = location[1]

            address = public_library['mapoverlaydescription']

            postcode = ''
            postcodes = re.findall(
                r'[A-Z]{1,2}[0-9R][0-9A-Z]? [0-9][A-Z]{2}', address.upper())

            if len(postcodes) > 0:
              postcode = postcodes[0]

            address_lines = re.split(',|<br/>', address) 

            address_1 = ''
            if len(address_lines) > 0:
              address_1 = address_lines[0]

            website = public_library.find('div', {'class': 'mapOverlayLink'})

            if (website is not None):
              url = website['url']

              libraries.append(
                  [name, address_1, postcode, url]
              )

    with open(DATA_OUTPUT, 'w', encoding='utf8', newline='') as out_csv:
      libraries = sorted(libraries, key=lambda row: (row[0]))
      lib_writer = csv.writer(out_csv, delimiter=',',
                              quotechar='"', quoting=csv.QUOTE_MINIMAL)
      lib_writer.writerow(['Library name', 'Address 1', 'Postcode', 'URL'])

      for lib in libraries:
        lib_writer.writerow([lib[0], lib[1], lib[2], lib[3]])


run()
