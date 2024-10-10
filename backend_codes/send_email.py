# send_email.py
import smtplib
from email.mime.text import MIMEText
import os
import sys
# Add the frontend directory to the sys.path
frontend_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '../Frontend'))
sys.path.insert(0, frontend_path)



from pages.Execute_Load_Flow import recipient
# print(dir(pages.Execute_Load_Flow))

def send_email():
    sender = "guibullettrain@gmail.com"
    password = "wgqd sqcp kkls fznl"
    smtp_server = "smtp.gmail.com"
    smtp_port = 587

    msg = MIMEText('Load Flow has been executed successfully. You can now see output of load flow.')
    msg["Subject"] = 'Load Flow Executed'
    msg["From"] = sender
    msg["To"] = recipient

    try:
        server = smtplib.SMTP(smtp_server, smtp_port)
        server.starttls()
        server.login(sender, password)
        server.sendmail(sender, recipient, msg.as_string())
        server.quit()
        print("Email sent successfully")
    except Exception as e:
        print(f"Error sending email: {e}")

if __name__ == "__main__":
    send_email()
