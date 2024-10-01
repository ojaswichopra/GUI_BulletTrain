import os

# Path to the entry point of your Streamlit app
frontend_path = os.path.join(os.path.dirname(__file__), 'Frontend', 'Landing.py') 

# Use os.system to run the streamlit app
os.system(f"streamlit run {frontend_path}")
