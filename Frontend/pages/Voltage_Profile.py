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


    track_time_1 = st.number_input("Enter the TSS number for which track voltage profile needs to be check", min_value=0)
    x_reso = st.number_input("Enter the distance resolution (in meter)", min_value=0)
    
    if st.button("Submit"):
        st.session_state.oc.eval("setenv('GNUTERM', 'gnuplot')")
        TSS = st.session_state.oc.pull('TSS')
        d = st.session_state.oc.pull('d')
        y = st.session_state.oc.pull('y')
        Vc_mag_Td = st.session_state.oc.pull('Vc_mag_Td')
        Vc_ang_Td = st.session_state.oc.pull('Vc_ang_Td')
        VR_mag_Td = st.session_state.oc.pull('VR_mag_Td')
        VR_ang_Td = st.session_state.oc.pull('VR_ang_Td')
        Vf_mag_Td = st.session_state.oc.pull('Vf_mag_Td')
        Vf_ang_Td = st.session_state.oc.pull('Vf_ang_Td')
        dTSS_T = st.session_state.oc.pull('dTSS_T')
        Ic_line_mag_Td = st.session_state.oc.pull('Ic_line_mag_Td')
        Ic_line_ang_Td = st.session_state.oc.pull('Ic_line_ang_Td')
        Ir_line_mag_Td = st.session_state.oc.pull('Ir_line_mag_Td')
        Ir_line_ang_Td = st.session_state.oc.pull('Ir_line_ang_Td')
        If_line_mag_Td = st.session_state.oc.pull('If_line_mag_Td')
        If_line_ang_Td = st.session_state.oc.pull('If_line_ang_Td')
        z1 = st.session_state.oc.pull('z1')
        Vc_mag_Md = st.session_state.oc.pull('Vc_mag_Md')
        Vc_ang_Md = st.session_state.oc.pull('Vc_ang_Md')
        VR_mag_Md = st.session_state.oc.pull('VR_mag_Md')
        VR_ang_Md = st.session_state.oc.pull('VR_ang_Md')
        Vf_mag_Md = st.session_state.oc.pull('Vf_mag_Md')
        Vf_ang_Md = st.session_state.oc.pull('Vf_ang_Md')
        dTSS_M = st.session_state.oc.pull('dTSS_M')
        Ic_line_mag_Md = st.session_state.oc.pull('Ic_line_mag_Md')
        Ic_line_ang_Md = st.session_state.oc.pull('Ic_line_ang_Md')
        Ir_line_mag_Md = st.session_state.oc.pull('Ir_line_mag_Md')
        Ir_line_ang_Md = st.session_state.oc.pull('Ir_line_ang_Md')
        If_line_mag_Md = st.session_state.oc.pull('If_line_mag_Md')
        If_line_ang_Md = st.session_state.oc.pull('If_line_ang_Md')

        # st.session_state.oc.eval(f"Full_track_voltage_profile_instant_t({track_time_1},{x_reso},d, TSS, y, Vc_mag_Td, Vc_ang_Td, VR_mag_Td, VR_ang_Td, Vf_mag_Td, Vf_ang_Td, dTSS_T, Ic_line_mag_Td, Ic_line_ang_Td, Ir_line_mag_Td, Ir_line_ang_Td, If_line_mag_Td, If_line_ang_Td, z1, Vc_mag_Md, Vc_ang_Md, VR_mag_Md, VR_ang_Md, Vf_mag_Md, Vf_ang_Md, dTSS_M,Ic_line_mag_Md,Ic_line_ang_Md,Ir_line_mag_Md,Ir_line_ang_Md,If_line_mag_Md,If_line_ang_Md)")
        image_path = '../Plots/Full_track_voltage_profile_instant_t.png'
        img = Image.open(image_path)
        st.image(img, caption="Full_track_voltage_profile_instant_t", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="Full_track_voltage_profile_instant_t.png",  # Replace with the desired download filename
                mime="image/png"
            )
        
    if os.path.isfile('../backend_codes/Voltage_distance_matrix_whole.mat'):
        AT = st.session_state.oc.pull('AT')
        TSS = st.session_state.oc.pull('TSS')
        col1, col2 = st.columns(2)
        st.session_state.oc.eval(f"load('Voltage_distance_matrix_whole.mat')")
        Voltage_distance_matrix_whole = st.session_state.oc.pull('Voltage_distance_matrix_whole')
        with col1:
            if st.button("Voltage profile of all TSSs at the entered time instant"):
                st.session_state.oc.eval(f"voltage_profile_design_predetermine_TSS(Voltage_distance_matrix_whole,AT,TSS)")
                image_path = '../Plots/voltage_profile_design_predetermine_TSS.png'
                img = Image.open(image_path)
                st.image(img, caption="voltage_profile_design_predetermine_TSS", use_column_width=True)

                with open(image_path, "rb") as file:
                    btn = st.download_button(
                        label="Download Plot",
                        data=file,
                        file_name="voltage_profile_design_predetermine_TSS.png",  # Replace with the desired download filename
                        mime="image/png"
                    )

        with col2:
            if st.button("Voltage profile of all ATs at the entered time instant"):
                st.session_state.oc.eval(f"voltage_profile_design_predetermine_AT(Voltage_distance_matrix_whole,AT,TSS)")
                image_path = '../Plots/voltage_profile_design_predetermine_AT.png'
                img = Image.open(image_path)
                st.image(img, caption="voltage_profile_design_predetermine_AT", use_column_width=True)

                with open(image_path, "rb") as file:
                    btn = st.download_button(
                        label="Download Plot",
                        data=file,
                        file_name="voltage_profile_design_predetermine_AT.png",  # Replace with the desired download filename
                        mime="image/png"
                            )
            

if __name__ == "__main__":
    main()
