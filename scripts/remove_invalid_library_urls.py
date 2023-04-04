"""Removes invalid URLs from library CSV files"""

import os
from pathlib import Path
import csv
import urllib.request, urllib.error, urllib.parse
import http.client

FOLDER_NAME = Path("../data/schemas/libraries")


def run():
    """Runs the main script"""

    folder = os.path.join(os.path.dirname(__file__), FOLDER_NAME)

    for filename in os.listdir(folder):
        if filename.endswith(".csv"):
            print("Processing " + filename)
            file_path = os.path.join(folder, filename)
            with open(file_path, newline="") as csvfile:
                reader = csv.DictReader(csvfile)
                fieldnames = reader.fieldnames
                rows = []
                for row in reader:
                    url = row["URL"]
                    if url != "None" and url != "":
                        print("Checking " + url)
                        try:
                            conn = urllib.request.urlopen(url)
                        except urllib.error.HTTPError as e:
                            row["URL"] = ""
                        except urllib.error.URLError as e:
                            row["URL"] = ""
                        except http.client.InvalidURL as e:
                            row["URL"] = ""
                        except ValueError as e:
                            row["URL"] = ""
                        except http.client.RemoteDisconnected as e:
                            # Do nothing - seems to be when the website blocks the connection
                            pass
                        else:
                            print("Good URL")

                    rows.append(row)

            with open(file_path, "w", newline="") as csvfile:
                writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
                writer.writeheader()
                for row in rows:
                    writer.writerow(row)


run()
