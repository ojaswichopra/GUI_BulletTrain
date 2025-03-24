import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from oct2py import Oct2Py
import numpy as np
import os

# Initialize Oct2Py
oc = Oct2Py()

# Constants
title = "GUI Bullet Train"
page_icon = ":bullet_train:"  # emojis: https://www.webfx.com/tools/emoji-cheat-sheet/
layout = "centered"

# Helper function to check if a string can be converted to a float
def is_numeric(value):
    try:
        float(value)
        return True
    except ValueError:
        return False

# Function to read text files and process their content
def read_text_file(file_path):
    try:
        with open(file_path, 'r') as file:
            content = file.readlines()

        if not content:
            print("The file is empty.")
            return None

        # Process the content to determine its structure
        if len(content) == 1:  # Single line
            values = content[0].split()
            numeric_values = [float(v) for v in values if is_numeric(v)]

            if len(numeric_values) == 1:
                return numeric_values[0]  # Scalar
            else:
                return np.array(numeric_values)  # 1D array

        else:  # Multiple lines
            array_2d = []
            for line in content:
                values = line.split()
                numeric_values = [float(v) for v in values if is_numeric(v)]

                if numeric_values:
                    array_2d.append(numeric_values)

            if len(array_2d) == 1 and len(array_2d[0]) == 1:
                return array_2d[0][0]  # Single value in a 2D structure
            else:
                return np.array(array_2d)  # 2D array

    except FileNotFoundError:
        print("The specified file was not found.")
        return None
    except ValueError:
        print("Error converting values to numeric.")
        return None

# Function to load SCA variables from text files
sca_var = {}
def load_sca_var():
    variable_names = [
        'TSS', 'd', 'y', 'Vc_mag_Td', 'Vc_ang_Td', 'VR_mag_Td', 'VR_ang_Td', 'Vf_mag_Td', 'Vf_ang_Td',
        'Vc_mag_Md', 'Vc_ang_Md', 'VR_mag_Md', 'VR_ang_Md', 'Vf_mag_Md', 'Vf_ang_Md', 'dTSS_T', 'dTSS_M',
        'Ic_line_mag_Td', 'Ic_line_ang_Td', 'Ir_line_mag_Td', 'Ir_line_ang_Td', 'If_line_mag_Td', 'If_line_ang_Td',
        'Ic_line_mag_Md', 'Ic_line_ang_Md', 'Ir_line_mag_Md', 'Ir_line_ang_Md', 'If_line_mag_Md', 'If_line_ang_Md',
        'time_instant_short', 'n_tss_fault', 'faulted_winding_side', 'linedata_dTSS_T', 'linedata_dTSS_M'
    ]

    for var in variable_names:
        sca_var[var] = read_text_file(f'../SCA_text_files/{var}.txt')
    return sca_var

# Function to push variables to Octave
def push_variables_to_octave(sca_var):
    for var, value in sca_var.items():
        oc.push(var, value)

sca_var_down = {}
def load_sca_var_down():
    variable_names = [
        'TSS', 'd', 'y', 'Vc_mag_Td_down', 'Vc_ang_Td_down', 'VR_mag_Td_down', 'VR_ang_Td_down', 'Vf_mag_Td_down', 'Vf_ang_Td_down', 
        'Vc_mag_Md_down', 'Vc_ang_Md_down', 'VR_mag_Md_down', 'VR_ang_Md_down', 'Vf_mag_Md_down', 'Vf_ang_Md_down', 'dTSS_T_down', 
        'dTSS_M_down', 'Ic_line_mag_Td_down', 'Ic_line_ang_Td_down', 'Ir_line_mag_Td_down', 'Ir_line_ang_Td_down', 'If_line_mag_Td_down', 
        'If_line_ang_Td_down', 'Ic_line_mag_Md_down', 'Ic_line_ang_Md_down', 'Ir_line_mag_Md_down', 'Ir_line_ang_Md_down', 
        'If_line_mag_Md_down', 'If_line_ang_Md_down', 'time_instant_short', 'n_tss_fault', 'faulted_winding_side', 'linedata_dTSS_T_down',
        'linedata_dTSS_M_down'
    ]
    for var in variable_names:
        sca_var_down[var] = read_text_file(f'../SCA_double_text_files/{var}.txt')
    return sca_var_down

sca_var_up = {}
def load_sca_var_up():
    variable_names = [
        'TSS', 'd', 'y', 'Vc_mag_Td_up', 'Vc_ang_Td_up', 'VR_mag_Td_up', 'VR_ang_Td_up', 'Vf_mag_Td_up', 'Vf_ang_Td_up', 'Vc_mag_Md_up', 
        'Vc_ang_Md_up', 'VR_mag_Md_up', 'VR_ang_Md_up', 'Vf_mag_Md_up', 'Vf_ang_Md_up', 'dTSS_T_up', 'dTSS_M_up', 'Ic_line_mag_Td_up', 
        'Ic_line_ang_Td_up', 'Ir_line_mag_Td_up', 'Ir_line_ang_Td_up', 'If_line_mag_Td_up', 'If_line_ang_Td_up', 'Ic_line_mag_Md_up', 
        'Ic_line_ang_Md_up', 'Ir_line_mag_Md_up', 'Ir_line_ang_Md_up', 'If_line_mag_Md_up', 'If_line_ang_Md_up', 'time_instant_short', 
        'n_tss_fault', 'faulted_winding_side', 'linedata_dTSS_T_up', 'linedata_dTSS_M_up'
    ]
    for var in variable_names:
        sca_var_up[var] = read_text_file(f'../SCA_double_text_files/{var}.txt')
    return sca_var_up

# Main function
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

    st.markdown("<h1 class='title'>Short circuit output</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    col1, col2 = st.columns(2)

    with col1:
        # if st.button('Normal track'):
        #     sca_var = load_sca_var()
        #     push_variables_to_octave(sca_var)

        #     oc.eval('cd("../short_circuit_analysis")')
        #     oc.eval(
        #         "Full_track_voltage_profile_instant_t_short_circuit(TSS, d, y, Vc_mag_Td, Vc_ang_Td, VR_mag_Td, VR_ang_Td, "
        #         "Vf_mag_Td, Vf_ang_Td, Vc_mag_Md, Vc_ang_Md, VR_mag_Md, VR_ang_Md, Vf_mag_Md, Vf_ang_Md, dTSS_T, dTSS_M, "
        #         "Ic_line_mag_Td, Ic_line_ang_Td, Ir_line_mag_Td, Ir_line_ang_Td, If_line_mag_Td, If_line_ang_Td, "
        #         "Ic_line_mag_Md, Ic_line_ang_Md, Ir_line_mag_Md, Ir_line_ang_Md, If_line_mag_Md, If_line_ang_Md, "
        #         "time_instant_short, n_tss_fault, faulted_winding_side, linedata_dTSS_T, linedata_dTSS_M)"
        #     )
        #     st.switch_page("pages/SCA_output.py")
        if st.button('Up track'):
            sca_var_up = load_sca_var_up()
            push_variables_to_octave(sca_var_up)
            oc.eval('cd("../short_circuit_double_track")')
            oc.eval("Full_track_up_Current_voltage_profile_short_circuit_load_txt(TSS, d, y, Vc_mag_Td_up, Vc_ang_Td_up, VR_mag_Td_up, VR_ang_Td_up, Vf_mag_Td_up, Vf_ang_Td_up, Vc_mag_Md_up, Vc_ang_Md_up, VR_mag_Md_up, VR_ang_Md_up, Vf_mag_Md_up, Vf_ang_Md_up, dTSS_T_up, dTSS_M_up, Ic_line_mag_Td_up, Ic_line_ang_Td_up, Ir_line_mag_Td_up, Ir_line_ang_Td_up, If_line_mag_Td_up, If_line_ang_Td_up, Ic_line_mag_Md_up, Ic_line_ang_Md_up, Ir_line_mag_Md_up, Ir_line_ang_Md_up, If_line_mag_Md_up, If_line_ang_Md_up, time_instant_short, n_tss_fault, faulted_winding_side, linedata_dTSS_T_up, linedata_dTSS_M_up)")
            st.switch_page("pages/SCA_output_double_UP.py")

    with col2:
        if st.button('Down track'):
            sca_var_down = load_sca_var_down()
            push_variables_to_octave(sca_var_down)
            oc.eval('cd("../short_circuit_double_track")')
            oc.eval("Full_track_down_Current_voltage_profile_short_circuit_load_txt(TSS, d, y, Vc_mag_Td_down, Vc_ang_Td_down, VR_mag_Td_down, VR_ang_Td_down, Vf_mag_Td_down, Vf_ang_Td_down, Vc_mag_Md_down, Vc_ang_Md_down, VR_mag_Md_down, VR_ang_Md_down, Vf_mag_Md_down, Vf_ang_Md_down, dTSS_T_down, dTSS_M_down, Ic_line_mag_Td_down, Ic_line_ang_Td_down, Ir_line_mag_Td_down, Ir_line_ang_Td_down, If_line_mag_Td_down, If_line_ang_Td_down, Ic_line_mag_Md_down, Ic_line_ang_Md_down, Ir_line_mag_Md_down, Ir_line_ang_Md_down, If_line_mag_Md_down, If_line_ang_Md_down, time_instant_short, n_tss_fault, faulted_winding_side, linedata_dTSS_T_down, linedata_dTSS_M_down)")
            st.switch_page("pages/SCA_output_double_DOWN.py")

    st.markdown(
        f"""
        <a href="/Output_Options" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )

if __name__ == "__main__":
    main()