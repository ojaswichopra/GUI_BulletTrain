import csv
import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from streamlit_option_menu import option_menu
from oct2py import Oct2Py
import pandas as pd
import os
oc = Oct2Py() 
oc.eval('cd("../train_timetable")') 

# Function to adjust distances relative to station B and filter rows within track length
def adjust_and_filter(data, track_length):
    adjusted_data = []
    for _, row in data.iterrows():
        new_start = max(0, track_length - row['limit_end'])
        new_end = max(0, track_length - row['limit_start'])
        
        # Adjust rows exceeding track length
        if new_start == 0 and new_end == 0:
            continue
        if new_end > track_length:
            new_end = track_length
        adjusted_data.append({
            'limit_start_from_B': new_start,
            'limit_end_from_B': new_end,
            'limit_speed': row['limit_speed']
        })
    adjusted_df = pd.DataFrame(adjusted_data)
    return adjusted_df.sort_values(by='limit_start_from_B').reset_index(drop=True)

def main():

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

    st.markdown("<h1 class='title'>Prepare Train Timetable</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    # --- NAVIGATION MENU ---
    selected = option_menu(
        menu_title=None,
        options=["Forward Direction", "Reverse Direction"],
        icons=["arrow-right-square-fill", "arrow-left-square-fill"],  # https://icons.getbootstrap.com/
        orientation="horizontal",
        styles={    
        "nav-link": {"font-size": "20px", "text-align": "center", "margin":"0px", "--hover-color": "#ffffff"},
        "nav-link-selected": {"background-color": "#007BFF"},
        }   
    )

    # st.write("hi")
    # Input fields for the variables
    M = st.number_input("Train Mass (in Ton)", value=826, min_value=1, step=1)
    g = st.number_input("Gravitational Acceleration (m/s^2)", value=9.81, min_value=0.1, step=0.01)
    delt = st.number_input("Simulation Time Step (sec)", value=1.0, min_value=0.1, step=0.1)  # Change value to float
    eff = st.number_input("Efficiency of Train", value=0.85, min_value=0.0, max_value=1.0, step=0.01)
    m_decl = st.number_input("Maximum Deceleration (m/s^2)", value=0.53, min_value=0.0, step=0.01)
    
    # Train resistance coefficients for E5 train
    a = st.number_input("Train Resistance Coefficient a", value=3.01, min_value=0.0, step=0.01)
    b = st.number_input("Train Resistance Coefficient b", value=0.0979, min_value=0.0, step=0.0001)
    c = st.number_input("Train Resistance Coefficient c", value=0.000938, min_value=0.0, step=0.000001)
    
    # Track Parameters
    max_speed = st.number_input("Maximum Speed (km/hr)", value=320.00, min_value=0.0, step=0.01)
    dist = st.number_input("Total Track Length", value=320.00, min_value=0.0, step=0.01)
    
    if selected == "Forward Direction":
        train_operation_data = st.file_uploader("Upload Forward Stoppage Data File (.xlsx)", type="xlsx", key="train_operation_data")
        if train_operation_data is not None:
            # Extract data from the uploaded CSV file
            # extracted_data = extract_system_data(system_data_file)
            save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)),'..',  '../train_timetable')
            os.makedirs(save_directory, exist_ok=True)
            desired_filename = "stopage_data_train_time_rapid.xlsx"
            # Step 4: Save the file in the backend folder
            with open(os.path.join(save_directory, desired_filename), "wb") as f:
                f.write(train_operation_data.getbuffer())
            
            st.success(f"File saved.")
        
        speed_limit_data = st.file_uploader("Upload Forward Speed Limit Data File (.xlsx)", type="xlsx", key="speed_limit_data")
        if speed_limit_data is not None:
            # Extract data from the uploaded CSV file
            # extracted_data = extract_system_data(system_data_file)
            save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)),'..',  '../train_timetable')
            os.makedirs(save_directory, exist_ok=True)
            desired_filename = "track_speed_limit.xlsx"
            # Step 4: Save the file in the backend folder
            with open(os.path.join(save_directory, desired_filename), "wb") as f:
                f.write(speed_limit_data.getbuffer())
            st.success(f"File saved.")    
            
        
        gradientData = st.file_uploader("Upload Forward Gradient Data File (.xlsx)", type="xlsx", key="gradientData")
        if gradientData is not None:
            # Extract data from the uploaded CSV file
            # extracted_data = extract_system_data(system_data_file)
            save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)),'..',  '../train_timetable')
            os.makedirs(save_directory, exist_ok=True)
            desired_filename = "gradient_data.xlsx"
            # Step 4: Save the file in the backend folder
            with open(os.path.join(save_directory, desired_filename), "wb") as f:
                f.write(gradientData.getbuffer())
            st.success(f"File saved.")    
        
        
    if selected == "Reverse Direction":
        train_operation_data = st.file_uploader("Upload Reverse Stoppage Data File (.xlsx)", type="xlsx", key="train_operation_data")
        if train_operation_data is not None:
            # Extract data from the uploaded CSV file
            # extracted_data = extract_system_data(system_data_file)
            save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)),'..',  '../train_timetable')
            os.makedirs(save_directory, exist_ok=True)
            desired_filename = "stopage_data_train_time_rapid.xlsx"
            # Step 4: Save the file in the backend folder
            with open(os.path.join(save_directory, desired_filename), "wb") as f:
                f.write(train_operation_data.getbuffer())
            st.success(f"File saved.")
            
        speed_limit_data = st.file_uploader("Upload Forward Speed Limit Data File (.xlsx)", type="xlsx", key="speed_limit_data")
        if speed_limit_data is not None:
            # Extract data from the uploaded CSV file
            # extracted_data = extract_system_data(system_data_file)
            save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)),'..',  '../train_timetable')
            os.makedirs(save_directory, exist_ok=True)
            desired_filename = "track_speed_limit.xlsx"
            # Step 4: Save the file in the backend folder
            with open(os.path.join(save_directory, desired_filename), "wb") as f:
                f.write(speed_limit_data.getbuffer())
        
            st.success(f"File saved.")    
            
        
        gradientData = st.file_uploader("Upload Forward Gradient Data File (.xlsx)", type="xlsx", key="gradientData")
        if gradientData is not None:
            # Extract data from the uploaded CSV file
            # extracted_data = extract_system_data(system_data_file)
            save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)),'..',  '../train_timetable')
            os.makedirs(save_directory, exist_ok=True)
            desired_filename = "gradient_data.xlsx"
            # Step 4: Save the file in the backend folder
            with open(os.path.join(save_directory, desired_filename), "wb") as f:
                f.write(gradientData.getbuffer())
            st.success(f"File saved.")
    
    if st.button("Submit"):
        oc.eval(f"train_sheduling_program_code({M}, {g}, {delt}, {eff}, {m_decl}, {a}, {b}, {c}, {max_speed})")


if __name__ == "__main__":
    main()


