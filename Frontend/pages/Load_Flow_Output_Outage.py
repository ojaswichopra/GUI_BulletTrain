import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
import numpy as np
from pages.oTo_Workspace import oTo_workspace
from pages.tTo_Workspace import tTo_workspace
from pages.oTo_double_Workspace import oTo_double_workspace
from pages.tTo_double_Workspace import tTo_double_workspace

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
    
    
    ## Reading using entire workspace - 20mins
    # oc.eval('load("variable_load_flow_mum_to_ahm_each_stop.mat")')
    
    ## Reading using necesaary files only - 8mins 
    # oc.eval('load("required_variable_load_flow_mum_to_ahm_each_stop.mat")')
    
    # List of variable names to pull and read from text files
    variable_names = [
        'dTSS','dTSS_T','TSS','d','y','Vc_mag_Td','Vc_ang_Td','VR_mag_Td','VR_ang_Td',
        'Vf_mag_Td','Vf_ang_Td','dTSS_T','Ic_line_mag_Td','Ic_line_ang_Td','Ir_line_mag_Td',
        'Ir_line_ang_Td','If_line_mag_Td','If_line_ang_Td','Vc_mag_Md','Vc_ang_Md','VR_mag_Md',
        'VR_ang_Md', 'Vf_mag_Md','Vf_ang_Md', 'dTSS_M','Ic_line_mag_Md','Ic_line_ang_Md',
        'Ir_line_mag_Md','Ir_line_ang_Md', 'If_line_mag_Md','If_line_ang_Md','each_stop_train_data',
        'AT', 'Unb','s_apprant_power_MVA_mag','N_TSS_O','N_TSS','N_hr','N_train_per_hour',
        'Mva_sec_abs', 'tt_time'
    ]

    # Loop through each variable name
    for var in variable_names:        
        ## Reading from text file - 
        oTo_workspace[var] = read_text_file(f'../oTo_text_files/{var}.txt')

def load_tTo_workspace():
    tTo_variable_names = [
        'dTSS','dTSS_T','TSS','d','y','Vc_mag_Td','Vc_ang_Td','VR_mag_Td','VR_ang_Td','Vf_mag_Td','Vf_ang_Td',
        'Ic_line_mag_Td','Ic_line_ang_Td','Ir_line_mag_Td','Ir_line_ang_Td','If_line_mag_Td','If_line_ang_Td',
        'Vc_mag_Md','Vc_ang_Md','VR_mag_Md','VR_ang_Md','Vf_mag_Md','Vf_ang_Md','dTSS_M','Ic_line_mag_Md','Ic_line_ang_Md',
        'Ir_line_mag_Md','Ir_line_ang_Md','If_line_mag_Md','If_line_ang_Md','each_stop_train_data','AT','Unb','s_apprant_power_MVA_mag',
        'N_TSS_O','N_TSS','N_hr','N_train_per_hour','Mva_sec_abs','tt_time'
    ]

    for var in tTo_variable_names:        
        ## Reading from text file - 
        tTo_workspace[var] = read_text_file(f'../tTo_text_files/{var}.txt')

def load_oTo_double_workspace():
    oTo_double_var_names = [
        'N_TSS_O', 'N_TSS', 'tt_time', 'dTSS_up', 'dTSS_down', 'dTSS_T_up', 'dTSS_T_down', 'dTSS_M_up', 'dTSS_M_down', 'TSS', 'd', 'y', 'Vc_mag_Td_down', 'Vc_ang_Td_down', 'VR_mag_Td_down', 'VR_ang_Td_down', 'Vf_mag_Td_down', 'Vf_ang_Td_down', 'Vc_mag_Td_up', 'Vc_ang_Td_up', 'VR_mag_Td_up', 'VR_ang_Td_up', 'Vf_mag_Td_up', 'Vf_ang_Td_up', 'Ic_line_mag_Td_up', 'Ic_line_ang_Td_up', 'Ir_line_mag_Td_up', 'Ir_line_ang_Td_up', 'If_line_mag_Td_up', 'If_line_ang_Td_up', 'Ic_line_mag_Td_down', 'Ic_line_ang_Td_down', 'Ir_line_mag_Td_down', 'Ir_line_ang_Td_down', 'If_line_mag_Td_down', 'If_line_ang_Td_down', 'z1', 'Vc_mag_Md_up', 'Vc_ang_Md_up', 'VR_mag_Md_up', 'VR_ang_Md_up', 'Vf_mag_Md_up', 'Vf_ang_Md_up', 'Vc_mag_Md_down', 'Vc_ang_Md_down', 'VR_mag_Md_down', 'VR_ang_Md_down', 'Vf_mag_Md_down', 'Vf_ang_Md_down', 'Ic_line_mag_Md_up', 'Ic_line_ang_Md_up', 'Ir_line_mag_Md_up', 'Ir_line_ang_Md_up', 'If_line_mag_Md_up', 'If_line_ang_Md_up', 'Ic_line_mag_Md_down', 'Ic_line_ang_Md_down', 'Ir_line_mag_Md_down', 'Ir_line_ang_Md_down', 'If_line_mag_Md_down', 'If_line_ang_Md_down', 'AT_mva_mag_up', 'AT_mva_mag_down', 'AT', 'Unb', 's_apprant_power_MVA_mag', 'train_number', 'track_type', 'train_type', 'start_time', 'each_stop_train_data_up', 'rapid_train_data_up', 'each_stop_train_data_down', 'rapid_train_data_down', 'track_length'
    ]
    for var in oTo_double_var_names:        
        ## Reading from text file - 
        oTo_double_workspace[var] = read_text_file(f'../oTo_double_text_files/{var}.txt')

def load_tTo_double_workspace():
    tTo_double_var_names = [
        'N_TSS_O', 'N_TSS', 'tt_time', 'dTSS_up', 'dTSS_down', 'dTSS_T_up', 'dTSS_T_down', 'dTSS_M_up', 'dTSS_M_down', 'TSS', 'd', 'y', 'Vc_mag_Td_down', 'Vc_ang_Td_down', 'VR_mag_Td_down', 'VR_ang_Td_down', 'Vf_mag_Td_down', 'Vf_ang_Td_down', 'Vc_mag_Td_up', 'Vc_ang_Td_up', 'VR_mag_Td_up', 'VR_ang_Td_up', 'Vf_mag_Td_up', 'Vf_ang_Td_up', 'Ic_line_mag_Td_up', 'Ic_line_ang_Td_up', 'Ir_line_mag_Td_up', 'Ir_line_ang_Td_up', 'If_line_mag_Td_up', 'If_line_ang_Td_up', 'Ic_line_mag_Td_down', 'Ic_line_ang_Td_down', 'Ir_line_mag_Td_down', 'Ir_line_ang_Td_down', 'If_line_mag_Td_down', 'If_line_ang_Td_down', 'z1', 'Vc_mag_Md_up', 'Vc_ang_Md_up', 'VR_mag_Md_up', 'VR_ang_Md_up', 'Vf_mag_Md_up', 'Vf_ang_Md_up', 'Vc_mag_Md_down', 'Vc_ang_Md_down', 'VR_mag_Md_down', 'VR_ang_Md_down', 'Vf_mag_Md_down', 'Vf_ang_Md_down', 'Ic_line_mag_Md_up', 'Ic_line_ang_Md_up', 'Ir_line_mag_Md_up', 'Ir_line_ang_Md_up', 'If_line_mag_Md_up', 'If_line_ang_Md_up', 'Ic_line_mag_Md_down', 'Ic_line_ang_Md_down', 'Ir_line_mag_Md_down', 'Ir_line_ang_Md_down', 'If_line_mag_Md_down', 'If_line_ang_Md_down', 'AT_mva_mag_up', 'AT_mva_mag_down', 'AT', 'Unb', 's_apprant_power_MVA_mag', 'train_number', 'track_type', 'train_type', 'start_time', 'each_stop_train_data_up', 'rapid_train_data_up', 'each_stop_train_data_down', 'rapid_train_data_down', 'track_length'
    ]
    for var in tTo_double_var_names:        
        ## Reading from text file - 
        tTo_double_workspace[var] = read_text_file(f'../tTo_double_text_files/{var}.txt')

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
    st.markdown("<h1 class='title'>TSS Outage Condition</h1>", unsafe_allow_html=True)
    
    add_vertical_space(1)
    col1, col2 = st.columns(2)

    with col1:
        if st.button('One TSS Outage'):
            load_oTo_double_workspace()
            st.switch_page("pages/oTo_output_options_double.py")
        # if st.button('One TSS Outage - Double track'):
        #     load_oTo_double_workspace()
        #     st.switch_page("pages/oTo_output_options_double.py")
    
    with col2:
        if st.button('Two Adjacent TSS Outage'):
            load_tTo_double_workspace()
            st.switch_page("pages/tTo_output_options_double.py")
        # if st.button('Two Adjacent TSS Outage - Double track'):
        #     load_tTo_double_workspace()
        #     st.switch_page("pages/tTo_output_options_double.py")
            

if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/Load_Flow_Output_Options" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )