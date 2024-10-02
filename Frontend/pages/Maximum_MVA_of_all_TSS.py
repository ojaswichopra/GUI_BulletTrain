
import os
import streamlit as st
from PIL import Image
# Create an Oct2Py instance once
from pages.workspace import workspace_variables
from streamlit_extras.add_vertical_space import add_vertical_space
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

    st.markdown("<h1 class='title'>Maximum MVA of all TSS</h1>", unsafe_allow_html=True)


    s_apprant_power_MVA_mag = workspace_variables['s_apprant_power_MVA_mag']
    # st.write(AT_mva_mag)
    oc.push('s_apprant_power_MVA_mag', s_apprant_power_MVA_mag)
    maximum_mva_tss = oc.eval(f"TSS_maximum_MVA(s_apprant_power_MVA_mag)")
    add_vertical_space(3)
    st.write(maximum_mva_tss)

if __name__ == "__main__":
    main()
    if st.button("Back"):
        st.switch_page("pages/Load_Flow_Output.py")
