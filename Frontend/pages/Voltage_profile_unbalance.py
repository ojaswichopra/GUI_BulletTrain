# Voltage unbalance profile of TSS
import os
import streamlit as st
from PIL import Image
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

    #.png -> name of plot in backend

    st.markdown("<h1 class='title'>Voltage unbalance profile of TSS</h1>", unsafe_allow_html=True)
    
    TSS_input_no = st.number_input("Enter the TSS number to see its voltage unbalance profile.", min_value=0)

    if st.button("Show TSS voltage unbalance profile"):
        oc.eval("setenv('GNUTERM', 'gnuplot')")
        Unb = workspace_variables['Unb']
        oc.push('Unb', Unb)
        oc.eval(f"TSS_voltage_unbalance_profile({int(TSS_input_no)}, Unb)")
        image_path = '../Plots/TSS_voltage_unbalance_profile.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="TSS_voltage_unbalance_profile.png",  # Replace with the desired download filename
                mime="image/png"
            )



if __name__ == "__main__":
    main()
    if st.button("Back"):
        st.switch_page("pages/Load_Flow_Output.py")