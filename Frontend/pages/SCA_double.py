import os
import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from PIL import Image
import multiprocessing
from pages.run_loadflow import run_short_circuit_double  # Import the backend function directly
import pandas as pd

def run_backend_process(extracted_data,  time_instant_short, total_distance_from_start_point, fault_type, Z_fault, track_up_down):
    # Run the backend function in a new process
    # backend_process = multiprocessing.Process(
    #     target=run_short_circuit, args=(extracted_data, N, N_hr, train_time, time_instant_short, total_distance_from_start_point, fault_type, Z_fault)
    # )
    # backend_process.start()
    run_short_circuit_double(extracted_data, time_instant_short, total_distance_from_start_point, fault_type, Z_fault, track_up_down)
    st.success("Short Circuit Analysis Completed!!")
    # if st.button('See Output'):
    # st.switch_page('pages/SCA_output.py')   
    
    
def count_rows_columns(file_path):
    with open(file_path, 'r') as file:
        # Read the lines of the file
        lines = file.readlines()

        # The number of rows is the number of data lines (excluding the header)
        num_rows = len(lines) - 1

        # Split the header line to determine the number of columns
        num_columns = len(lines[0].split())

    return num_rows, num_columns


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
    sp_distances_raw = data_dict.get('Distance (in km) of all the Section Posts (SPs) measured from the starting point:', '')
    data = {
        'tss_distances': [float(x) for x in tss_distances_raw.split()] if tss_distances_raw else [],
        'at_distances': [float(x) for x in at_distances_raw.split()] if at_distances_raw else [],
        'sp_distances': [float(x) for x in sp_distances_raw.split()] if at_distances_raw else [],
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
        'num_conductors': int(data_dict.get('Number of conductors (contact, rail, feeder, messenger, earth):', 0)),
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

st.markdown("<h1 class='title'>Perform Short Circuit Analysis</h1>", unsafe_allow_html=True)

add_vertical_space(1)
# File uploads for system data and train timetable
system_data_file = st.file_uploader("Upload System Data File (.csv)", type="csv", key="system_data")
if system_data_file is not None:
    # Extract data from the uploaded CSV file
    extracted_data = extract_system_data(system_data_file)
    st.success(f"File saved.")
    # print(extracted_data)

timetable_file_1 = st.file_uploader("Upload Up Track Each Stop Train Timetable (.txt)", type="txt")
if timetable_file_1 is not None:
    save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)),'..',  '../short_circuit_double_track')

    # Create the directory if it doesn't exist
    os.makedirs(save_directory, exist_ok=True)
    desired_filename = "Mumbai_Sabarmati_each_stop_train_schedule (up_track).txt"
    # Step 4: Save the file in the backend folder
    with open(os.path.join(save_directory, desired_filename), "wb") as f:
        f.write(timetable_file_1.getbuffer())
    st.success(f"File saved.")
    
timetable_file_2 = st.file_uploader("Upload Up Track Rapid Train Timetable (.txt)", type="txt")
if timetable_file_2 is not None:
    save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)),'..',  '../short_circuit_double_track')

    # Create the directory if it doesn't exist
    os.makedirs(save_directory, exist_ok=True)
    desired_filename = "Mumbai_Sabarmati_rapid_train_schedule (up_track).txt"
    # Step 4: Save the file in the backend folder
    with open(os.path.join(save_directory, desired_filename), "wb") as f:
        f.write(timetable_file_2.getbuffer())
        
    st.success(f"File saved.")

timetable_file_3 = st.file_uploader("Upload Down Track Each Stop Train Timetable (.txt)", type="txt")
if timetable_file_3 is not None:
    save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)),'..',  '../short_circuit_double_track')

    # Create the directory if it doesn't exist
    os.makedirs(save_directory, exist_ok=True)
    desired_filename = "Sabarmati_Mumbai_each_stop_train_schedule (down_track).txt"
    # Step 4: Save the file in the backend folder
    with open(os.path.join(save_directory, desired_filename), "wb") as f:
        f.write(timetable_file_3.getbuffer())
        
    st.success(f"File saved.")
    
timetable_file_4 = st.file_uploader("Upload Down Track Rapid Train Timetable (.txt)", type="txt")
if timetable_file_4 is not None:
    save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)),'..',  '../short_circuit_double_track')

    # Create the directory if it doesn't exist
    os.makedirs(save_directory, exist_ok=True)
    desired_filename = "Sabarmati_Mumbai_rapid_train_schedule (down_track).txt"
    # Step 4: Save the file in the backend folder
    with open(os.path.join(save_directory, desired_filename), "wb") as f:
        f.write(timetable_file_4.getbuffer())
        
    st.success(f"File saved.")
    
chart = st.file_uploader("Upload Train Simulation Chart (.csv)", type="csv")
if chart is not None:
    save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)),'..',  '../short_circuit_double_track')

    # Create the directory if it doesn't exist
    os.makedirs(save_directory, exist_ok=True)
    desired_filename = "train simulation chart.csv"
    # Step 4: Save the file in the backend folder
    with open(os.path.join(save_directory, desired_filename), "wb") as f:
        f.write(chart.getbuffer())
        
    st.success(f"File saved.")



total_distance_from_start_point= st.number_input('Enter the distance(in Km) from starting point at which short circuit occurs', min_value=0)
time_instant_short = st.number_input('Enter the time instant (in sec) at which the short circuit occurs at the entered location', min_value=0)
fault_type_text = st.selectbox(
    "Select Fault Type",
    ("CR fault", "RF fault", "CF fault", "CRF fault"),
)

fault_type_mapping = {
    "CR fault": 1,
    "RF fault": 2,
    "CF fault": 3,
    "CRF fault": 4,
}

fault_type = fault_type_mapping[fault_type_text]
Z_fault=st.number_input('Enter the fault resistance in ohm', min_value=0)

direction = st.radio("Select direction of track short circuit", ('UP', 'DOWN'))

if(direction == "UP"):
    track_up_down = 1
else:
    track_up_down = 2

if st.button("Submit"):
    if not system_data_file or not timetable_file_1 or not timetable_file_2 or not timetable_file_3 or not timetable_file_4 or not chart or time_instant_short<=0 or total_distance_from_start_point<=0 or fault_type<=0 or Z_fault<0:
        st.warning("Please provide all the inputs correctly!")
    else:
        st.success("Short Circuit Analysis Initiated!!")
        run_backend_process(extracted_data, time_instant_short, total_distance_from_start_point, fault_type, Z_fault, track_up_down)




st.markdown(
        f"""
        <a href="/" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
