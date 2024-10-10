import os
import sys
from streamlit.web import cli as stcli

if __name__ == "__main__":
    os.chdir(os.path.dirname(__file__))
    # Path to the entry point of your Streamlit app
    frontend_path = os.path.join(os.path.dirname(__file__), 'Frontend', 'Landing.py') 

    sys.argv = ["streamlit", "run", frontend_path, "--server.port=8501", "--global.developmentMode=false", \
                "--theme.base=light", "--theme.primaryColor=#10475a", "--theme.secondaryBackgroundColor=#f2f9f2"]

    stcli.main()