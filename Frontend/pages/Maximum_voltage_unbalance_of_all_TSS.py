import os
import streamlit as st
from PIL import Image
from streamlit_extras.add_vertical_space import add_vertical_space
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

    #AT_MVA_profile.png -> name of plot in backend

    st.markdown("<h1 class='title'>Maximum Voltage unbalance of all TSS</h1>", unsafe_allow_html=True)
    add_vertical_space(3)
    Unb = workspace_variables['Unb']
    oc.push('Unb', Unb)
    maximum_voltage_unbalance = oc.eval(f"TSS_maximum_voltage_unbalance(Unb)")
    st.write(maximum_voltage_unbalance)

if __name__ == "__main__":
    main()
    if st.button("Back"):
        st.switch_page("pages/Load_Flow_Output.py")
