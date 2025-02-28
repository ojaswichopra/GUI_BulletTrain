import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from pages.normal_workspace import normal_variables
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
    
def load_normal_workspace():
        # List of variable names to pull and read from text files
    variable_names = [
        'rad_C', 'rad_R1', 'rad_F', 'rad_M1', 'rad_G', 'Resistance_C', 'Resistance_R1', 'Resistance_F', 'Resistance_M1', 'Resistance_G', 'Ch', 'nFd', 'nFh', 'Mh', 'gd', 'gh', 'freq', 'row', 'Ic_line_mag_Td_up', 'Ir_line_mag_Td_up', 'If_line_mag_Td_up', 'Ic_line_mag_Md_up', 'Ir_line_mag_Md_up', 'If_line_mag_Md_up', 'Ic_line_ang_Td_up', 'Ir_line_ang_Td_up', 'If_line_ang_Td_up', 'Ic_line_ang_Md_up', 'Ir_line_ang_Md_up', 'If_line_ang_Md_up', 'Ic_line_mag_Td_down', 'Ir_line_mag_Td_down', 'If_line_mag_Td_down', 'Ic_line_mag_Md_down', 'Ir_line_mag_Md_down', 'If_line_mag_Md_down', 'Ic_line_ang_Td_down', 'Ir_line_ang_Td_down', 'If_line_ang_Td_down', 'Ic_line_ang_Md_down', 'Ir_line_ang_Md_down', 'If_line_ang_Md_down', 'y', 'N_TSS', 'd']

    # Loop through each variable name
    for var in variable_names:
        # First, try pulling from the Octave workspace
        # workspace_variables[var] = oc.pull(var)
        
        ## Reading from text file - 
        normal_variables[var] = read_text_file(f'../normal_text_files/{var}.txt')

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
    st.markdown("<h1 class='title'>Calculate Induced Voltage</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    col1, col2 = st.columns(2)

    with col1:
        if st.button('Normal Condition'):
            load_normal_workspace()
            st.switch_page("pages/IVV_normal.py")
    
    with col2:
        if st.button('TSS Outage Condition'):
            st.switch_page("pages/IVV_tss_options.py")
            

if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/IVV_input" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )