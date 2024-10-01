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

    st.markdown("<h1 class='title'>MVA Profile of TSS</h1>", unsafe_allow_html=True)


    TSS_no = st.number_input("Enter the TSS number to see its MVA profile", min_value=0)

    if st.button("Show MVA Profile"):
        oc.eval("setenv('GNUTERM', 'gnuplot')")
        s_apprant_power_MVA_mag = workspace_variables['s_apprant_power_MVA_mag']
        oc.push('s_apprant_power_MVA_mag', s_apprant_power_MVA_mag)
        oc.eval(f"TSS_MVA_profile({TSS_no}, s_apprant_power_MVA_mag)")
        image_path = '../Plots/TSS_MVA_profile.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="AT_MVA_profile.png",  # Replace with the desired download filename
                mime="image/png"
            )


if __name__ == "__main__":
    main()
