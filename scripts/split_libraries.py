import csv
import re

with open("./data/libraries/libraries.csv", encoding='utf-8') as libraries:
  csvin = csv.DictReader(libraries)
  services = {}
  
  for row in csvin:
    service = row["Local authority"]
    
    if service not in services:
      fileout = open("./data/libraries/{}.csv".format(re.sub(r'(?u)[^-\w.]', '', service.strip().replace(' ', '_')).lower()), "w", newline='', encoding='utf-8')
      dw = csv.DictWriter(fileout, fieldnames=csvin.fieldnames)
      dw.writeheader()
      services[service] = fileout, dw
      
      services[service][1].writerow(row)

    for fout, _ in services.values():
        fout.close()
