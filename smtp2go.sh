#!/bin/bash

SUBJECT="";
API_KEY=""
EMAIL_TO=""
FROM_EMAIL=""
FROM_NAME=""
MESSAGE="";

REQUEST_DATA='{"personalizations": [{ 
                   "to": [{ "email": "'"$EMAIL_TO"'" }],
                   "subject": "'"$SUBJECT"'" 
                }],
                "from": {
                    "email": "'"$FROM_EMAIL"'",
                    "name": "'"$FROM_NAME"'" 
                },
                "content": [{
                    "type": "text/plain",
                    "value": "'"$MESSAGE"'"
                }]
}';

curl -X "POST" "https://api.sendgrid.com/v3/mail/send" \
    -H "Authorization: Bearer $API_KEY" \
    -H "Content-Type: application/json" \
    -d "$REQUEST_DATA"