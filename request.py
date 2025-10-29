import requests

token_url = "https://mingle-sso.inforcloudsuite.com:443/KINRO_PRD/as/token.oauth2"
client_id = "KINRO_PRD~iJxHW7PiSZ9At4qsdM3t5gv1_cZPLXRTsPJ0B70Uwd4"
client_secret = "vwaa7o8ezxatUJt5N5iqqq0agYEapm3ZcWMJ6DMjkTk-0yQY-bOtU4vOqFAY3-UYEzPmLbZlza0nDbzhYTGgbg"
username = "KINRO_PRD#IoT7qb4Ro5FfsfFURYAMzfaiXI03YRyfLkJRY5rSp7WChVZcdKyCQcjm4EJMNZlqBjy5VaGPF_ggiU9wLKABBw"
password = "UMTOfKmiJ93CI16y-uVIR9tXvTHBn-dmqzbnjYPaYEKMKLMJ-wdSW98KblISkdsi2o1EbU3qob4ndzY6ng2HhQ"

response = requests.post(
    token_url,
    headers={"Content-Type": "application/x-www-form-urlencoded"},
    data={
        "grant_type": "password",
        "client_id": client_id,
        "client_secret": client_secret,
        "username": username,
        "password": password
    }
)

response.raise_for_status()
access_token = response.json()["access_token"]
print("Access token:", access_token)
