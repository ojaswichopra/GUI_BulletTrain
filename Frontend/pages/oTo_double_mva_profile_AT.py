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

    st.markdown("<h1 class='title'>MVA profile of AT</h1>", unsafe_allow_html=True)
    add_vertical_space(1)

    AT_input_no = st.number_input("Enter the AT number to see its MVA profile", min_value=0)
    direction = st.radio("Select the direction of the train", ('UP', 'DOWN'))

    if(direction == "UP"):
        AT_UP_down = 1
    else:
        AT_UP_down = 2

    if st.button("Show MVA profile of AT"):
        oc.eval("setenv('GNUTERM', 'gnuplot')")

        AT_mva_mag_up = oTo_double_workspace['AT_mva_mag_up']
        AT_mva_mag_down = oTo_double_workspace['AT_mva_mag_down']
        tt_time = oTo_double_workspace['tt_time']
       
        oc.push('AT_mva_mag_up', AT_mva_mag_up)
        oc.push('AT_mva_mag_down', AT_mva_mag_down)
        oc.push('tt_time', tt_time)

                
        oc.eval(f"AT_MVA_profile_outage({AT_input_no}, {AT_UP_down}, AT_mva_mag_up, AT_mva_mag_down, tt_time)")
        image_path = '../Plots_oTo_double/AT_MVA_profile_outage.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_container_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="AT_MVA_profile_outage.png",  # Replace with the desired download filename
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
