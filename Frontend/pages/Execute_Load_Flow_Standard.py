import os
import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from oct2py import Oct2Py
import multiprocessing
from pages.run_loadflow import *  # Import the backend function directly
import time


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
    lines = file_content.splitlines()

    # Dictionary to store the extracted data
    data = {}

    # Iterate over lines and extract data
    for i, line in enumerate(lines):
        # Extract single number values
        if "Number of TSS:" in line:
            data['num_tss'] = int(lines[i+1].strip())
        elif "Distance (in km) of all the TSSs" in line:
            data['tss_distances'] = eval(lines[i+1].strip())
        elif "Number of AT:" in line:
            data['num_at'] = int(lines[i+1].strip())
        elif "Distance (in km) of all the ATs" in line:
            data['at_distances'] = eval(lines[i+1].strip())
        elif "TSS primary voltage (Kv):" in line:
            data['tss_primary_voltage'] = float(lines[i+1].strip())
        elif "TSS secondary voltage (Kv):" in line:
            data['tss_secondary_voltage'] = float(lines[i+1].strip())
        elif "Primary side resistance (ohm):" in line:
            data['primary_resistance'] = float(lines[i+1].strip())
        elif "Primary side reactance (ohm):" in line:
            data['primary_reactance'] = float(lines[i+1].strip())
        elif "Secondary side resistance (ohm):" in line:
            data['secondary_resistance'] = float(lines[i+1].strip())
        elif "Secondary side reactance (ohm):" in line:
            data['secondary_reactance'] = float(lines[i+1].strip())
        elif "Rail Grounding impedance (ohm):" in line:
            data['rail_grounding_impedance'] = float(lines[i+1].strip())
        elif "TSS (source side) short circuit MVA:" in line:
            data['short_circuit_mva'] = float(lines[i+1].strip())
        elif "AT leakage resistance (ohm):" in line:
            data['at_leakage_resistance'] = float(lines[i+1].strip())
        elif "AT leakage reactance (ohm):" in line:
            data['at_leakage_reactance'] = float(lines[i+1].strip())
        elif "AT magnetising resistance (ohm):" in line:
            data['at_magnetising_resistance'] = float(lines[i+1].strip())
        elif "AT magnetising reactance (ohm):" in line:
            data['at_magnetising_reactance'] = float(lines[i+1].strip())
        elif "Homogenous earth conducting resistivity:" in line:
            data['earth_resistivity'] = float(lines[i+1].strip())
        elif "Frequency (Hz):" in line:
            data['frequency'] = float(lines[i+1].strip())
        elif "Number of conductors" in line:
            data['num_conductors'] = int(lines[i+1].strip())
        elif "Contact wire height (m) measured from rail:" in line:
            data['contact_wire_height'] = float(lines[i+1].strip())
        elif "Messenger wire height (m) measured from rail:" in line:
            data['messenger_wire_height'] = float(lines[i+1].strip())
        elif "Feeder wire height (m) measured from rail:" in line:
            data['feeder_wire_height'] = float(lines[i+1].strip())
        elif "Feeder wire distance (m) measured from centre (rail):" in line:
            data['feeder_wire_distance'] = float(lines[i+1].strip())
        elif "Earth (ground) wire height (m) measured from rail:" in line:
            data['earth_wire_height'] = float(lines[i+1].strip())
        elif "Earth (ground) wire distance (m) measured from centre (rail):" in line:
            data['earth_wire_distance'] = float(lines[i+1].strip())
        elif "Diameter (mm) of contact wire:" in line:
            data['contact_wire_diameter'] = float(lines[i+1].strip())
        elif "Resistance (ohm/km) of contact wire:" in line:
            data['contact_wire_resistance'] = float(lines[i+1].strip())
        elif "Diameter (mm) of messenger wire:" in line:
            data['messenger_wire_diameter'] = float(lines[i+1].strip())
        elif "Resistance (ohm/km) of messenger wire:" in line:
            data['messenger_wire_resistance'] = float(lines[i+1].strip())
        elif "Diameter (mm) of earth(ground) wire:" in line:
            data['earth_wire_diameter'] = float(lines[i+1].strip())
        elif "Resistance (ohm/km) of earth(ground) wire:" in line:
            data['earth_wire_resistance'] = float(lines[i+1].strip())
        elif "Diameter (mm) of feeder wire:" in line:
            data['feeder_wire_diameter'] = float(lines[i+1].strip())
        elif "Resistance (ohm/km) of feeder wire:" in line:
            data['feeder_wire_resistance'] = float(lines[i+1].strip())
        elif "Diameter (mm) of rail:" in line:
            data['rail_diameter'] = float(lines[i+1].strip())
        elif "Resistance (ohm/km) of rail:" in line:
            data['rail_resistance'] = float(lines[i+1].strip())

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
                padding: 10px 30px;
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

add_vertical_space(2)
# File uploads for system data and train timetable
system_data_file = st.file_uploader("Upload System Data File (.txt)", type="txt", key="system_data")
if system_data_file is not None:
    # Read the content of the file
    content = system_data_file.read().decode('utf-8')
    
    # Extract the data using the function
    extracted_data = extract_system_data(content)
    st.success(f"File saved.")
    
    
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

