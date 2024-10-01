import os
import streamlit as st
from PIL import Image
# Create an Oct2Py instance once
from pages.workspace import workspace_variables
from oct2py import Oct2Py
oc = Oct2Py() 
oc.eval('cd("../backend_codes")') 

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

    #AT_MVA_profile.png -> name of plot in backend

    st.markdown("<h1 class='title'>Voltage Profile at a Particular Distance</h1>", unsafe_allow_html=True)


    total_distance_from_start_point = st.number_input("Enter the distance (in Km) from starting point at which the voltage profile over entire durations of train scheduling needs to be investigated'", min_value=0)
    
    if st.button("Submit"):
        oc.eval("setenv('GNUTERM', 'gnuplot')")
        d = workspace_variables['d']
        dTSS_T = workspace_variables['dTSS_T']
        Ic_line_mag_Td = workspace_variables['Ic_line_mag_Td']
        Ic_line_ang_Td = workspace_variables['Ic_line_ang_Td']
        Ir_line_mag_Td = workspace_variables['Ir_line_mag_Td']
        Ir_line_ang_Td = workspace_variables['Ir_line_ang_Td']
        If_line_mag_Td = workspace_variables['If_line_mag_Td']
        If_line_ang_Td = workspace_variables['If_line_ang_Td']
        Vc_mag_Td = workspace_variables['Vc_mag_Td']
        Vc_ang_Td = workspace_variables['Vc_ang_Td']
        VR_mag_Td = workspace_variables['VR_mag_Td']
        VR_ang_Td = workspace_variables['VR_ang_Td']
        Vf_mag_Td = workspace_variables['Vf_mag_Td']
        Vf_ang_Td = workspace_variables['Vf_ang_Td']
        z1 = workspace_variables['z1']
        y = workspace_variables['y']
        dTSS_M = workspace_variables['dTSS_M']
        Ic_line_mag_Md = workspace_variables['Ic_line_mag_Md']
        Ic_line_ang_Md = workspace_variables['Ic_line_ang_Md']
        Ir_line_mag_Md = workspace_variables['Ir_line_mag_Md']
        Ir_line_ang_Md = workspace_variables['Ir_line_ang_Md']
        If_line_mag_Md = workspace_variables['If_line_mag_Md']
        If_line_ang_Md = workspace_variables['If_line_ang_Md']
        Vc_mag_Md = workspace_variables['Vc_mag_Md']
        Vc_ang_Md = workspace_variables['Vc_ang_Md']
        VR_mag_Md = workspace_variables['VR_mag_Md']
        VR_ang_Md = workspace_variables['VR_ang_Md']
        Vf_mag_Md = workspace_variables['Vf_mag_Md']
        Vf_ang_Md = workspace_variables['Vf_ang_Md']

        oc.push('d', d)
        oc.push('dTSS_T', dTSS_T)
        oc.push('Ic_line_mag_Td', Ic_line_mag_Td)
        oc.push('Ic_line_ang_Td', Ic_line_ang_Td)
        oc.push('Ir_line_mag_Td', Ir_line_mag_Td)
        oc.push('Ir_line_ang_Td', Ir_line_ang_Td)
        oc.push('If_line_mag_Td', If_line_mag_Td)
        oc.push('If_line_ang_Td', If_line_ang_Td)
        oc.push('Vc_mag_Td', Vc_mag_Td)
        oc.push('Vc_ang_Td', Vc_ang_Td)
        oc.push('VR_mag_Td', VR_mag_Td)
        oc.push('VR_ang_Td', VR_ang_Td)
        oc.push('Vf_mag_Td', Vf_mag_Td)
        oc.push('Vf_ang_Td', Vf_ang_Td)
        oc.push('z1', z1)
        oc.push('y', y)
        oc.push('dTSS_M', dTSS_M)
        oc.push('Ic_line_mag_Md', Ic_line_mag_Md)
        oc.push('Ic_line_ang_Md', Ic_line_ang_Md)
        oc.push('Ir_line_mag_Md', Ir_line_mag_Md)
        oc.push('Ir_line_ang_Md', Ir_line_ang_Md)
        oc.push('If_line_mag_Md', If_line_mag_Md)
        oc.push('If_line_ang_Md', If_line_ang_Md)
        oc.push('Vc_mag_Md', Vc_mag_Md)
        oc.push('Vc_ang_Md', Vc_ang_Md)
        oc.push('VR_mag_Md', VR_mag_Md)
        oc.push('VR_ang_Md', VR_ang_Md)
        oc.push('Vf_mag_Md', Vf_mag_Md)
        oc.push('Vf_ang_Md', Vf_ang_Md)

        oc.eval(f"voltage_variation_over_day_final({total_distance_from_start_point},d, dTSS_T, Ic_line_mag_Td, Ic_line_ang_Td, Ir_line_mag_Td, Ir_line_ang_Td, If_line_mag_Td, If_line_ang_Td, Vc_mag_Td, Vc_ang_Td, VR_mag_Td, VR_ang_Td, Vf_mag_Td, Vf_ang_Td, z1, y, dTSS_M, Ic_line_mag_Md, Ic_line_ang_Md, Ir_line_mag_Md, Ir_line_ang_Md, If_line_mag_Md, If_line_ang_Md, Vc_mag_Md, Vc_ang_Md, VR_mag_Md, VR_ang_Md, Vf_mag_Md, Vf_ang_Md)")
        image_path = '../Plots/Voltage_Profile_Distance.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="Voltage_Profile_Distance.png",  # Replace with the desired download filename
                mime="image/png"
            )


if __name__ == "__main__":
    main()