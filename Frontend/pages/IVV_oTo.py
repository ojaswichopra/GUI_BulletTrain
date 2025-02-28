import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
# Create an Oct2Py instance once
from pages.oTo_double_Workspace import oTo_double_workspace
import pages.IVV_config as IVV_config
from oct2py import Oct2Py
oc = Oct2Py() 
oc.eval('cd("../IVV/oTo")') 
 
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
    st.markdown("<h1 class='title'>One TSS Outage Condition</h1>", unsafe_allow_html=True)
    add_vertical_space(1)

    d = oTo_double_workspace['d']
    oc.push('d', d)

    rad_C = oTo_double_workspace['rad_C']
    oc.push('rad_C', rad_C)

    rad_R1 = oTo_double_workspace['rad_R1']
    oc.push('rad_R1', rad_R1)

    rad_F = oTo_double_workspace['rad_F']
    oc.push('rad_F', rad_F)

    rad_M1 = oTo_double_workspace['rad_M1']
    oc.push('rad_M1', rad_M1)

    rad_G = oTo_double_workspace['rad_G']
    oc.push('rad_G', rad_G)

    Resistance_C = oTo_double_workspace['Resistance_C']
    oc.push('Resistance_C', Resistance_C)

    Resistance_R1 = oTo_double_workspace['Resistance_R1']
    oc.push('Resistance_R1', Resistance_R1)

    Resistance_F = oTo_double_workspace['Resistance_F']
    oc.push('Resistance_F', Resistance_F)

    Resistance_M1 = oTo_double_workspace['Resistance_M1']
    oc.push('Resistance_M1', Resistance_M1)

    Resistance_G = oTo_double_workspace['Resistance_G']
    oc.push('Resistance_G', Resistance_G)

    Ch = oTo_double_workspace['Ch']
    oc.push('Ch', Ch)

    nFd = oTo_double_workspace['nFd']
    oc.push('nFd', nFd)

    nFh = oTo_double_workspace['nFh']
    oc.push('nFh', nFh)

    Mh = oTo_double_workspace['Mh']
    oc.push('Mh', Mh)

    gd = oTo_double_workspace['gd']
    oc.push('gd', gd)

    gh = oTo_double_workspace['gh']
    oc.push('gh', gh)

    freq = oTo_double_workspace['freq']
    oc.push('freq', freq)

    row = oTo_double_workspace['row']
    oc.push('row', row)

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

    Ic_line_ang_Td_up = oTo_double_workspace['Ic_line_ang_Td_up']
    oc.push('Ic_line_ang_Td_up', Ic_line_ang_Td_up)

    Ir_line_ang_Td_up = oTo_double_workspace['Ir_line_ang_Td_up']
    oc.push('Ir_line_ang_Td_up', Ir_line_ang_Td_up)

    If_line_ang_Td_up = oTo_double_workspace['If_line_ang_Td_up']
    oc.push('If_line_ang_Td_up', If_line_ang_Td_up)

    Ic_line_ang_Md_up = oTo_double_workspace['Ic_line_ang_Md_up']
    oc.push('Ic_line_ang_Md_up', Ic_line_ang_Md_up)

    Ir_line_ang_Md_up = oTo_double_workspace['Ir_line_ang_Md_up']
    oc.push('Ir_line_ang_Md_up', Ir_line_ang_Md_up)

    If_line_ang_Md_up = oTo_double_workspace['If_line_ang_Md_up']
    oc.push('If_line_ang_Md_up', If_line_ang_Md_up)

    Ic_line_mag_Td_down = oTo_double_workspace['Ic_line_mag_Td_down']
    oc.push('Ic_line_mag_Td_down', Ic_line_mag_Td_down)

    Ir_line_mag_Td_down = oTo_double_workspace['Ir_line_mag_Td_down']
    oc.push('Ir_line_mag_Td_down', Ir_line_mag_Td_down)

    If_line_mag_Td_down = oTo_double_workspace['If_line_mag_Td_down']
    oc.push('If_line_mag_Td_down', If_line_mag_Td_down)

    Ic_line_mag_Md_down = oTo_double_workspace['Ic_line_mag_Md_down']
    oc.push('Ic_line_mag_Md_down', Ic_line_mag_Md_down)

    Ir_line_mag_Md_down = oTo_double_workspace['Ir_line_mag_Md_down']
    oc.push('Ir_line_mag_Md_down', Ir_line_mag_Md_down)

    If_line_mag_Md_down = oTo_double_workspace['If_line_mag_Md_down']
    oc.push('If_line_mag_Md_down', If_line_mag_Md_down)

    Ic_line_ang_Td_down = oTo_double_workspace['Ic_line_ang_Td_down']
    oc.push('Ic_line_ang_Td_down', Ic_line_ang_Td_down)

    Ir_line_ang_Td_down = oTo_double_workspace['Ir_line_ang_Td_down']
    oc.push('Ir_line_ang_Td_down', Ir_line_ang_Td_down)

    If_line_ang_Td_down = oTo_double_workspace['If_line_ang_Td_down']
    oc.push('If_line_ang_Td_down', If_line_ang_Td_down)

    Ic_line_ang_Md_down = oTo_double_workspace['Ic_line_ang_Md_down']
    oc.push('Ic_line_ang_Md_down', Ic_line_ang_Md_down)

    Ir_line_ang_Md_down = oTo_double_workspace['Ir_line_ang_Md_down']
    oc.push('Ir_line_ang_Md_down', Ir_line_ang_Md_down)

    If_line_ang_Md_down = oTo_double_workspace['If_line_ang_Md_down']
    oc.push('If_line_ang_Md_down', If_line_ang_Md_down)

    y = oTo_double_workspace['y']
    oc.push('y', y)

    N_TSS = oTo_double_workspace['N_TSS']
    oc.push('N_TSS', N_TSS)

    N_TSS_O = oTo_double_workspace['N_TSS_O']
    oc.push('N_TSS_O', N_TSS_O)

    j_a = oTo_double_workspace['j_a']
    oc.push('j_a', j_a)

    j_b = oTo_double_workspace['j_b']
    oc.push('j_b', j_b)

    st.success("Initiated the Process!!")
    oc.eval(f"Induced_voltage_victim(rad_C, rad_R1, rad_F, rad_M1, rad_G, Resistance_C, Resistance_R1, Resistance_F, Resistance_M1, Resistance_G, Ch, nFd, nFh, Mh, gd, gh, freq, row, Ic_line_mag_Td_up, Ir_line_mag_Td_up, If_line_mag_Td_up, Ic_line_mag_Md_up, Ir_line_mag_Md_up, If_line_mag_Md_up, Ic_line_ang_Td_up, Ir_line_ang_Td_up, If_line_ang_Td_up, Ic_line_ang_Md_up, Ir_line_ang_Md_up, If_line_ang_Md_up, Ic_line_mag_Td_down, Ir_line_mag_Td_down, If_line_mag_Td_down, Ic_line_mag_Md_down, Ir_line_mag_Md_down, If_line_mag_Md_down, Ic_line_ang_Td_down, Ir_line_ang_Td_down, If_line_ang_Td_down, Ic_line_ang_Md_down, Ir_line_ang_Md_down, If_line_ang_Md_down, y, N_TSS, d, N_TSS_O, j_a, j_b, {IVV_config.victim_wire_d}, {IVV_config.victim_wire_h}, {IVV_config.track_spacing}, {IVV_config.rad_victim_mm}, {IVV_config.resistance_victim_wire}, {IVV_config.ke}, {IVV_config.kt})")
    st.success("Success!!")

if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/IVV_tss_options" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )