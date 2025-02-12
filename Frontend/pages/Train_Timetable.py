import csv
import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from streamlit_option_menu import option_menu
# from oct2py import Oct2Py
import pandas as pd
import os
# import Train_Timetable_config
import pages.Train_Timetable_config as Train_Timetable_config

from pages.reverseGradient import revGrad
from pages.reverseStoppage import revStoppage
from pages.reverseTrainLimits import revTrainLimits

# oc = Oct2Py() 
# oc.eval('cd("../train_timetable")') 

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
    # selected = option_menu(
    #     menu_title=None,
    #     options=["Forward", "Reverse"],
    #     icons=["arrow-right-square-fill", "arrow-left-square-fill"],  # https://icons.getbootstrap.com/
    #     orientation="horizontal",
    #     styles={    
    #     "nav-link": {"font-size": "20px", "text-align": "center", "margin":"0px", "--hover-color": "#ffffff"},
    #     "nav-link-selected": {"background-color": "#007BFF"},
    #     }   
    # )

    # st.write("hi")
    # Input fields for the variables
    Train_Timetable_config.M = st.number_input("Train Mass (in Ton)", value=826, min_value=1, step=1)
    Train_Timetable_config.g = st.number_input("Gravitational Acceleration (m/s^2)", value=9.81, min_value=0.1, step=0.01)
    Train_Timetable_config.delt = st.number_input("Simulation Time Step (sec)", value=1.0, min_value=0.1, step=0.1)  # Change value to float
    Train_Timetable_config.eff = st.number_input("Efficiency of Train", value=0.85, min_value=0.0, max_value=1.0, step=0.01)
    Train_Timetable_config.m_decl = st.number_input("Maximum Deceleration (m/s^2)", value=0.53, min_value=0.0, step=0.01)
    
    # Train resistance coefficients for E5 train
    Train_Timetable_config.a = st.number_input("Train Resistance Coefficient a", value=3.01, min_value=0.0, step=0.01)
    Train_Timetable_config.b = st.number_input("Train Resistance Coefficient b", value=0.0979, min_value=0.0, step=0.0001)
    Train_Timetable_config.c = st.number_input("Train Resistance Coefficient c", value=0.000938, min_value=0.0, step=0.000001)
    
    # Track Parameters
    Train_Timetable_config.max_speed = st.number_input("Maximum Speed (km/hr)", value=320.00, min_value=0.0, step=0.01)
    # Train_Timetable_config.dist = st.number_input("Total Track Length", value=320.00, min_value=0.0, step=0.01)

    # Let the user choose the direction from a dropdown
    direction = st.selectbox("Select Direction", ["Forward Direction", "Reverse Direction"])

    if direction == "Forward Direction":
        st.header("Forward Direction Uploads")
        
        train_operation_data = st.file_uploader(
            "Upload Forward Stoppage Data File (.xlsx)", 
            type="xlsx", 
            key="train_operation_data_forward"
        )
        if train_operation_data is not None:
            save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '../train_timetable')
            os.makedirs(save_directory, exist_ok=True)
            desired_filename = "stopage_data_train_time_rapid.csv"
            df = pd.read_excel(train_operation_data)
            csv_path = os.path.join(save_directory, desired_filename)
            # Save as CSV (comma-separated)
            df.to_csv(csv_path, index=False)  # index=False prevents adding an extra index column
            st.success("Forward stoppage data file saved as CSV.")

        speed_limit_data = st.file_uploader(
            "Upload Forward Speed Limit Data File (.xlsx)", 
            type="xlsx", 
            key="speed_limit_data_forward"
        )
        if speed_limit_data is not None:
            save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '../train_timetable')
            os.makedirs(save_directory, exist_ok=True)
            desired_filename = "track_speed_limit.csv"
            df = pd.read_excel(speed_limit_data)
            csv_path = os.path.join(save_directory, desired_filename)
            # Save as CSV (comma-separated)
            df.to_csv(csv_path, index=False)  # index=False prevents adding an extra index column
            st.success("Forward stoppage data file saved as CSV.")

        gradientData = st.file_uploader(
            "Upload Forward Gradient Data File (.xlsx)", 
            type="xlsx", 
            key="gradientData_forward"
        )
        if gradientData is not None:
            save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '../train_timetable')
            os.makedirs(save_directory, exist_ok=True)
            desired_filename = "gradient_data.csv"
            df = pd.read_excel(gradientData)
            csv_path = os.path.join(save_directory, desired_filename)
            # Save as CSV (comma-separated)
            df.to_csv(csv_path, index=False)  # index=False prevents adding an extra index column
            st.success("Forward stoppage data file saved as CSV.")

    elif direction == "Reverse Direction":
        st.header("Reverse Direction Uploads")
        
        train_operation_data = st.file_uploader(
            "Upload Reverse Stoppage Data File (.xlsx) - upload it first", 
            type="xlsx", 
            key="train_operation_data_reverse"
        )
        if train_operation_data is not None:
            save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '../train_timetable')
            os.makedirs(save_directory, exist_ok=True)
            desired_filename = "stopage_data_train_time_rapid.csv"
            df = pd.read_excel(train_operation_data)
            Train_Timetable_config.dist = df['Distance'].iloc[-1]
            csv_path = os.path.join(save_directory, desired_filename)
            # Save as CSV (comma-separated)
            df.to_csv(csv_path, index=False)  # index=False prevents adding an extra index column
            st.success("Forward stoppage data file saved as CSV.")

        speed_limit_data = st.file_uploader(
            "Upload Forward Speed Limit Data File (.xlsx)", 
            type="xlsx", 
            key="speed_limit_data_reverse"
        )
        if speed_limit_data is not None:
            save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '../train_timetable')
            os.makedirs(save_directory, exist_ok=True)
            desired_filename = "track_speed_limit.xlsx"
            filePath = os.path.join(save_directory, desired_filename)
            # Read the file into a DataFrame and process with revTrainLimits
            df = pd.read_excel(speed_limit_data)
            revTrainLimits(df, filePath, Train_Timetable_config.dist)
            st.success("Reverse speed limit data file processed and saved.")

        gradientData = st.file_uploader(
            "Upload Forward Gradient Data File (.xlsx)", 
            type="xlsx", 
            key="gradientData_reverse"
        )
        if gradientData is not None:
            save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '../train_timetable')
            os.makedirs(save_directory, exist_ok=True)
            desired_filename = "gradient_data.xlsx"
            filePath = os.path.join(save_directory, desired_filename)
            # Read the file into a DataFrame and process with revGrad
            df = pd.read_excel(gradientData)
            revGrad(df, Train_Timetable_config.dist, filePath)
            st.success("Reverse gradient data file processed and saved.")

    
    if st.button("Select Section"):
        if not os.path.exists('../train_timetable/stopage_data_train_time_rapid.csv') or not os.path.exists('../train_timetable/track_speed_limit.csv') or not os.path.exists('../train_timetable/gradient_data.csv'):
            st.warning("Please Upload All Files")
        else:
            st.switch_page("pages/Train_Timetable_Section.py")

if __name__ == "__main__":
    main()
    # Adding a styled back button
    st.markdown(
        f"""
        <a href="/Train_Timetable_Interface" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )


