import os
import csv
import sys
import chardet

PATH = 'C:\\Data\\FOI - Library Data\\FOI - Library Data\\Library Data'
AUTHORITY_OUTPUT = '..\\data\\authorities.csv'
COUNTS_OUTPUT = '..\\data\\counts.csv'


def run():

    auth_codes = {}
    counts = []

    years = [f.path for f in os.scandir(PATH) if f.is_dir()]

    for year in years:
        sample_auths = [(f.path, f.name) for f in os.scandir(year) if f.is_dir()]

        for sample in sample_auths:

            code = sample[1][0:2]
            name = sample[1][3:]
            if code not in auth_codes:
                auth_codes[code] = name

            # Loop through all the files
            submissions = [f.path for f in os.scandir(sample[0]) if f.is_file()]

            for submission in submissions:

                print(submission)

                # look at the first ten thousand bytes to guess the character encoding
                with open(submission, 'rb') as rawdata:
                    prediction = chardet.detect(rawdata.read())
                    encoding = prediction['encoding']

                rows = []
                counts = []
                with open(submission, 'r', encoding=encoding) as csvfile:

                    try:
                        reader = csv.reader(
                            csvfile, delimiter='|', quoting=csv.QUOTE_NONE)
                        for row in reader:
                            rows.append(row)
                    except:
                        print("Error")
                        break

                period_start = ''
                period_end = ''
                for (idx, row) in enumerate(rows):
                    if idx == 0:
                        period_start = row[1]
                        period_end = row[2]
                    elif (idx == (len(rows) - 1)):
                        # Do validation
                        if int(row[0]) != len(counts):
                            print("Validation error")
                    else:
                        # Authority, Start, End, ISBN, contributor, item type, stock, loans
                        counts.append(
                            [code, period_start, period_end, row[0], row[3], row[4], row[2], row[1]])

    with open(AUTHORITY_OUTPUT, 'w', encoding='utf8', newline='') as out_csv:
        writer = csv.writer(out_csv, delimiter=',',
                            quotechar='"', quoting=csv.QUOTE_MINIMAL)
        writer.writerow(['code', 'name'])
        for attr in auth_codes:
            writer.writerow([attr, auth_codes[attr]])


run()
