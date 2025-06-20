
import json
import os
from google.cloud import secretmanager

SECRET_KEY = "fdsafasd"
MAX_CONTENT_LENGTH = 16 * 1024 * 1024

gcp_project_id = os.environ.get('GCP_PROJECT_ID')

def get_db_credentials():
    try:
        client = secretmanager.SecretManagerServiceClient()
        secret_name = "database_credentials"
        name = f"projects/{gcp_project_id}/secrets/{secret_name}/versions/latest"
        response = client.access_secret_version(request={"name": name})
        secret_string = response.payload.data.decode("UTF-8")
        return json.loads(secret_string)
    except Exception as exception:
        print('Error getting secret from GCP Secret Manager!')
        print(exception)
    return None

if __name__ == "__main__":
    print(get_db_credentials())
