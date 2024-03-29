import csv
import re

with open("./data/schemas/libraries.csv", encoding='utf-8') as libraries:
  csvin = csv.DictReader(libraries)
  services = {}
  
  for row in csvin:
    service = row["Local authority"]
    
    if service not in services:
      fileout = open("./data/schemas/libraries/{}.csv".format(re.sub(r'(?u)[^-\w.]', '', service.strip().replace(' ', '_')).lower()), "w", newline='', encoding='utf-8')
      dw = csv.DictWriter(fileout, fieldnames=csvin.fieldnames)
      dw.writeheader()
      services[service] = fileout, dw
      
    services[service][1].writerow(row)

  for fileout, _ in services.values():
    fileout.close()
