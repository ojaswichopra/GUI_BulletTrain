import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from oct2py import Oct2Py
import os
from pages.workspace import workspace_variables
import numpy as np

title = "GUI Bullet Train"
page_icon = ":bullet_train:"  # emojis: https://www.webfx.com/tools/emoji-cheat-sheet/
layout = "centered"

selection = None


def load_workspace_variables():
    oc = Oct2Py() 
    oc.eval('cd("../backend_codes")') 
    oc.eval('load("variable_load_flow_mum_to_ahm_each_stop.mat")')
    workspace_variables['AT_mva_mag'] = oc.pull('AT_mva_mag')
    workspace_variables['Unb'] = oc.pull('Unb')
    workspace_variables['s_apprant_power_MVA_mag'] = oc.pull('s_apprant_power_MVA_mag')
    workspace_variables['d'] = oc.pull('d')
    workspace_variables['dTSS_T'] = oc.pull('dTSS_T')
    workspace_variables['Ic_line_mag_Td'] = oc.pull('Ic_line_mag_Td')
    workspace_variables['Ic_line_ang_Td'] = oc.pull('Ic_line_ang_Td')
    workspace_variables['Ir_line_mag_Td'] = oc.pull('Ir_line_mag_Td')
    workspace_variables['Ir_line_ang_Td'] = oc.pull('Ir_line_ang_Td')
    workspace_variables['If_line_mag_Td'] = oc.pull('If_line_mag_Td')
    workspace_variables['If_line_ang_Td'] = oc.pull('If_line_ang_Td')
    workspace_variables['Vc_mag_Td'] = oc.pull('Vc_mag_Td')
    workspace_variables['Vc_ang_Td'] = oc.pull('Vc_ang_Td')
    workspace_variables['VR_mag_Td'] = oc.pull('VR_mag_Td')
    workspace_variables['VR_ang_Td'] = oc.pull('VR_ang_Td')
    workspace_variables['Vf_mag_Td'] = oc.pull('Vf_mag_Td')
    workspace_variables['Vf_ang_Td'] = oc.pull('Vf_ang_Td')
    workspace_variables['z1'] = oc.pull('z1')
    workspace_variables['y'] = oc.pull('y')
    workspace_variables['dTSS_M'] = oc.pull('dTSS_M')
    workspace_variables['Ic_line_mag_Md'] = oc.pull('Ic_line_mag_Md')
    workspace_variables['Ic_line_ang_Md'] = oc.pull('Ic_line_ang_Md')
    workspace_variables['Ir_line_mag_Md'] = oc.pull('Ir_line_mag_Md')
    workspace_variables['Ir_line_ang_Md'] = oc.pull('Ir_line_ang_Md')
    workspace_variables['If_line_mag_Md'] = oc.pull('If_line_mag_Md')
    workspace_variables['If_line_ang_Md'] = oc.pull('If_line_ang_Md')
    workspace_variables['Vc_mag_Md'] = oc.pull('Vc_mag_Md')
    workspace_variables['Vc_ang_Md'] = oc.pull('Vc_ang_Md')
    workspace_variables['VR_mag_Md'] = oc.pull('VR_mag_Md')
    workspace_variables['VR_ang_Md'] = oc.pull('VR_ang_Md')
    workspace_variables['Vf_mag_Md'] = oc.pull('Vf_mag_Md')
    workspace_variables['Vf_ang_Md'] = oc.pull('Vf_ang_Md')
    workspace_variables['AT'] = oc.pull('AT')
    workspace_variables['train_data'] = oc.pull('train_data')
    workspace_variables['dTSS'] = oc.pull('dTSS')
    workspace_variables['TSS'] = oc.pull('TSS')


# sidebar page links
def authenticated_menu():
    st.sidebar.empty()
    # st.sidebar.page_link("pages/1_Listings.py", label="Companies List")  


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
    
    st.markdown("<h1 class='title'>Graphical User Interface</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    col1, col2 = st.columns(2)

    with col1:
        if st.button('Make system data'):
            st.switch_page("pages/Make_System_Data.py")
        if st.button('Execute load flow'):
            st.switch_page("pages/Execute_Load_Flow.py")
        if st.button('Perform harmonic analysis'):
            st.write("Button 1 clicked!")
        if st.button('Calculate induced voltage'):
            st.write("Button 1 clicked!")

    with col2:
        if st.button('Prepare train timetable'):
            st.write("Button 2 clicked!")
        if st.button('Perform short circuit analysis'):
            st.write("Button 4 clicked!")
        if st.button('Calculate OHE temerature rise'):
            st.write("Button 1 clicked!")
        if st.button('See output'):
            load_workspace_variables()
            # st.write(workspace_variables) 
            st.switch_page("pages/Load_Flow_Output.py")



if __name__ == "__main__":
    main()
    # authenticated_menu()
