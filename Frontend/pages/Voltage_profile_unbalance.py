# Voltage unbalance profile of TSS

import os
import streamlit as st
from PIL import Image

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

    #.png -> name of plot in backend

    st.markdown("<h1 class='title'>Voltage unbalance profile of TSS</h1>", unsafe_allow_html=True)
    
    TSS_input_no = st.number_input("Enter the TSS number to see its voltage unbalance profile.", min_value=0)

    if st.button("Show TSS voltage unbalance profile"):
        st.session_state.oc.eval("setenv('GNUTERM', 'gnuplot')")
        Unb = st.session_state.oc.pull('Unb')
        st.session_state.oc.eval(f"TSS_voltage_unbalance_profile({int(TSS_input_no)}, Unb)")
        image_path = '../Plots/TSS_voltage_unbalance_profile.png'
        img = Image.open(image_path)
        st.image(img, caption="AT maximum MVA of all AT", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="TSS_voltage_unbalance_profile.png",  # Replace with the desired download filename
                mime="image/png"
            )



if __name__ == "__main__":
    main()