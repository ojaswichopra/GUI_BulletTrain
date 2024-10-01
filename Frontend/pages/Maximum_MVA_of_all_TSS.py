
# 6. Maximum MVA of all TSS


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

    st.markdown("<h1 class='title'>Maximum MVA of all TSS</h1>", unsafe_allow_html=True)


    if st.button("Show maximum MVA of all TSS"):
        s_apprant_power_MVA_mag = st.session_state.oc.pull('s_apprant_power_MVA_mag')
        maximum_mva_tss = st.session_state.oc.eval(f"TSS_maximum_MVA(s_apprant_power_MVA_mag)")
        st.table(maximum_mva_tss)

if __name__ == "__main__":
    main()
