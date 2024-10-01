
# 6. Maximum voltage unbalance of all TSS


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

    st.markdown("<h1 class='title'>Maximum Voltage unbalance of all TSS</h1>", unsafe_allow_html=True)


    if st.button("Show maximum voltage unbalance of all TSS"):
        Unb = st.session_state.oc.pull('Unb')
        maximum_voltage_unbalance = st.session_state.oc.eval(f"TSS_maximum_voltage_unbalance(Unb)")
        st.table(maximum_voltage_unbalance)

if __name__ == "__main__":
    main()
