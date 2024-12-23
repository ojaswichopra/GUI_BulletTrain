import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from oct2py import Oct2Py
import os
from pages.workspace import workspace_variables
from pages.EN_workspace import en_workspace
import numpy as np
 
    
def load_EN_workspace():
    oc = Oct2Py() 
    oc.eval('cd("../EN-50641")')
    #steps:
    #first load the .mat file using oc.. then push the variables from oc to workspace
    try:
        # Attempt to load the .mat file
        oc.eval('load("required_variable_load_flow_standard.mat")')
        print("MAT file loaded successfully.") 
        variables_in_workspace = oc.eval('who')  # This returns all variable names
        print(variables_in_workspace)  # Print out all available variables
    except Oct2PyError as e:
        print(f"Error loading MAT file: {e}")
        return  # Exit the function if the file can't be loaded
    
    
    EN_variable_names = [
        'HS_train_A_F_data','HS_train_F_A_data','FR_train_A_F_data','SUB_train_A_F_data','d','line_data_M_emp','dTSS','y_whole','y','Vc_mag_Td','Vc_ang_Td','VR_mag_Td','VR_ang_Td','pTSS_T','Vf_mag_Td','sub_station_catenary_current','sub_station_feeder_current'
    ]
    for var in EN_variable_names:
        my_var = oc.pull(var)
        en_workspace[var] = my_var




title = "Output Options"
page_icon = ":bullet_train:"  # emojis: https://www.webfx.com/tools/emoji-cheat-sheet/
layout = "centered"

selection = None



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
    st.markdown("<h1 class='title'>Output of Load Flow</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    col1, col2 = st.columns(2)

    with col1:
        if st.button('EN-50641 standard Validation'):
            load_EN_workspace()
            st.switch_page("pages/EN_Output.py")
    
    with col2:
        if st.button('Mumbai Ahemadabad Track (Each Stop Train)'):
            st.switch_page("pages/Load_Flow_Output_Options.py")
            

if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/Output_Options" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )