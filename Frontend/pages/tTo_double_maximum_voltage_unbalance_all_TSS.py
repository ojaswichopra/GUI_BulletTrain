import os
import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from PIL import Image
# Create an Oct2Py instance once
from pages.tTo_double_Workspace import tTo_double_workspace
from oct2py import Oct2Py
oc = Oct2Py() 
oc.eval('cd("../tTo_Double_track")') 

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

    st.markdown("<h1 class='title'>Maximum voltage unbalance of all TSS</h1>", unsafe_allow_html=True)
    add_vertical_space(1)

    if st.button("Show maximum voltage unbalance of all TSS"):
        oc.eval("setenv('GNUTERM', 'gnuplot')")

        TSS = tTo_double_workspace['TSS']
        N_TSS_O = tTo_double_workspace['N_TSS_O']
        dTSS_T_up = tTo_double_workspace['dTSS_T_up']
       
        oc.push('TSS', TSS)
        oc.push('N_TSS_O', N_TSS_O)
        oc.push('dTSS_T_up', dTSS_T_up)

        Unb = tTo_double_workspace['Unb']
        tt_time = tTo_double_workspace['tt_time']
       
        oc.push('Unb', Unb)
        oc.push('tt_time', tt_time)
        
                
        oc.eval(f"TSS_maximum_voltage_unbalance_outage(TSS, N_TSS_O, dTSS_T_up, Unb, tt_time)")
        image_path = '../Plots_tTo_double/TSS_maximum_voltage_unbalance_outage.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="TSS_maximum_voltage_unbalance_outage.png",  # Replace with the desired download filename
                mime="image/png"
            )


if __name__ == "__main__":
    main()
    # if st.button("Back"):
    #     st.switch_page("pages/Load_Flow_Output.py")
    st.markdown(
        f"""
        <a href="/tTo_output_options_double" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
