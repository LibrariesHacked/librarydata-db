# This Python file uses the following encoding: latin-1
"""Web scrapes Welsh libraries from Wikidata """

import os
import csv
import re

""" Wikidata query: download as CSV
  SELECT ?wikidataLabel ?layer ?postcode ?address ?websiteLabel ?emailAddressLabel ?opened ?closed WHERE {  

    ?wikidata wdt:P31/wdt:P279* wd:Q28564 ;
              wdt:P17 wd:Q145 ;
              wdt:P625 ?coor ;
              wdt:P137 ?operator ;
              OPTIONAL {?wikidata wdt:P18 ?image .}
    OPTIONAL {?wikidata wdt:P856 ?website .}
    OPTIONAL {?wikidata wdt:P281 ?postcode .}
    OPTIONAL {?wikidata wdt:P6375 ?address .}
    OPTIONAL {?wikidata wdt:P968 ?emailAddress .}
    OPTIONAL {?wikidata wdt:P1619 ?opened .}
    OPTIONAL {?wikidata wdt:P3999 ?closed .}

    VALUES ?operator { wd:Q4923796 wd:Q4966533 wd:Q5016926 wd:Q5038400 wd:Q5043224 wd:Q5064127 wd:Q5166758 wd:Q5256629 wd:Q16837157
                                   wd:Q5623821 wd:Q6083890 wd:Q16997658 wd:Q6901162 wd:Q6984500 wd:Q16998902 wd:Q7161994 wd:Q7236943 wd:Q7321391 
                                   wd:Q5123523 wd:Q7825688 wd:Q7909538 wd:Q8038115 }
    BIND ( 
      IF(?operator = wd:Q4923796, "W06000019", 
         IF(?operator = wd:Q4966533, "W06000013", 
            IF(?operator = wd:Q5016926, "W06000018",  
               IF(?operator = wd:Q5038400, "W06000015",   
                  IF(?operator = wd:Q5043224, "W06000010", 
                     IF(?operator = wd:Q5064127, "W06000008",   
                        IF(?operator = wd:Q5166758, "W06000003",
                           IF(?operator = wd:Q5256629, "W06000004",
                              IF(?operator = wd:Q16837157, "W06000005", 
                                 IF(?operator = wd:Q5623821, "W06000002",   
                                    IF(?operator = wd:Q6083890, "W06000001",
                                       IF(?operator = wd:Q16997658, "W06000024",
                                          IF(?operator = wd:Q6901162, "W06000021",
                                             IF(?operator = wd:Q6984500, "W06000012",   
                                                IF(?operator = wd:Q16998902, "W06000022",
                                                   IF(?operator = wd:Q7161994, "W06000009", 
                                                      IF(?operator = wd:Q7236943, "W06000023",   
                                                         IF(?operator = wd:Q7321391, "W06000016",
                                                            IF(?operator = wd:Q5123523, "W06000011",
                                                               IF(?operator = wd:Q7825688, "W06000020",   
                                                                  IF(?operator = wd:Q7909538, "W06000014", 
                                                                     IF(?operator = wd:Q8038115, "W06000006",
                                                                        "")))))))))))))))))))))) AS ?layer).  
    SERVICE wikibase:label { bd:serviceParam wikibase:language "en" }
  }
  ORDER BY ?layer ?wikidataLabel
 
  """

WIKIDATA = '..//raw//wales.csv'
DATA_OUTPUT = '..//data//libraries_wales.csv'
POSTCODE_RE = '(([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2}))'


def run():

  libraries = []
  with open(WIKIDATA, 'r', encoding='utf-8') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    next(reader)
    for row in reader:
      library = {
          'Local authority code': row[1].strip(),
          'Library name': row[0].strip(),
          'Address 1': '',
          'Address 2': '',
          'Address 3': '',
          'Postcode': row[2].strip(),
          'Type of library': 'LAL',
          'Statutory': True,
          'Year opened': '',
          'Year closed': '',
          'URL': row[4].strip(),
          'Email address': row[5].strip()
      }

      address = row[3].strip()
      postcode_match = re.compile(POSTCODE_RE).search(address)
      postcode = row[2].strip()
      if postcode_match and postcode == '':
        postcode = postcode_match.group(1)

      library['Postcode'] = postcode

      address = address.replace(postcode, '')

      address_fields = address.split(',')
      if (len(address_fields) > 1):
         library['Address 1'] = address_fields[1].strip()
      if (len(address_fields) > 2):
         library['Address 2'] = address_fields[2].strip()
      if (len(address_fields) > 3):
         library['Address 3'] = address_fields[3].strip()

      if (row[1].strip() == 'W06000019'):#Blaunau Gwent
         library['Type of library'] = 'CL'
      if (row[1].strip() == 'W06000013'):#Pen-y-bont ar Ogwr
         library['Type of library'] = 'CL'
      if (row[1].strip() == 'W06000018'):#Caerffili"
         library['Type of library'] = 'LAL'
      if (row[1].strip() == 'W06000015'):#Caerdydd"
         library['Type of library'] = 'LAL'
      if (row[1].strip() == 'W06000010'):#Sir Gaerfyrddin"
         library['Type of library'] = 'LAL'
      if (row[1].strip() == 'W06000008'):#Ceredigion"
         library['Type of library'] = 'LAL'
      if (row[1].strip() == 'W06000003'):#Conwy"
         library['Type of library'] = 'LAL'
      if (row[1].strip() == 'W06000004'):#Sir Ddinbych"
         library['Type of library'] = 'LAL'
      if (row[1].strip() == 'W06000005'):#Sir y Fflint"
         library['Type of library'] = 'CL'
      if (row[1].strip() == 'W06000002'):#Gwynedd"
         library['Type of library'] = 'LAL'
      if (row[1].strip() == 'W06000001'):#Ynys Môn"
         library['Type of library'] = 'LAL'
      if (row[1].strip() == 'W06000024'):#Merthyr Tudful"
         library['Type of library'] = 'CL'
      if (row[1].strip() == 'W06000021'):#Sir Fynwy"
         library['Type of library'] = 'LAL'
      if (row[1].strip() == 'W06000012'):#Castell-nedd Port Talbot"
         library['Type of library'] = 'LAL'
      if (row[1].strip() == 'W06000022'):#Casnewydd"
         library['Type of library'] = 'LAL'
      if (row[1].strip() == 'W06000009'):#Sir Benfro"
         library['Type of library'] = 'LAL'
      if (row[1].strip() == 'W06000023'):#Powys"
         library['Type of library'] = 'LAL'
      if (row[1].strip() == 'W06000016'):#Rhondda Cynon Taf"
         library['Type of library'] = 'LAL'
      if (row[1].strip() == 'W06000011'):#Abertawe"
         library['Type of library'] = 'LAL'
      if (row[1].strip() == 'W06000020'):#Torfaen"
         library['Type of library'] = 'LAL'
      if (row[1].strip() == 'W06000014'):#Bro Morgannwg"
         library['Type of library'] = 'LAL'
      if (row[1].strip() == 'W06000006'):#Wrecsam"
         library['Type of library'] = 'LAL'

      if (row[6].strip() != ''):
         library['Year opened'] = row[6].strip()[:4]
      if (row[7].strip() != ''):
         library['Year closed'] = row[7].strip()[:4]
         library['Statutory'] = False

      libraries.append(library)

  with open(DATA_OUTPUT, 'w', encoding='utf-8', newline='') as out_csv:
    writer = csv.writer(out_csv, delimiter=',',
                        quotechar='"', quoting=csv.QUOTE_MINIMAL)
    writer.writerow(libraries[0].keys())
    for library in libraries:
      writer.writerow(
          [
              library['Local authority code'],
              library['Library name'],
              library['Address 1'],
              library['Address 2'],
              library['Address 3'],
              library['Postcode'],
              library['Type of library'],
              library['Statutory'],
              library['Year opened'],
              library['Year closed'],
              library['URL'],
              library['Email address']
          ]
      )

run()
