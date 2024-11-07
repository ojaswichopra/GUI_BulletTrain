import os
import streamlit as st
from PIL import Image
# Create an Oct2Py instance once
from pages.oTo_Workspace import oTo_workspace
from oct2py import Oct2Py
oc = Oct2Py() 
oc.eval('cd("../one_TSS_outage")') 

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

    st.markdown("<h1 class='title'>TSS MVA Profile and unbalance profile</h1>", unsafe_allow_html=True)

    train_number = st.number_input("Enter the train number", min_value=0)

    oc.eval("setenv('GNUTERM', 'gnuplot')")

    TSS = oTo_workspace['TSS']
    oc.push('TSS', TSS)
    N_TSS_O = oTo_workspace['N_TSS_O']
    oc.push('N_TSS_O', N_TSS_O)
    dTSS_T = oTo_workspace['dTSS_T']
    oc.push('dTSS_T', dTSS_T)
    s_apprant_power_MVA_mag = oTo_workspace['s_apprant_power_MVA_mag']
    oc.push('s_apprant_power_MVA_mag', s_apprant_power_MVA_mag)
    Mva_sec_abs = oTo_workspace['Mva_sec_abs']
    oc.push('Mva_sec_abs', Mva_sec_abs)
    Unb = oTo_workspace['Unb']
    oc.push('Unb', Unb)
    tt_time = oTo_workspace['tt_time']
    oc.push('tt_time', tt_time)

    

    oc.eval(f"train_voltage_profile_with_train_number_outage_load_txt({train_number}, N_train_per_hour, each_stop_train_data, d, N_TSS_O, N_TSS, Vc_mag_Td, VR_mag_Td, Vf_mag_Td, Vc_ang_Td, VR_ang_Td, Vf_ang_Td, Vc_mag_Md, VR_mag_Md, Vf_mag_Md, Vc_ang_Md, VR_ang_Md, Vf_ang_Md, dTSS, y)")
    image_path = '../Plots/oTo_train_voltage_profile.png'
    img = Image.open(image_path)
    st.image(img, caption="", use_column_width=True)

    with open(image_path, "rb") as file:
        btn = st.download_button(
            label="Download Plot",
            data=file,
            file_name="oTo_train_voltage_profile.png",  # Replace with the desired download filename
            mime="image/png"
        )


if __name__ == "__main__":
    main()
    if st.button("Back"):
        st.switch_page("pages/oTo_output_options.py")
