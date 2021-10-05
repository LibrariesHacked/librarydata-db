import csv

with open("./data/libraries/libraries.csv") as libraries:
  csvin = csv.DictReader(libraries)
  services = {}
  
  for row in csvin:
    service = row["Local authority"]
    
    if service not in services:
      fileout = open("{}.csv".format(service), "w")
      dw = csv.DictWriter(fileout, fieldnames=csvin.fieldnames)
      dw.writeheader()
      services[service] = fileout, dw
      
      services[service][1].writerow(row)

    for fout, _ in services.values():
        fout.close()
