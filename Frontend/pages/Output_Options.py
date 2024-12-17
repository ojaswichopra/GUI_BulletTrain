import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
import numpy as np
from oct2py import Oct2Py


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

sca_var = {}
def load_sca_var():
    
    
    ## Reading using entire workspace - 20mins
    # oc.eval('load("variable_load_flow_mum_to_ahm_each_stop.mat")')
    
    ## Reading using necesaary files only - 8mins 
    # oc.eval('load("required_variable_load_flow_mum_to_ahm_each_stop.mat")')
    
    # List of variable names to pull and read from text files
    variable_names = [
        'TSS', 'd', 'y', 'Vc_mag_Td', 'Vc_ang_Td', 'VR_mag_Td', 'VR_ang_Td', 'Vf_mag_Td', 'Vf_ang_Td', 'Vc_mag_Md', 'Vc_ang_Md', 'VR_mag_Md', 'VR_ang_Md', 'Vf_mag_Md', 'Vf_ang_Md', 'dTSS_T', 'dTSS_M', 'Ic_line_mag_Td', 'Ic_line_ang_Td', 'Ir_line_mag_Td', 'Ir_line_ang_Td', 'If_line_mag_Td', 'If_line_ang_Td', 'Ic_line_mag_Md', 'Ic_line_ang_Md', 'Ir_line_mag_Md', 'Ir_line_ang_Md', 'If_line_mag_Md', 'If_line_ang_Md', 'time_instant_short', 'n_tss_fault', 'faulted_winding_side', 'linedata_dTSS_T', 'linedata_dTSS_M'
    ]

    # Loop through each variable name
    for var in variable_names:        
        ## Reading from text file - 
        sca_var[var] = read_text_file(f'../SCA_text_files/{var}.txt')



def main():

    # Settings
    # st.set_page_config(page_title=title, page_icon=page_icon, layout=layout)
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
    st.markdown("<h1 class='title'>See Output</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    col1, col2 = st.columns(2)

    with col1:
        if st.button('Output of Load Flow'):
            st.switch_page("pages/Output_Loadflow_Options.py")
        if st.button('Output of Short Circuit Analysis'):
            load_sca_var()

            oc = Oct2Py() 

            TSS = sca_var['TSS']
            oc.push('TSS', TSS)

            d = sca_var['d']
            oc.push('d', d)

            y = sca_var['y']
            oc.push('y', y)

            Vc_mag_Td = sca_var['Vc_mag_Td']
            oc.push('Vc_mag_Td', Vc_mag_Td)

            Vc_ang_Td = sca_var['Vc_ang_Td']
            oc.push('Vc_ang_Td', Vc_ang_Td)

            VR_mag_Td = sca_var['VR_mag_Td']
            oc.push('VR_mag_Td', VR_mag_Td)

            VR_ang_Td = sca_var['VR_ang_Td']
            oc.push('VR_ang_Td', VR_ang_Td)

            Vf_mag_Td = sca_var['Vf_mag_Td']
            oc.push('Vf_mag_Td', Vf_mag_Td)

            Vf_ang_Td = sca_var['Vf_ang_Td']
            oc.push('Vf_ang_Td', Vf_ang_Td)

            Vc_mag_Md = sca_var['Vc_mag_Md']
            oc.push('Vc_mag_Md', Vc_mag_Md)

            Vc_ang_Md = sca_var['Vc_ang_Md']
            oc.push('Vc_ang_Md', Vc_ang_Md)

            VR_mag_Md = sca_var['VR_mag_Md']
            oc.push('VR_mag_Md', VR_mag_Md)

            VR_ang_Md = sca_var['VR_ang_Md']
            oc.push('VR_ang_Md', VR_ang_Md)

            Vf_mag_Md = sca_var['Vf_mag_Md']
            oc.push('Vf_mag_Md', Vf_mag_Md)

            Vf_ang_Md = sca_var['Vf_ang_Md']
            oc.push('Vf_ang_Md', Vf_ang_Md)

            dTSS_T = sca_var['dTSS_T']
            oc.push('dTSS_T', dTSS_T)

            dTSS_M = sca_var['dTSS_M']
            oc.push('dTSS_M', dTSS_M)

            Ic_line_mag_Td = sca_var['Ic_line_mag_Td']
            oc.push('Ic_line_mag_Td', Ic_line_mag_Td)

            Ic_line_ang_Td = sca_var['Ic_line_ang_Td']
            oc.push('Ic_line_ang_Td', Ic_line_ang_Td)

            Ir_line_mag_Td = sca_var['Ir_line_mag_Td']
            oc.push('Ir_line_mag_Td', Ir_line_mag_Td)

            Ir_line_ang_Td = sca_var['Ir_line_ang_Td']
            oc.push('Ir_line_ang_Td', Ir_line_ang_Td)

            If_line_mag_Td = sca_var['If_line_mag_Td']
            oc.push('If_line_mag_Td', If_line_mag_Td)

            If_line_ang_Td = sca_var['If_line_ang_Td']
            oc.push('If_line_ang_Td', If_line_ang_Td)

            Ic_line_mag_Md = sca_var['Ic_line_mag_Md']
            oc.push('Ic_line_mag_Md', Ic_line_mag_Md)

            Ic_line_ang_Md = sca_var['Ic_line_ang_Md']
            oc.push('Ic_line_ang_Md', Ic_line_ang_Md)

            Ir_line_mag_Md = sca_var['Ir_line_mag_Md']
            oc.push('Ir_line_mag_Md', Ir_line_mag_Md)

            Ir_line_ang_Md = sca_var['Ir_line_ang_Md']
            oc.push('Ir_line_ang_Md', Ir_line_ang_Md)

            If_line_mag_Md = sca_var['If_line_mag_Md']
            oc.push('If_line_mag_Md', If_line_mag_Md)

            If_line_ang_Md = sca_var['If_line_ang_Md']
            oc.push('If_line_ang_Md', If_line_ang_Md)

            time_instant_short = sca_var['time_instant_short']
            oc.push('time_instant_short', time_instant_short)

            n_tss_fault = sca_var['n_tss_fault']
            oc.push('n_tss_fault', n_tss_fault)

            faulted_winding_side = sca_var['faulted_winding_side']
            oc.push('faulted_winding_side', faulted_winding_side)

            linedata_dTSS_T = sca_var['linedata_dTSS_T']
            oc.push('linedata_dTSS_T', linedata_dTSS_T)

            linedata_dTSS_M = sca_var['linedata_dTSS_M']
            oc.push('linedata_dTSS_M', linedata_dTSS_M)

            oc.eval('cd("../short_circuit_analysis")') 
            oc.eval(f"Full_track_voltage_profile_instant_t_short_circuit(TSS, d, y, Vc_mag_Td, Vc_ang_Td, VR_mag_Td, VR_ang_Td, Vf_mag_Td, Vf_ang_Td, Vc_mag_Md, Vc_ang_Md, VR_mag_Md, VR_ang_Md, Vf_mag_Md, Vf_ang_Md, dTSS_T, dTSS_M, Ic_line_mag_Td, Ic_line_ang_Td, Ir_line_mag_Td, Ir_line_ang_Td, If_line_mag_Td, If_line_ang_Td, Ic_line_mag_Md, Ic_line_ang_Md, Ir_line_mag_Md, Ir_line_ang_Md, If_line_mag_Md, If_line_ang_Md, time_instant_short, n_tss_fault, faulted_winding_side, linedata_dTSS_T, linedata_dTSS_M)")
            st.switch_page("pages/SCA_output.py")
        if st.button('Output of induced voltage calculations'):
            st.switch_page("")
    
    with col2:
        if st.button('Output of OHE Temperature Rise Calculation'):
            st.switch_page("")
        if st.button('Output of harmonic analysis'):
            st.switch_page("")

if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/Landing" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )