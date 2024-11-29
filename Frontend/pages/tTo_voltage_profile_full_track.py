import os
import streamlit as st
from PIL import Image
# Create an Oct2Py instance once
from pages.tTo_Workspace import tTo_workspace
from oct2py import Oct2Py
oc = Oct2Py() 
oc.eval('cd("../two_TSS_outage")') 

def main():

    st.markdown(
            """
        <style>
            [data-testid="collapsedControl"] {
                display: none
            }
            .title {
                text-align: center;
            }
        </style>
        """,
            unsafe_allow_html=True,
        )

    st.markdown("<h1 class='title'>Voltage profile of full track at particular time instant</h1>", unsafe_allow_html=True)

    track_time_1 = st.number_input("Enter the time instant in second (sec) for getting voltage profile along the track", min_value=0)
    x_reso = st.number_input("Enter the distance resolution for voltage profile along the track", min_value=0)
    if(st.button("Show")):
        oc.eval("setenv('GNUTERM', 'gnuplot')")
        
        AT = oTo_workspace['AT']
        oc.push('AT', AT)

        d = oTo_workspace['d']
        oc.push('d', d)

        TSS = oTo_workspace['TSS']
        oc.push('TSS', TSS)

        N_TSS_O = oTo_workspace['N_TSS_O']
        oc.push('N_TSS_O', N_TSS_O)

        N_TSS = oTo_workspace['N_TSS']
        oc.push('N_TSS', N_TSS)

        y = oTo_workspace['y']
        oc.push('y', y)

        Vc_mag_Td = oTo_workspace['Vc_mag_Td']
        oc.push('Vc_mag_Td', Vc_mag_Td)

        Vc_ang_Td = oTo_workspace['Vc_ang_Td']
        oc.push('Vc_ang_Td', Vc_ang_Td)

        VR_mag_Td = oTo_workspace['VR_mag_Td']
        oc.push('VR_mag_Td', VR_mag_Td)

        VR_ang_Td = oTo_workspace['VR_ang_Td']
        oc.push('VR_ang_Td', VR_ang_Td)

        Vf_mag_Td = oTo_workspace['Vf_mag_Td']
        oc.push('Vf_mag_Td', Vf_mag_Td)

        Vf_ang_Td = oTo_workspace['Vf_ang_Td']
        oc.push('Vf_ang_Td', Vf_ang_Td)

        Vc_mag_Md = oTo_workspace['Vc_mag_Md']
        oc.push('Vc_mag_Md', Vc_mag_Md)

        Vc_ang_Md = oTo_workspace['Vc_ang_Md']
        oc.push('Vc_ang_Md', Vc_ang_Md)

        VR_mag_Md = oTo_workspace['VR_mag_Md']
        oc.push('VR_mag_Md', VR_mag_Md)

        VR_ang_Md = oTo_workspace['VR_ang_Md']
        oc.push('VR_ang_Md', VR_ang_Md)

        Vf_mag_Md = oTo_workspace['Vf_mag_Md']
        oc.push('Vf_mag_Md', Vf_mag_Md)

        Vf_ang_Md = oTo_workspace['Vf_ang_Md']
        oc.push('Vf_ang_Md', Vf_ang_Md)

        dTSS_T = oTo_workspace['dTSS_T']
        oc.push('dTSS_T', dTSS_T)

        dTSS_M = oTo_workspace['dTSS_M']
        oc.push('dTSS_M', dTSS_M)

        Ic_line_mag_Td = oTo_workspace['Ic_line_mag_Td']
        oc.push('Ic_line_mag_Td', Ic_line_mag_Td)

        Ic_line_ang_Td = oTo_workspace['Ic_line_ang_Td']
        oc.push('Ic_line_ang_Td', Ic_line_ang_Td)

        Ir_line_mag_Td = oTo_workspace['Ir_line_mag_Td']
        oc.push('Ir_line_mag_Td', Ir_line_mag_Td)

        Ir_line_ang_Td = oTo_workspace['Ir_line_ang_Td']
        oc.push('Ir_line_ang_Td', Ir_line_ang_Td)

        If_line_mag_Td = oTo_workspace['If_line_mag_Td']
        oc.push('If_line_mag_Td', If_line_mag_Td)

        If_line_ang_Td = oTo_workspace['If_line_ang_Td']
        oc.push('If_line_ang_Td', If_line_ang_Td)

        Ic_line_mag_Md = oTo_workspace['Ic_line_mag_Md']
        oc.push('Ic_line_mag_Md', Ic_line_mag_Md)

        Ic_line_ang_Md = oTo_workspace['Ic_line_ang_Md']
        oc.push('Ic_line_ang_Md', Ic_line_ang_Md)

        Ir_line_mag_Md = oTo_workspace['Ir_line_mag_Md']
        oc.push('Ir_line_mag_Md', Ir_line_mag_Md)

        Ir_line_ang_Md = oTo_workspace['Ir_line_ang_Md']
        oc.push('Ir_line_ang_Md', Ir_line_ang_Md)

        If_line_mag_Md = oTo_workspace['If_line_mag_Md']
        oc.push('If_line_mag_Md', If_line_mag_Md)

        If_line_ang_Md = oTo_workspace['If_line_ang_Md']
        oc.push('If_line_ang_Md', If_line_ang_Md)

        oc.eval(f"Full_track_voltage_profile_instant_t_adjecent_outage_load_file({track_time_1}, {x_reso},AT, d, TSS, N_TSS_O, N_TSS, y, Vc_mag_Td, Vc_ang_Td, VR_mag_Td, VR_ang_Td, Vf_mag_Td, Vf_ang_Td, Vc_mag_Md, Vc_ang_Md, VR_mag_Md, VR_ang_Md, Vf_mag_Md, Vf_ang_Md, dTSS_T, dTSS_M, Ic_line_mag_Td, Ic_line_ang_Td, Ir_line_mag_Td, Ir_line_ang_Td, If_line_mag_Td, If_line_ang_Td, Ic_line_mag_Md, Ic_line_ang_Md, Ir_line_mag_Md, Ir_line_ang_Md, If_line_mag_Md, If_line_ang_Md)")
        image_path = '../Plots_tTo/tTo_voltage_profile_full_track.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="tTo_voltage_profile_full_track.png",  # Replace with the desired download filename
                mime="image/png"
            )


if __name__ == "__main__":
    main()
    if st.button("Back"):
        st.switch_page("pages/tTo_output_options.py")
