import os
import csv
import sys
import chardet

PATH = 'C:\\Data\\Library Data'
AUTHORITY_OUTPUT = '..\\data\\authorities.csv'
COUNTS_OUTPUT = '..\\data\\[year]_[CODE]_counts.csv'


def run():

    auth_codes = {}

    years = [(f.path, f.name) for f in os.scandir(PATH) if f.is_dir()]

    for year in years:
        sample_auths = [(f.path, f.name)
                        for f in os.scandir(year[0]) if f.is_dir()]

        for sample in sample_auths:
            counts = []
            code = sample[1][0:2]
            name = sample[1][3:]
            if code not in auth_codes:
                auth_codes[code] = name

            # Loop through all the files
            submissions = [(f.path, f.name) for f in os.scandir(
                sample[0]) if f.is_file()]

            for submission in submissions:

                if 'test' not in submission[1].lower():

                    # look at the first ten thousand bytes to guess the character encoding
                    with open(submission[0], 'rb') as rawdata:
                        prediction = chardet.detect(rawdata.read())
                        encoding = prediction['encoding']

                    rows = []
                    with open(submission[0], 'r', encoding=encoding) as csvfile:

                        try:
                            reader = csv.reader(
                                csvfile, delimiter='|', quoting=csv.QUOTE_NONE)
                            for row in reader:
                                rows.append(row)
                        except:
                            print("Error")

                    period_start = ''
                    period_end = ''
                    for (idx, row) in enumerate(rows):
                        if idx == 0 and len(row) > 2:
                            period_start = row[1]
                            period_end = row[2]
                        else:
                            if len(row) == 5:
                                # Authority, Start, End, ISBN, contributor, item type, stock, loans
                                counts.append(
                                    [code, period_start, period_end, row[0].strip(), row[3].strip(), row[4].strip(), row[2].strip().lstrip("0"), row[1].strip().lstrip("0")])

            with open(COUNTS_OUTPUT.replace('[year]', year[1]).replace('[CODE]', code), 'w', encoding='utf8', newline='') as out_csv:
                writer = csv.writer(out_csv, delimiter=',',
                                    quotechar='"', quoting=csv.QUOTE_MINIMAL)
                writer.writerow(['authority_code', 'period_start', 'period_end',
                                'isbn', 'contributor', 'item_type', 'stock', 'loans'])
                for count in counts:
                    writer.writerow([count[0], count[1], count[2], count[3], count[4], count[5], count[6], count[7]])

    with open(AUTHORITY_OUTPUT, 'w', encoding='utf8', newline='') as out_csv:
        writer = csv.writer(out_csv, delimiter=',',
                            quotechar='"', quoting=csv.QUOTE_MINIMAL)
        writer.writerow(['code', 'name'])
        for attr in auth_codes:
            writer.writerow([attr, auth_codes[attr]])


run()
