import os
import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from PIL import Image
import multiprocessing
from pages.run_loadflow import run_short_circuit  # Import the backend function directly

def run_backend_process(extracted_data, N, N_hr, train_time, time_instant_short, total_distance_from_start_point, fault_type, Z_fault):
    # Run the backend function in a new process
    # backend_process = multiprocessing.Process(
    #     target=run_short_circuit, args=(extracted_data, N, N_hr, train_time, time_instant_short, total_distance_from_start_point, fault_type, Z_fault)
    # )
    # backend_process.start()
    run_short_circuit(extracted_data, N, N_hr, train_time, time_instant_short, total_distance_from_start_point, fault_type, Z_fault)
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

st.markdown("<h1 class='title'>Perform Short Circuit Analysis</h1>", unsafe_allow_html=True)

add_vertical_space(2)
# File uploads for system data and train timetable
system_data_file = st.file_uploader("Upload System Data File (.txt)", type="txt", key="system_data")
if system_data_file is not None:
    # Read the content of the file
    content = system_data_file.read().decode('utf-8')
    
    # Extract the data using the function
    extracted_data = extract_system_data(content)
    st.success(f"File saved.")
    

timetable_file = st.file_uploader("Upload Train Timetable (.txt)", type="txt")
train_time = 0
print(train_time)
if timetable_file is not None:
    save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)),'..',  '../short_circuit_analysis')

    # Create the directory if it doesn't exist
    os.makedirs(save_directory, exist_ok=True)
    desired_filename = "train_timetable.txt"
    # Step 4: Save the file in the backend folder
    with open(os.path.join(save_directory, desired_filename), "wb") as f:
        f.write(timetable_file.getbuffer())
        
    st.success(f"File saved.")


# Input fields for other parameters
N = st.number_input("Enter the number of trains running per hour", min_value=0)
N_hr = st.number_input("Enter the number of hours of train scheduling per day", min_value=0)
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

if st.button("Submit"):
    # Check if the file exists
    if os.path.exists('../short_circuit_analysis/train_timetable.txt'):
        # If the file exists, proceed with the operation
        train_time, _ = count_rows_columns('../short_circuit_analysis/train_timetable.txt')
        print(f"Train time: {train_time}")
    print(train_time)
    if not system_data_file or not timetable_file or N <= 0 or N_hr <= 0 or train_time <= 0 or time_instant_short<=0 or total_distance_from_start_point<=0 or fault_type<=0 or Z_fault<0:
            st.warning("Please provide all the inputs correctly!")
    else:
        
        st.success("Short Circuit Analysis Initiated!!")
        run_backend_process(extracted_data, N, N_hr, train_time, time_instant_short, total_distance_from_start_point, fault_type, Z_fault)

    
# if st.button("Back"):
#     st.switch_page("Landing.py")
st.markdown(
        f"""
        <a href="/Landing" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
