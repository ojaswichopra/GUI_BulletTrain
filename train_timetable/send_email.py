import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
import sys

# Check if section number argument was passed
if len(sys.argv) < 2:
    print("Section number not passed.")
    sys.exit(1)

# Extract section number
section_number = sys.argv[1]
print(f"Section number received: {section_number}")

# Read the recipient's email address
with open('../train_timetable/email.txt', 'r') as file:
    recipient = file.read().strip()

# Create the email
sender = "guibullettrain@gmail.com"
password = "wgqd sqcp kkls fznl"
smtp_server = "smtp.gmail.com"
smtp_port = 587

# Create a MIMEMultipart object (this allows us to add both text and file)
msg = MIMEMultipart()
msg['From'] = sender
msg['To'] = recipient
msg['Subject'] = 'Train Timetable Section Executed'

# Add text part
body = 'Train Timetable of the section has been executed successfully. Save the file for final compilation.'
msg.attach(MIMEText(body, 'plain'))

# Attach the file
file_path = f'../train_timetable/train_timetable_{section_number}.txt'
try:
    with open(file_path, 'rb') as attachment_file:
        # Create a MIMEBase object to represent the file attachment
        part = MIMEBase('application', 'octet-stream')
        part.set_payload(attachment_file.read())
        encoders.encode_base64(part)
        part.add_header('Content-Disposition', f'attachment; filename={file_path.split("/")[-1]}')
        
        # Attach the file to the email
        msg.attach(part)
except FileNotFoundError:
    print(f"Error: File {file_path} not found.")
    sys.exit(1)

# Send the email
try:
    server = smtplib.SMTP(smtp_server, smtp_port)
    server.starttls()
    server.login(sender, password)
    server.sendmail(sender, recipient, msg.as_string())
    server.quit()
    print("Email sent successfully")
except Exception as e:
    print(f"Error sending email: {e}")
