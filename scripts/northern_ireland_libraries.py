"""Web scrapes Northern Ireland library pages """

from datetime import datetime
import json
import os
import csv
import requests
import re
from bs4 import BeautifulSoup
from datetime import *

WEBSITE = 'https://www.librariesni.org.uk'
LIST_PAGE = '/Libraries/Pages/libraries-home.aspx'
DATA_OUTPUT = '..//data//libraries_northern_ireland.csv'


def convert24(str1):
  time = datetime.strptime(str1, '%I:%M%p')
  return time.strftime('%H:%M')


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

        contact_table = library_soup.find('table', {'class': 'LNI_Contact'})
        contact_table_rows = contact_table.find('tbody').find_all('tr')
        address_1 = contact_table_rows[3].find('td').text.strip()
        address_2 = contact_table_rows[4].find('td').text.strip()
        address_3 = contact_table_rows[5].find('td').text.strip()
        postcode = contact_table_rows[6].find('td').text.strip()

        email = contact_table_rows[12].find_all('td')[1].text.strip()

        hours = {
            'Monday': {'row': 0, 'times': ''},
            'Tuesday': {'row': 1, 'times': ''},
            'Wednesday': {'row': 2, 'times': ''},
            'Thursday': {'row': 3, 'times': ''},
            'Friday': {'row': 4, 'times': ''},
            'Saturday': {'row': 5, 'times': ''},
            'Sunday': {'row': 6, 'times': ''},
        }

        opening_hours_table = library_soup.find(
            'table', {'class': 'LNI_OpenHrs'})
        hours_table_rows = opening_hours_table.find_all('tr')
        regexPattern = "((1[012]|[1-9]):" + "[0-5][0-9](\\s)" + "?(?i)(am|pm))"
        for day in hours:
          day_hours = hours_table_rows[hours[day]['row']].find_all('td')[
              1].text.strip()
          matches = re.findall(regexPattern, day_hours)
          opening_hours = ''
          if len(matches) > 1:
            opening_hours = convert24(
                matches[0][0]) + '-' + convert24(matches[1][0])
          if len(matches) > 2:
            opening_hours = opening_hours + ',' + \
                convert24(matches[2][0]) + '-' + convert24(matches[3][0])

          hours[day]['times'] = opening_hours

        libraries.append(
            [library_name, address_1, address_2, address_3, postcode, url, email, hours['Monday']['times'], hours['Tuesday']['times'],
             hours['Wednesday']['times'], hours['Thursday']['times'], hours['Friday']['times'], hours['Saturday']['times'], hours['Sunday']['times']]
        )

    with open(DATA_OUTPUT, 'w', encoding='utf8', newline='') as out_csv:
      libraries = sorted(libraries, key=lambda row: (row[0]))
      lib_writer = csv.writer(out_csv, delimiter=',',
                              quotechar='"', quoting=csv.QUOTE_MINIMAL)
      lib_writer.writerow(['Library name', 'Address 1',
                           'Address 2', 'Address 3', 'Postcode', 'URL', 'Email address', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'])

      for lib in libraries:
        lib_writer.writerow(
            [lib[0], lib[1], lib[2], lib[3], lib[4], lib[5], lib[6], lib[7], lib[8], lib[9], lib[10], lib[11], lib[12], lib[13]])


run()
