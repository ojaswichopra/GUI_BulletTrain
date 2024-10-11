import os
import subprocess

# Path to the requirements.txt file
requirements_path = os.path.join(os.path.dirname(__file__), 'requirements.txt')

# Install the necessary dependencies
try:
    print("Installing dependencies from requirements.txt...")
    subprocess.check_call([os.sys.executable, "-m", "pip", "install", "-r", requirements_path])
    print("Dependencies installed successfully.")
except subprocess.CalledProcessError as e:
    print(f"Failed to install dependencies: {e}")
    exit(1)

# Path to the entry point of your Streamlit app
frontend_path = os.path.join(os.path.dirname(__file__), 'Frontend', 'Landing.py') 

# Use os.system to run the streamlit app
os.system(f"streamlit run {frontend_path}")
