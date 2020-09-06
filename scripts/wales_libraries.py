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
        IF(?operator = wd:Q4923796, "Blaenau Gwent", 
        IF(?operator = wd:Q4966533, "Pen-y-bont ar Ogwr", 
        IF(?operator = wd:Q5016926, "Caerffili",  
        IF(?operator = wd:Q5038400, "Caerdydd",   
        IF(?operator = wd:Q5043224, "Sir Gaerfyrddin", 
        IF(?operator = wd:Q5064127, "Ceredigion",   
        IF(?operator = wd:Q5166758, "Conwy",
        IF(?operator = wd:Q5256629, "Sir Ddinbych",
        IF(?operator = wd:Q16837157, "Sir y Fflint", 
        IF(?operator = wd:Q5623821, "Gwynedd",   
        IF(?operator = wd:Q6083890, "Ynys Môn",
        IF(?operator = wd:Q16997658, "Merthyr Tudful",
        IF(?operator = wd:Q6901162, "Sir Fynwy",
        IF(?operator = wd:Q6984500, "Castell-nedd Port Talbot",   
        IF(?operator = wd:Q16998902, "Casnewydd",
        IF(?operator = wd:Q7161994, "Sir Benfro", 
        IF(?operator = wd:Q7236943, "Powys",   
        IF(?operator = wd:Q7321391, "Rhondda Cynon Taf",
        IF(?operator = wd:Q5123523, "Abertawe",
        IF(?operator = wd:Q7825688, "Torfaen",   
        IF(?operator = wd:Q7909538, "Bro Morgannw", 
        IF(?operator = wd:Q8038115, "Wrecsam",
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
  with open(WIKIDATA, 'r') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    next(reader)
    for row in reader:
      library = {
          'Local authority': row[1].strip(),
          'Library name': row[0].strip(),
          'Address 1': '',
          'Address 2': '',
          'Address 3': '',
          'Postcode': row[2].strip(),
          'Unique property reference number': '',
          'Type of library': 'LAL',
          'Year opened': '',
          'Year closed': '',
          'Monday staffed hours': '',
          'Tuesday staffed hours': '',
          'Wednesday staffed hours': '',
          'Thursday staffed hours': '',
          'Friday staffed hours': '',
          'Saturday staffed hours': '',
          'Sunday staffed hours': '',
          'Monday unstaffed hours': '',
          'Tuesday unstaffed hours': '',
          'Wednesday unstaffed hours': '',
          'Thursday unstaffed hours': '',
          'Friday unstaffed hours': '',
          'Saturday unstaffed hours': '',
          'Sunday unstaffed hours': '',
          'Special hours': '',
          'Co-located': '',
          'Co-located with': '',
          'Notes': '',
          'URL': row[4].strip(),
          'Email address': row[5].strip()
      }

      address = row[3].strip()
      postcode_match = re.compile(POSTCODE_RE).search(address)
      postcode = row[2].strip()
      if postcode_match and postcode != '':
        postcode = postcode_match.group(1)
        address = address.replace(postcode, '')
      library['Postcode'] = postcode

      libraries.append(library)


  with open(DATA_OUTPUT, 'w', encoding='utf8', newline='') as out_csv:
    writer = csv.writer(out_csv, delimiter=',',
                        quotechar='"', quoting=csv.QUOTE_MINIMAL)
    writer.writerow(libraries[0].keys())
    for library in libraries:
      writer.writerow(
          [
              library['Local authority'],
              library['Library name'],
              library['Address 1'],
              library['Address 2'],
              library['Address 3'],
              library['Postcode'],
              library['Unique property reference number'],
              library['Type of library'],
              library['Year opened'],
              library['Year closed'],
              library['Monday staffed hours'],
              library['Tuesday staffed hours'],
              library['Wednesday staffed hours'],
              library['Thursday staffed hours'],
              library['Friday staffed hours'],
              library['Saturday staffed hours'],
              library['Sunday staffed hours'],
              library['Monday unstaffed hours'],
              library['Tuesday unstaffed hours'],
              library['Wednesday unstaffed hours'],
              library['Thursday unstaffed hours'],
              library['Friday unstaffed hours'],
              library['Saturday unstaffed hours'],
              library['Sunday unstaffed hours'],
              library['Special hours'],
              library['Co-located'],
              library['Co-located with'],
              library['Notes'],
              library['URL'],
              library['Email address']
          ]
      )

run()
