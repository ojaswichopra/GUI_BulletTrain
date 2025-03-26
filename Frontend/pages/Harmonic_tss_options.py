import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from pages.harmonic_oTo_vars import harmonic_oTo_vars
from pages.harmonic_tTo_vars import harmonic_tTo_vars
import numpy as np
 
title = "Output Options"
page_icon = ":bullet_train:"  # emojis: https://www.webfx.com/tools/emoji-cheat-sheet/
layout = "centered"

selection = None
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
    

def load_oTo_workspace():
        # List of variable names to pull and read from text files
    variable_names = ['dTSS_T_up', 'dTSS_M_up', 'dTSS_T_down', 'dTSS_M_down', 'pTSS_T_up', 'pTSS_M_up', 'pTSS_T_down', 'pTSS_M_down', 'tTSS_T_up', 'tTSS_M_up', 'tTSS_T_down', 'tTSS_M_down', 'Vc_mag_Td', 'Vc_mag_Md', 'Vc_ang_Td', 'Vc_ang_Md', 'VR_mag_Td', 'Vf_mag_Td', 'VR_mag_Md', 'Vf_mag_Md', 'N_TSS', 'y', 'a1', 'a2', 'Ic_line_mag_Td_up', 'Ic_line_ang_Td_up', 'If_line_mag_Td_up', 'If_line_ang_Td_up', 'Ic_line_mag_Td_down', 'Ic_line_ang_Td_down', 'If_line_mag_Td_down', 'If_line_ang_Td_down', 'Ic_line_mag_Md_up', 'Ic_line_ang_Md_up', 'If_line_mag_Md_up', 'If_line_ang_Md_up', 'Ic_line_mag_Md_down', 'Ic_line_ang_Md_down', 'If_line_mag_Md_down', 'If_line_ang_Md_down', 'Vp']

    # Loop through each variable name
    for var in variable_names:
        
        ## Reading from text file - 
        harmonic_oTo_vars[var] = read_text_file(f'../oTo_double_text_files/{var}.txt')

def load_tTo_workspace():
        # List of variable names to pull and read from text files
    variable_names = []

    # Loop through each variable name
    for var in variable_names:
        harmonic_tTo_vars[var] = read_text_file(f'../tTo_double_text_files/{var}.txt')
        
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
    st.markdown("<h1 class='title'>Perform Harmonic Analysis - TSS Outage Condition</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    col1, col2 = st.columns(2)

    with col1:
        if st.button('One TSS Outage'):
            load_oTo_workspace()
            st.switch_page("pages/Harmonic_oTo.py")
    
    with col2:
        if st.button('Two Adjacent TSS Outage'):
            load_tTo_workspace()
            st.switch_page("pages/Harmonic_tTo.py")
            

if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/Harmonic_options" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )