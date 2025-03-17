import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from pages.harmonic_normal_vars import harmonic_normal_vars
from oct2py import Oct2Py
oc = Oct2Py() 
oc.eval('cd("../Harmonic/normal")') 
 
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
    st.markdown("<h1 class='title'>Normal Condition</h1>", unsafe_allow_html=True)
    add_vertical_space(1)

    dTSS_T_up = harmonic_normal_vars['dTSS_T_up']
    oc.push('dTSS_T_up', dTSS_T_up)

    dTSS_M_up = harmonic_normal_vars['dTSS_M_up']
    oc.push('dTSS_M_up', dTSS_M_up)

    dTSS_T_down = harmonic_normal_vars['dTSS_T_down']
    oc.push('dTSS_T_down', dTSS_T_down)

    dTSS_M_down = harmonic_normal_vars['dTSS_M_down']
    oc.push('dTSS_M_down', dTSS_M_down)

    pTSS_T_up = harmonic_normal_vars['pTSS_T_up']
    oc.push('pTSS_T_up', pTSS_T_up)

    pTSS_M_up = harmonic_normal_vars['pTSS_M_up']
    oc.push('pTSS_M_up', pTSS_M_up)

    pTSS_T_down = harmonic_normal_vars['pTSS_T_down']
    oc.push('pTSS_T_down', pTSS_T_down)

    pTSS_M_down = harmonic_normal_vars['pTSS_M_down']
    oc.push('pTSS_M_down', pTSS_M_down)

    tTSS_T_up = harmonic_normal_vars['tTSS_T_up']
    oc.push('tTSS_T_up', tTSS_T_up)

    tTSS_M_up = harmonic_normal_vars['tTSS_M_up']
    oc.push('tTSS_M_up', tTSS_M_up)

    tTSS_T_down = harmonic_normal_vars['tTSS_T_down']
    oc.push('tTSS_T_down', tTSS_T_down)

    tTSS_M_down = harmonic_normal_vars['tTSS_M_down']
    oc.push('tTSS_M_down', tTSS_M_down)

    Vc_mag_Td = harmonic_normal_vars['Vc_mag_Td']
    oc.push('Vc_mag_Td', Vc_mag_Td)

    Vc_mag_Md = harmonic_normal_vars['Vc_mag_Md']
    oc.push('Vc_mag_Md', Vc_mag_Md)

    Vc_ang_Td = harmonic_normal_vars['Vc_ang_Td']
    oc.push('Vc_ang_Td', Vc_ang_Td)

    Vc_ang_Md = harmonic_normal_vars['Vc_ang_Md']
    oc.push('Vc_ang_Md', Vc_ang_Md)

    VR_mag_Td = harmonic_normal_vars['VR_mag_Td']
    oc.push('VR_mag_Td', VR_mag_Td)

    Vf_mag_Td = harmonic_normal_vars['Vf_mag_Td']
    oc.push('Vf_mag_Td', Vf_mag_Td)

    VR_mag_Md = harmonic_normal_vars['VR_mag_Md']
    oc.push('VR_mag_Md', VR_mag_Md)

    Vf_mag_Md = harmonic_normal_vars['Vf_mag_Md']
    oc.push('Vf_mag_Md', Vf_mag_Md)

    N_TSS = harmonic_normal_vars['N_TSS']
    oc.push('N_TSS', N_TSS)

    y = harmonic_normal_vars['y']
    oc.push('y', y)
    
    st.success("Initiated the Process!!")
    oc.eval(f"harmonic_analysis(dTSS_T_up, dTSS_M_up, dTSS_T_down, dTSS_M_down, pTSS_T_up, pTSS_M_up, pTSS_T_down, pTSS_M_down, tTSS_T_up, tTSS_M_up, tTSS_T_down, tTSS_M_down, Vc_mag_Td, Vc_mag_Md, Vc_ang_Td, Vc_ang_Md, VR_mag_Td, Vf_mag_Td, VR_mag_Md, Vf_mag_Md, N_TSS, y)")
    st.success("Success!!")

if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/Harmonic_options" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )