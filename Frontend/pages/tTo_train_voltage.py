import os
import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
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

    st.markdown("<h1 class='title'>Train voltage profile</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    train_number = st.number_input("Enter the train number", min_value=0)
    
    if(st.button("Show train voltage profile")):
        oc.eval("setenv('GNUTERM', 'gnuplot')")
        N_train_per_hour = tTo_workspace['N_train_per_hour']
        oc.push('N_train_per_hour', N_train_per_hour)
        each_stop_train_data = tTo_workspace['each_stop_train_data']
        oc.push('each_stop_train_data', each_stop_train_data)
        d = tTo_workspace['d']
        oc.push('d', d)
        N_TSS_O = tTo_workspace['N_TSS_O']
        oc.push('N_TSS_O', N_TSS_O)
        N_TSS = tTo_workspace['N_TSS']
        oc.push('N_TSS', N_TSS)
        Vc_mag_Td = tTo_workspace['Vc_mag_Td']
        oc.push('Vc_mag_Td', Vc_mag_Td)
        VR_mag_Td = tTo_workspace['VR_mag_Td']
        oc.push('VR_mag_Td', VR_mag_Td)
        Vf_mag_Td = tTo_workspace['Vf_mag_Td']
        oc.push('Vf_mag_Td', Vf_mag_Td)
        Vc_ang_Td = tTo_workspace['Vc_ang_Td']
        oc.push('Vc_ang_Td', Vc_ang_Td)
        VR_ang_Td = tTo_workspace['VR_ang_Td']
        oc.push('VR_ang_Td', VR_ang_Td)
        Vf_ang_Td = tTo_workspace['Vf_ang_Td']
        oc.push('Vf_ang_Td', Vf_ang_Td)
        Vc_mag_Md = tTo_workspace['Vc_mag_Md']
        oc.push('Vc_mag_Md', Vc_mag_Md)
        VR_mag_Md = tTo_workspace['VR_mag_Md']
        oc.push('VR_mag_Md', VR_mag_Md)
        Vf_mag_Md = tTo_workspace['Vf_mag_Md']
        oc.push('Vf_mag_Md', Vf_mag_Md)
        Vc_ang_Md = tTo_workspace['Vc_ang_Md']
        oc.push('Vc_ang_Md', Vc_ang_Md)
        VR_ang_Md = tTo_workspace['VR_ang_Md']
        oc.push('VR_ang_Md', VR_ang_Md)
        Vf_ang_Md = tTo_workspace['Vf_ang_Md']
        oc.push('Vf_ang_Md', Vf_ang_Md)
        dTSS = tTo_workspace['dTSS']
        oc.push('dTSS', dTSS)
        y = tTo_workspace['y']
        oc.push('y', y)
        
        oc.eval(f"train_voltage_profile_train_number_adjacent_outage_load_file({train_number}, N_train_per_hour, each_stop_train_data, d, N_TSS_O, N_TSS, Vc_mag_Td, VR_mag_Td, Vf_mag_Td, Vc_ang_Td, VR_ang_Td, Vf_ang_Td, Vc_mag_Md, VR_mag_Md, Vf_mag_Md, Vc_ang_Md, VR_ang_Md, Vf_ang_Md, dTSS, y)")
        image_path = '../Plots_tTo/tTo_train_voltage.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_container_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="tTo_train_voltage_profile.png",  # Replace with the desired download filename
                mime="image/png"
            )


if __name__ == "__main__":
    main()
    # if st.button("Back"):
    #     st.switch_page("pages/tTo_output_options.py")
    st.markdown(
        f"""
        <a href="/tTo_output_options" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
