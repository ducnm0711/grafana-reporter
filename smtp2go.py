#!/usr/bin/python
import smtplib
import os
from email.mime.base import MIMEBase
from email import encoders
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

username = os.getenv('SMTP2GO_USER')
password = os.getenv('SMTP2GO_PASSWORD')
sender = os.getenv('SMTP2GO_SENDER')
recipient = os.getenv('SMTP2GO_RECIPIENT')

msg = MIMEMultipart('mixed')
msg['Subject'] = 'Jitsi CNAM Weekly Report'
msg['From'] = sender
msg['To'] = recipient

text_message = MIMEText('Please find the report in attachment.', 'plain')

filename = os.getenv('GRAFANA_OUTPUT')

# We assume that the file is in the directory where you run your Python script from
with open(filename, "rb") as attachment:
    # The content type "application/octet-stream" means that a MIME attachment is a binary file
    part = MIMEBase("application", "octet-stream")
    part.set_payload(attachment.read())

# Encode to base64
encoders.encode_base64(part)

# Add header 
part.add_header(
    "Content-Disposition",
    f"attachment; filename= {filename}",
)

# Add attachment to your message and convert it to string
msg.attach(part)
text = msg.as_string()

msg.attach(text_message)

mailServer = smtplib.SMTP('mail.smtp2go.com', 2525) # 8025, 587 and 25 can also be used.
mailServer.ehlo()
mailServer.starttls()
mailServer.ehlo()
mailServer.login(username, password)
mailServer.sendmail(sender, recipient, msg.as_string())
mailServer.close()
