import requests
import os
import json


# Airtable API URL and API Key
AIRTABLE_API_URL = "https://api.airtable.com/v0/app0606aE5TbClT7A/Services?view=Grid%20view"
AIRTABLE_API_KEY = os.getenv("AIRTABLE_API_KEY")


def download_services():
    headers = {
        "Authorization": f"Bearer {AIRTABLE_API_KEY}"
    }
    response = requests.get(AIRTABLE_API_URL, headers=headers)

    data = response.json()

    records = data["records"]

    # The response may contain multiple pages of data, so we need to handle pagination
    while "offset" in data:
        offset = data["offset"]
        response = requests.get(
            f"{AIRTABLE_API_URL}&offset={offset}", headers=headers)

        data = response.json()
        records.extend(data["records"])

    with open("data/services/services.json", "w") as f:
        json.dump(records, f, indent=4)


download_services()
