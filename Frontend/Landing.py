import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from oct2py import Oct2Py
import os
from pages.workspace import workspace_variables
import numpy as np
oc = Oct2Py() 
oc.eval('cd("../backend_codes")') 
    
def read_text_file(file_path):
    try:
        with open(file_path, 'r') as file:
            # Read the content of the file
            content = file.readlines()

        # Initialize variable
        result = None

        # Check if the file has content
        if not content:
            print("The file is empty.")
            return None

        # Process the content to determine its structure
        if len(content) == 1:  # Single line
            values = content[0].split()
            # Adjusted to handle negative values
            numeric_values = [float(v) for v in values if is_numeric(v)]

            if len(numeric_values) == 1:
                # Store as scalar
                result = numeric_values[0]
            else:
                # Store as 1D array
                result = np.array(numeric_values)

        else:  # Multiple lines
            array_2d = []
            for line in content:
                values = line.split()
                # Adjusted to handle negative values
                numeric_values = [float(v) for v in values if is_numeric(v)]

                if numeric_values:  # If there are numeric values
                    array_2d.append(numeric_values)

            if len(array_2d) == 1 and len(array_2d[0]) == 1:
                # Single value in a 2D structure
                result = array_2d[0][0]
            else:
                # Store as a 2D array
                result = np.array(array_2d)

        return result
    
    except FileNotFoundError:
        print("The specified file was not found.")
        return None
    except ValueError:
        print("Error converting values to numeric.")
        return None

# Helper function to check if a string can be converted to a float
def is_numeric(value):
    try:
        float(value)
        return True
    except ValueError:
        return False

title = "GUI Bullet Train"
page_icon = ":bullet_train:"  # emojis: https://www.webfx.com/tools/emoji-cheat-sheet/
layout = "centered"

selection = None


def load_workspace_variables():
    
    
    ## Reading using entire workspace - 20mins
    # oc.eval('load("variable_load_flow_mum_to_ahm_each_stop.mat")')
    
    ## Reading using necesaary files only - 8mins 
    # oc.eval('load("required_variable_load_flow_mum_to_ahm_each_stop.mat")')
    
    # List of variable names to pull and read from text files
    variable_names = [
        'AT_mva_mag', 'Unb', 's_apprant_power_MVA_mag', 'd', 'dTSS_T',
        'Ic_line_mag_Td', 'Ic_line_ang_Td', 'Ir_line_mag_Td', 'Ir_line_ang_Td',
        'If_line_mag_Td', 'If_line_ang_Td', 'Vc_mag_Td', 'Vc_ang_Td',
        'VR_mag_Td', 'VR_ang_Td', 'Vf_mag_Td', 'Vf_ang_Td', 'z1', 'y',
        'dTSS_M', 'Ic_line_mag_Md', 'Ic_line_ang_Md', 'Ir_line_mag_Md',
        'Ir_line_ang_Md', 'If_line_mag_Md', 'If_line_ang_Md', 'Vc_mag_Md',
        'Vc_ang_Md', 'VR_mag_Md', 'VR_ang_Md', 'Vf_mag_Md', 'Vf_ang_Md',
        'AT', 'train_data', 'dTSS', 'TSS'
    ]

    # Loop through each variable name
    for var in variable_names:
        # First, try pulling from the Octave workspace
        # workspace_variables[var] = oc.pull(var)
        
        ## Reading from text file - 
        workspace_variables[var] = read_text_file(f'../variable_text_files/{var}.txt')



def main():

    # Settings
    st.set_page_config(page_title=title, page_icon=page_icon, layout=layout)
    st.markdown(
        """
    <style>
        [data-testid="collapsedControl"] {
            display: none
        }
        .stButton button {
            width: 300px;
            height: 120px;
            background-color: #007BFF;
            color: white;
            font-size: 20px;
            border-radius: 8px;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .title {
            text-align: center;
        }
    </style>
    """,
        unsafe_allow_html=True,
    )

    
    st.markdown("<h1 class='title'>Indigenous Simulation Model for Design Validation of Traction Power Supply Network</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    col1, col2 = st.columns(2)

    with col1:
        if st.button('Make System Data'):
            st.switch_page("pages/Make_System_Data.py")
        if st.button('Execute Load Flow'):
            st.switch_page("pages/Execute_Load_Flow_Interface.py")
        if st.button('Perform Harmonic Analysis'):
            st.write("Button 1 clicked!")
        if st.button('Calculate Induced Voltage'):
            st.switch_page("pages/IVV_input.py")

    with col2:
        if st.button('Prepare Train Timetable'):
            st.switch_page("pages/Train_Timetable_Interface.py")
        if st.button('Perform Short Circuit Analysis'):
            st.switch_page("pages/SCA_execute_options.py")
        if st.button('Calculate OHE Temerature rise'):
            st.switch_page("pages/OHE_input.py")
        if st.button('See output'):
            st.switch_page("pages/Output_Options.py")



if __name__ == "__main__":
    main()
    # authenticated_menu()
