import os
import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from PIL import Image
# Create an Oct2Py instance once
from pages.oTo_double_Workspace import oTo_double_workspace
from oct2py import Oct2Py
oc = Oct2Py() 
oc.eval('cd("../oTo_Double_track")') 

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

    #AT_MVA_profile.png -> name of plot in backend

    st.markdown("<h1 class='title'>MVA profile of TSS</h1>", unsafe_allow_html=True)
    add_vertical_space(1)

    TSS_input_no = st.number_input("Enter the TSS number to see its MVA profile", min_value=0)

    if st.button("Show MVA profile of TSS"):
        oc.eval("setenv('GNUTERM', 'gnuplot')")

        TSS = oTo_double_workspace['TSS']
        N_TSS_O = oTo_double_workspace['N_TSS_O']
        dTSS_T_up = oTo_double_workspace['dTSS_T_up']
        Unb = oTo_double_workspace['Unb']
        tt_time = oTo_double_workspace['tt_time']
        s_apprant_power_MVA_mag = oTo_double_workspace['s_apprant_power_MVA_mag']

        oc.push('s_apprant_power_MVA_mag', s_apprant_power_MVA_mag)
        oc.push('TSS', TSS)
        oc.push('N_TSS_O', N_TSS_O)
        oc.push('dTSS_T_up', dTSS_T_up)
        oc.push('Unb', Unb)
        oc.push('tt_time', tt_time)

                
        oc.eval(f"TSS_MVA_profile_outage({TSS_input_no}, s_apprant_power_MVA_mag, TSS, N_TSS_O, dTSS_T_up, Unb, tt_time)")
        image_path = '../Plots_oTo_double/TSS_MVA_profile_outage.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="TSS_MVA_profile_outage.png",  # Replace with the desired download filename
                mime="image/png"
            )


if __name__ == "__main__":
    main()
    # if st.button("Back"):
    #     st.switch_page("pages/Load_Flow_Output.py")
    st.markdown(
        f"""
        <a href="/oTo_output_options_double" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
