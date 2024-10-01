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


    no_of_train = st.number_input("Enter the number of trains running per hour", min_value=0)
    train_number = st.number_input("Enter the train number to see its voltage profile", min_value=0)
    
    if st.button("Submit"):
        st.session_state.oc.eval("setenv('GNUTERM', 'gnuplot')")
        train_data = st.session_state.oc.pull('train_data')
        d = st.session_state.oc.pull('d')
        dTSS = st.session_state.oc.pull('dTSS')
        y = st.session_state.oc.pull('y')
        Vc_mag_Td = st.session_state.oc.pull('Vc_mag_Td')
        Vc_ang_Td = st.session_state.oc.pull('Vc_ang_Td')
        VR_mag_Td = st.session_state.oc.pull('VR_mag_Td')
        VR_ang_Td = st.session_state.oc.pull('VR_ang_Td')
        Vc_mag_Md = st.session_state.oc.pull('Vc_mag_Md')
        Vc_ang_Md = st.session_state.oc.pull('Vc_ang_Md')
        VR_mag_Md = st.session_state.oc.pull('VR_mag_Md')
        VR_ang_Md = st.session_state.oc.pull('VR_ang_Md')
        st.session_state.oc.eval(f"train_voltage_profile_with_train_number({no_of_train},{train_number},train_data, d, dTSS, y, Vc_mag_Td, Vc_ang_Td, VR_mag_Td, VR_ang_Td, Vc_mag_Md, Vc_ang_Md, VR_mag_Md, VR_ang_Md)")
        image_path = '../Plots/Voltage_Profile_Train.png'
        img = Image.open(image_path)
        st.image(img, caption="Voltage_Profile_Train", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="Voltage_Profile_Train.png",  # Replace with the desired download filename
                mime="image/png"
            )


if __name__ == "__main__":
    main()
