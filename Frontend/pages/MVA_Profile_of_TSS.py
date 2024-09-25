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


    TSS_no = st.number_input("Enter the TSS number to see its MVA profile", min_value=0)

    if st.button("Show MVA Profile"):
        st.session_state.oc.eval("setenv('GNUTERM', 'gnuplot')")
        s_apprant_power_MVA_mag = st.session_state.oc.pull('s_apprant_power_MVA_mag')
        st.session_state.oc.eval(f"TSS_MVA_profile({TSS_no}, s_apprant_power_MVA_mag)")
        image_path = '../Plots/TSS_MVA_profile.png'
        img = Image.open(image_path)
        st.image(img, caption="TSS_MVA_profile", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="AT_MVA_profile.png",  # Replace with the desired download filename
                mime="image/png"
            )


if __name__ == "__main__":
    main()
