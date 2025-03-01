import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from PIL import Image
# Create an Oct2Py instance once
from pages.oTo_double_Workspace import oTo_double_workspace
import pages.OHE_config as OHE_config
from oct2py import Oct2Py
oc = Oct2Py() 
oc.eval('cd("../OHE_temp/one_TSS_outage")') 
 
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
    st.markdown("<h1 class='title'>One TSS outage Condition - Up Track</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    # col1, col2 = st.columns(2)

    # with col1:
    #     if st.button('OHE Temperatue at a particular time instant for the entire track'):
    #         st.switch_page("pages/OHE_normal_up_track_time.py")
    
    # with col2:
    #     if st.button('OHE Temperatue at a particular distance for the entire duration of train simulation'):
    #         st.switch_page("pages/OHE_normal_up_track_dist.py")
    oc.eval("setenv('GNUTERM', 'gnuplot')")

    Ic_line_mag_Td_up = oTo_double_workspace['Ic_line_mag_Td_up']
    oc.push('Ic_line_mag_Td_up', Ic_line_mag_Td_up)

    Ir_line_mag_Td_up = oTo_double_workspace['Ir_line_mag_Td_up']
    oc.push('Ir_line_mag_Td_up', Ir_line_mag_Td_up)

    If_line_mag_Td_up = oTo_double_workspace['If_line_mag_Td_up']
    oc.push('If_line_mag_Td_up', If_line_mag_Td_up)

    Ic_line_mag_Md_up = oTo_double_workspace['Ic_line_mag_Md_up']
    oc.push('Ic_line_mag_Md_up', Ic_line_mag_Md_up)

    Ir_line_mag_Md_up = oTo_double_workspace['Ir_line_mag_Md_up']
    oc.push('Ir_line_mag_Md_up', Ir_line_mag_Md_up)

    If_line_mag_Md_up = oTo_double_workspace['If_line_mag_Md_up']
    oc.push('If_line_mag_Md_up', If_line_mag_Md_up)

    y = oTo_double_workspace['y']
    oc.push('y', y)

    N_TSS = oTo_double_workspace['N_TSS']
    oc.push('N_TSS', N_TSS)

    d = oTo_double_workspace['d']
    oc.push('d', d)

    rad_C = oTo_double_workspace['rad_C']
    oc.push('rad_C', rad_C)

    rad_R1 = oTo_double_workspace['rad_R1']
    oc.push('rad_R1', rad_R1)

    rad_F = oTo_double_workspace['rad_F']
    oc.push('rad_F', rad_F)

    Resistance_C = oTo_double_workspace['Resistance_C']
    oc.push('Resistance_C', Resistance_C)

    Resistance_R1 = oTo_double_workspace['Resistance_R1']
    oc.push('Resistance_R1', Resistance_R1)

    Resistance_F = oTo_double_workspace['Resistance_F']
    oc.push('Resistance_F', Resistance_F)
    
    st.success("Initiated the process")
    
    oc.eval(f"OHE_temp_cal_up_track(Ic_line_mag_Td_up, Ir_line_mag_Td_up, If_line_mag_Td_up, Ic_line_mag_Md_up, Ir_line_mag_Md_up, If_line_mag_Md_up, y, N_TSS, d, rad_C, rad_R1, rad_F, Resistance_C, Resistance_R1, Resistance_F, {OHE_config.Q_s}, {OHE_config.T_a}, {OHE_config.V_w}, {OHE_config.theta}, {OHE_config.e}, {OHE_config.a}, {OHE_config.T_0}, {OHE_config.mCp_c}, {OHE_config.mCp_r}, {OHE_config.mCp_f}, {OHE_config.alpha_c}, {OHE_config.alpha_r}, {OHE_config.alpha_f})")
    st.success("Success!!")
            

if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/OHE_oTo_options" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )