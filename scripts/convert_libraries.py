import os
import csv

INPUT_PATH = '.\\data\\libraries_original.csv'
OUTPUT_PATH = '.\\data\\libraries.csv'

def run():

  libraries = []
  with open(INPUT_PATH, 'r') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    next(reader)
    for row in reader:
      library = {
        'Local authority': row[0].strip(),
        'Library name': row[1].strip(),
        'Address 1': row[2].strip(),
        'Address 2': row[3].strip(),
        'Address 3': row[4].strip(),
        'Postcode': row[5].strip(),
        'Unique property reference number': row[6].strip(),
        'Type of library': row[10].strip(),
        'Year opened': row[12].strip(),
        'Year closed': row[11].strip(),
        'Monday staffed hours': row[16].strip() + '-' + row[17].strip(),
        'Tuesday staffed hours': row[18].strip() + '-' + row[19].strip(),
        'Wednesday staffed hours': row[20].strip() + '-' + row[21].strip(),
        'Thursday staffed hours': row[22].strip() + '-' + row[23].strip(),
        'Friday staffed hours': row[24].strip() + '-' + row[25].strip(),
        'Saturday staffed hours': row[26].strip() + '-' + row[27].strip(),
        'Sunday staffed hours': row[28].strip() + '-' + row[29].strip(),
        'Monday unstaffed hours': '00:00',
        'Tuesday unstaffed hours': '00:00',
        'Wednesday unstaffed hours': '00:00',
        'Thursday unstaffed hours': '00:00',
        'Friday unstaffed hours': '00:00',
        'Saturday unstaffed hours': '00:00',
        'Sunday unstaffed hours': '00:00',
        'Special hours': '',
        'Co-located': row[13].strip(),
        'Co-located with': row[14].strip(),
        'Notes': row[15].strip(),
        'URL': row[32].strip(),
        'Email address': row[31].strip()
      }
      libraries.append(library)

  with open(OUTPUT_PATH, 'w', encoding='utf8', newline='') as out_csv:
    writer = csv.writer(out_csv, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
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