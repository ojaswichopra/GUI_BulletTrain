import os
import sys
# # Install required packages from requirements.txt
requirements_path = os.path.join(os.path.dirname(__file__), 'Frontend', 'requirements.txt')
os.system(f"pip install -r {requirements_path}")



# Path to the entry point of your Streamlit app
frontend_path = os.path.join(os.path.dirname(__file__), 'Frontend', 'Landing.py') 

# Use os.system to run the streamlit app
os.system(f"streamlit run {frontend_path} --server.headless=false --server.enableXsrfProtection=false --server.enableCORS=false")
