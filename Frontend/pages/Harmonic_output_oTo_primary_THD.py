import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
import numpy as np
from oct2py import Oct2Py
from PIL import Image

oc = Oct2Py() 
oc.eval('cd("../Harmonic_output/oTo")') 

from pages.Harmonic_Workspace_oTo import harmonic_workspace_oTo

def main():


    # Settings
    # st.set_page_config(page_title=title, page_icon=page_icon, layout=layout)
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
    
    st.markdown("<h1 class='title'>TSS primary side voltage THD profile</h1>", unsafe_allow_html=True)
    add_vertical_space(1)

    TSS_No = st.number_input("Enter the TSS number to see its primary side voltage THD profile", min_value=1)

    if st.button("Submit"):
        oc.eval("setenv('GNUTERM', 'gnuplot')")

        N_TSS = harmonic_workspace_oTo['N_TSS']
        oc.push('N_TSS', N_TSS)

        y = harmonic_workspace_oTo['y']
        oc.push('y', y)
        
        N_TSS_O = harmonic_workspace_oTo['N_TSS_O']
        oc.push('N_TSS_O', N_TSS_O)
        
        oc.eval(f"TSS_THD_profile(N_TSS, y, N_TSS_O, {TSS_No})")        

        image_path = '../Plots_harmonic/TSS_THD_profile_oTo.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_container_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="TSS_THD_profile_oTo.png",  # Replace with the desired download filename
                mime="image/png"
            )


if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/Harmonic_output_oTo" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )