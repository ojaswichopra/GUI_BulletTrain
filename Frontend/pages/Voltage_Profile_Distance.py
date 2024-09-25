import os
import streamlit as st
from PIL import Image
# Create an Oct2Py instance once


def main():
    # if 'oc' in st.session_state:
    #     st.success("OC Instance up and running") #checking instance 


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

    #AT_MVA_profile.png -> name of plot in backend

    st.markdown("<h1 class='title'>MVA Profile of TSS</h1>", unsafe_allow_html=True)


    total_distance_from_start_point = st.number_input("Enter the distance (in Km) from starting point at which the voltage profile over entire durations of train scheduling needs to be investigated'", min_value=0)
    
    if st.button("Submit"):
        st.session_state.oc.eval("setenv('GNUTERM', 'gnuplot')")
        d = st.session_state.oc.pull('d')
        dTSS_T = st.session_state.oc.pull('dTSS_T')
        Ic_line_mag_Td = st.session_state.oc.pull('Ic_line_mag_Td')
        Ic_line_ang_Td = st.session_state.oc.pull('Ic_line_ang_Td')
        Ir_line_mag_Td = st.session_state.oc.pull('Ir_line_mag_Td')
        Ir_line_ang_Td = st.session_state.oc.pull('Ir_line_ang_Td')
        If_line_mag_Td = st.session_state.oc.pull('If_line_mag_Td')
        If_line_ang_Td = st.session_state.oc.pull('If_line_ang_Td')
        Vc_mag_Td = st.session_state.oc.pull('Vc_mag_Td')
        Vc_ang_Td = st.session_state.oc.pull('Vc_ang_Td')
        VR_mag_Td = st.session_state.oc.pull('VR_mag_Td')
        VR_ang_Td = st.session_state.oc.pull('VR_ang_Td')
        Vf_mag_Td = st.session_state.oc.pull('Vf_mag_Td')
        Vf_ang_Td = st.session_state.oc.pull('Vf_ang_Td')
        z1 = st.session_state.oc.pull('z1')
        y = st.session_state.oc.pull('y')

        dTSS_M = st.session_state.oc.pull('dTSS_M')
        Ic_line_mag_Md = st.session_state.oc.pull('Ic_line_mag_Md')
        Ic_line_ang_Md = st.session_state.oc.pull('Ic_line_ang_Md')
        Ir_line_mag_Md = st.session_state.oc.pull('Ir_line_mag_Md')
        Ir_line_ang_Md = st.session_state.oc.pull('Ir_line_ang_Md')
        If_line_mag_Md = st.session_state.oc.pull('If_line_mag_Md')
        If_line_ang_Md = st.session_state.oc.pull('If_line_ang_Md')
        Vc_mag_Md = st.session_state.oc.pull('Vc_mag_Md')
        Vc_ang_Md = st.session_state.oc.pull('Vc_ang_Md')
        VR_mag_Md = st.session_state.oc.pull('VR_mag_Md')
        VR_ang_Md = st.session_state.oc.pull('VR_ang_Md')
        Vf_mag_Md = st.session_state.oc.pull('Vf_mag_Md')
        Vf_ang_Md = st.session_state.oc.pull('Vf_ang_Md')
        st.session_state.oc.eval(f"voltage_variation_over_day_final({total_distance_from_start_point},d, dTSS_T, Ic_line_mag_Td, Ic_line_ang_Td, Ir_line_mag_Td, Ir_line_ang_Td, If_line_mag_Td, If_line_ang_Td, Vc_mag_Td, Vc_ang_Td, VR_mag_Td, VR_ang_Td, Vf_mag_Td, Vf_ang_Td, z1, y, dTSS_M, Ic_line_mag_Md, Ic_line_ang_Md, Ir_line_mag_Md, Ir_line_ang_Md, If_line_mag_Md, If_line_ang_Md, Vc_mag_Md, Vc_ang_Md, VR_mag_Md, VR_ang_Md, Vf_mag_Md, Vf_ang_Md)")
        image_path = '../Plots/Voltage_Profile_Distance.png'
        img = Image.open(image_path)
        st.image(img, caption="Voltage_Profile_Distance", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="Voltage_Profile_Distance.png",  # Replace with the desired download filename
                mime="image/png"
            )


if __name__ == "__main__":
    main()
