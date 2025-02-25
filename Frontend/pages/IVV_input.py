import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
import pandas as pd
import os
# import IVV_config
import pages.IVV_config as IVV_config


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

    st.markdown("<h1 class='title'>Calculate Induced Voltage</h1>", unsafe_allow_html=True)
    add_vertical_space(1)

    # Input fields for the variables
    IVV_config.victim_wire_d = st.number_input("Horizontal distance (m) of victim wire measured from rail of track-1", value=4.5, min_value=1.0, step=0.01)
    IVV_config.victim_wire_h = st.number_input("Vertical distance or height (m) of victim wire measured from rail of track-1", value=12.0, min_value=0.1, step=0.01)
    IVV_config.track_spacing = st.number_input("Distance (m) between track-1 rail and track-2 rail", value=4.0, min_value=0.1, step=0.1)  # Change value to float
    IVV_config.rad_victim_mm = st.number_input("Radius (mm) of victim wire ", value=7.5, min_value=0.0,  step=0.01)
    IVV_config.resistance_victim_wire = st.number_input("Resistance (ohm/km) of victim wire ", value=0.3, min_value=0.0, step=0.01)
    IVV_config.ke = st.number_input("Screening factor of victim wire", value=0.24, min_value=0.0, step=0.01)
    IVV_config.kt = st.number_input("Screening factor of traction conductors", value=1.0, min_value=0.0, step=0.01)

    
    if st.button("Submit"):
            st.switch_page("pages/IVV_options.py")

if __name__ == "__main__":
    main()
    # Adding a styled back button
    st.markdown(
        f"""
        <a href="/" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )


