# 7. Maximum MVA of all AT
# connecteed backend file - "AT_maximum_MVA.m".

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

    st.markdown("<h1 class='title'>Maximum MVA of all AT</h1>", unsafe_allow_html=True)

    if st.button("Show MAXIMUM MVA OF ALL AT"):
        st.session_state.oc.eval("setenv('GNUTERM', 'gnuplot')")
        AT_mva_mag = st.session_state.oc.pull('AT_mva_mag')
        AT = st.session_state.oc.pull('AT')
        st.session_state.oc.eval(f"AT_maximum_MVA(AT_mva_mag, AT)")
        image_path = '../Plots/AT_maximum_MVA.png'
        img = Image.open(image_path)
        st.image(img, caption="AT maximum MVA of all AT", use_column_width=True)


if __name__ == "__main__":
    main()
