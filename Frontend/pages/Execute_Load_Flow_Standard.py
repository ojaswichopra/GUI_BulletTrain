import os
import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from oct2py import Oct2Py
import multiprocessing
from pages.run_loadflow import *  # Import the backend function directly
import time
import pandas as pd  # Add this import for working with CSV files


def run_backend_process(extracted_data):
    # Run the backend function in a new process
    backend_process = multiprocessing.Process(
        target=run_load_flow_standard, args=(extracted_data,)
    )
    backend_process.start()
    
def initialize_progress():
    progress_file = '../EN-50641/progress_file.txt'
    # Overwrite the file with '0.0' regardless of its state
    with open(progress_file, 'w') as f:
        f.write('0.0')  # Write 0.0 as the initial value

def read_progress():
    progress_file = '../EN-50641/progress_file.txt'
    if os.path.exists(progress_file):
        with open(progress_file, 'r') as f:
            content = f.read().strip()  # Read and strip whitespace
            if content:  # Check if content is not empty
                return content  # Convert to float if not empty
            else:
                return 0.0  # Return 0.0 if the content is empty
    return 0.0  # Return 0.0 if the file doesn't exist


# Define the path to your system data file
file_path = "system data file.txt"


def extract_system_data(file_content):
    """
    Extracts system data from the content of a .txt file and returns it as a dictionary.
    
    Parameters:
    file_content (str): The content of the uploaded .txt file.
    
    Returns:
    dict: A dictionary containing the extracted system data.
    """
    # Split the content into lines
    # Read the CSV content into a pandas DataFrame
    df = pd.read_csv(file_content)
    # Convert the DataFrame to a dictionary for easier access
    data_dict = df.set_index('Name')['Value'].to_dict()
    
    # Extract data into a structured format
    tss_distances_raw = data_dict.get('Distance (in km) of all the TSSs measured from the starting point:', '')
    at_distances_raw = data_dict.get('Distance (in km) of all the ATs measured from the starting point:', '')
    data = {
        'num_tss': int(data_dict.get('Number of TSS:', 0)),
        'tss_distances': [float(x) for x in tss_distances_raw.split()] if tss_distances_raw else [],
        'num_at': int(data_dict.get('Number of AT:', 0)),
        'at_distances': [float(x) for x in at_distances_raw.split()] if at_distances_raw else [],
        'tss_primary_voltage': float(data_dict.get('TSS primary voltage (Kv):', 0)),
        'tss_secondary_voltage': float(data_dict.get('TSS secondary voltage (Kv):', 0)),
        'primary_resistance': float(data_dict.get('Primary side resistance (ohm):', 0)),
        'primary_reactance': float(data_dict.get('Primary side reactance (ohm):', 0)),
        'secondary_resistance': float(data_dict.get('Secondary side resistance (ohm):', 0)),
        'secondary_reactance': float(data_dict.get('Secondary side reactance (ohm):', 0)),
        'rail_grounding_impedance': float(data_dict.get('Rail Grounding impedance (ohm):', 0)),
        'short_circuit_mva': float(data_dict.get('TSS (source side) short circuit MVA:', 0)),
        'at_leakage_resistance': float(data_dict.get('AT leakage resistance (ohm):', 0)),
        'at_leakage_reactance': float(data_dict.get('AT leakage reactance (ohm):', 0)),
        'at_magnetising_resistance': float(data_dict.get('AT magnetising resistance (ohm):', 0)),
        'at_magnetising_reactance': float(data_dict.get('AT magnetising reactance (ohm):', 0)),
        'earth_resistivity': float(data_dict.get('Homogenous earth conducting resistivity:', 0)),
        'frequency': float(data_dict.get('Frequency (Hz):', 0)),
        'num_conductors': int(data_dict.get('Number of conductors:', 0)),
        'contact_wire_height': float(data_dict.get('Contact wire height (m) measured from rail:', 0)),
        'messenger_wire_height': float(data_dict.get('Messenger wire height (m) measured from rail:', 0)),
        'feeder_wire_height': float(data_dict.get('Feeder wire height (m) measured from rail:', 0)),
        'feeder_wire_distance': float(data_dict.get('Feeder wire distance (m) measured from centre (rail):', 0)),
        'earth_wire_height': float(data_dict.get('Earth (ground) wire height (m) measured from rail:', 0)),
        'earth_wire_distance': float(data_dict.get('Earth (ground) wire distance (m) measured from centre (rail):', 0)),
        'contact_wire_diameter': float(data_dict.get('Diameter (mm) of contact wire:', 0)),
        'contact_wire_resistance': float(data_dict.get('Resistance (ohm/km) of contact wire:', 0)),
        'messenger_wire_diameter': float(data_dict.get('Diameter (mm) of messenger wire:', 0)),
        'messenger_wire_resistance': float(data_dict.get('Resistance (ohm/km) of messenger wire:', 0)),
        'earth_wire_diameter': float(data_dict.get('Diameter (mm) of earth(ground) wire:', 0)),
        'earth_wire_resistance': float(data_dict.get('Resistance (ohm/km) of earth(ground) wire:', 0)),
        'feeder_wire_diameter': float(data_dict.get('Diameter (mm) of feeder wire:', 0)),
        'feeder_wire_resistance': float(data_dict.get('Resistance (ohm/km) of feeder wire:', 0)),
        'rail_diameter': float(data_dict.get('Diameter (mm) of rail:', 0)),
        'rail_resistance': float(data_dict.get('Resistance (ohm/km) of rail:', 0)),
    }
    return data


# def main():
st.markdown(
    """
<style>
    [data-testid="collapsedControl"] {
        display: none
    }
    .title {
        text-align: center;
    }
    .custom-button {
                display: inline-block;
                text-decoration: none;
                padding: 4px 16px;
                font-size: 20px;
                color: #007BFF;
                border: 2px solid #007BFF; /* Adding a white border */
                border-radius: 8px;
                transition: background-color 0.3s ease;
                text-align: center;
                margin: 10px 0;
            }
</style>
""",
    unsafe_allow_html=True,
)

st.markdown("<h1 class='title'>Execute EN-50641 Standard Validation Load Flow</h1>", unsafe_allow_html=True)

add_vertical_space(1)
# File uploads for system data and train timetable
system_data_file = st.file_uploader("Upload System Data File (.csv)", type="csv", key="system_data")
if system_data_file is not None:
    # Extract data from the uploaded CSV file
    extracted_data = extract_system_data(system_data_file)
    st.success(f"File saved.")
    # print(extracted_data)
    
    
timetable_file_HS_AF = st.file_uploader("Upload the timetable of the high-speed (HS) train running from station A to F (.txt)", type="txt")

if timetable_file_HS_AF is not None:
    save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)),'..',  '../EN-50641')

    # Create the directory if it doesn't exist
    os.makedirs(save_directory, exist_ok=True)
    desired_filename = "train_timetable_HS_AF.txt"
    # Step 4: Save the file in the backend folder
    with open(os.path.join(save_directory, desired_filename), "wb") as f:
        f.write(timetable_file_HS_AF.getbuffer())
        
    st.success(f"File saved.")
    

timetable_file_HS_FA = st.file_uploader("Upload the timetable of the high-speed (HS) train running from station F to A (.txt)", type="txt")

if timetable_file_HS_FA is not None:
    save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)),'..',  '../EN-50641')

    # Create the directory if it doesn't exist
    os.makedirs(save_directory, exist_ok=True)
    desired_filename = "train_timetable_HS_FA.txt"
    # Step 4: Save the file in the backend folder
    with open(os.path.join(save_directory, desired_filename), "wb") as f:
        f.write(timetable_file_HS_FA.getbuffer())
        
    st.success(f"File saved.")

timetable_file_SUB_AF = st.file_uploader("UUpload the timetable of the sub-urban (SUB) train running from station A to F  (.txt)", type="txt")

if timetable_file_SUB_AF is not None:
    save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)),'..',  '../EN-50641')

    # Create the directory if it doesn't exist
    os.makedirs(save_directory, exist_ok=True)
    desired_filename = "train_timetable_SUB_AF.txt"
    # Step 4: Save the file in the backend folder
    with open(os.path.join(save_directory, desired_filename), "wb") as f:
        f.write(timetable_file_SUB_AF.getbuffer())
        
    st.success(f"File saved.")

timetable_file_FR_AF = st.file_uploader("Upload the timetable of the freight (FR) train running from station A to F  (.txt)", type="txt")

if timetable_file_FR_AF is not None:
    save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)),'..',  '../EN-50641')

    # Create the directory if it doesn't exist
    os.makedirs(save_directory, exist_ok=True)
    desired_filename = "train_timetable_FR_AF.txt"
    # Step 4: Save the file in the backend folder
    with open(os.path.join(save_directory, desired_filename), "wb") as f:
        f.write(timetable_file_FR_AF.getbuffer())
        
    st.success(f"File saved.")


if st.button("Submit"):

    if not system_data_file or not timetable_file_HS_AF or not timetable_file_HS_FA or not timetable_file_SUB_AF or not timetable_file_FR_AF:
            st.warning("Please provide all the inputs correctly!")
    else:
        # Perform the load flow calculations here
        run_backend_process(extracted_data)
        st.success("Load Flow Initiated!!")

        # Progress bar
        progress_bar = st.progress(0)
        initialize_progress()
        # Continuously check for progress
        while True:
            progress = read_progress()
            progress_bar.progress(float(progress)/100)  # Update the progress bar
            print("here",progress)
            if float(progress) >= 100:
                st.success("Load Flow executed successfully!")
                break
            time.sleep(10)  # Sleep for a second before checking again

# if st.button("Back"):
#     st.switch_page("pages/Execute_Load_Flow_Interface.py")
st.markdown(
    f"""
    <a href="/Execute_Load_Flow_Interface" target="_self" class="custom-button">Back</a>
    """,
    unsafe_allow_html=True
)

