import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
import pandas as pd
import os
# import OHE_config
import pages.OHE_config as OHE_config


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

    st.markdown("<h1 class='title'>Calculate OHE Temperature Rise</h1>", unsafe_allow_html=True)
    add_vertical_space(1)

    # Input fields for the variables
    OHE_config.Q_s = st.number_input("Global Solar Radiation in w/m^2", value=1000.0, min_value=1.0, step=0.01)
    OHE_config.T_a = st.number_input("Ambient Air Temperature in Degree Celcius", value=40.0, min_value=0.1, step=0.01)
    OHE_config.V_w = st.number_input("Wind Speed in m/s", value=0.6, min_value=0.1, step=0.1)  # Change value to float
    OHE_config.theta = st.number_input("Angle Between Wind Direction and Conductor Axis in Degree (perpendicular wind direction)", value=90.0, min_value=0.0,  step=0.01)
    OHE_config.e = st.number_input("Emissivity", value=0.8, min_value=0.0, step=0.01)
    OHE_config.a = st.number_input("Absorptivity", value=0.8, min_value=0.0, step=0.01)
    
    OHE_config.T_0 = st.number_input("Temperature (deg cel) at which OHE Resistances are specified", value=20.0, min_value=0.0, step=0.01)
    
    OHE_config.mCp_c = st.number_input("Total Heat Capacity of contact wire in J/m-deg cel ", value=1310.0, min_value=0.0, step=0.0001)
    OHE_config.mCp_r = st.number_input("Total Heat Capacity of rail in J/m-deg cel", value=1310.0, min_value=0.0, step=0.000001)
    OHE_config.mCp_f = st.number_input("Total Heat Capacity of feeder wire in J/m-deg cel", value=1310.0, min_value=0.0, step=0.000001)
    
    OHE_config.alpha_c = st.number_input(
    "Temperature Coefficient of resistance (per deg cel) of contact wire", 
    value=0.004, 
    min_value=0.0, 
    step=0.001, 
    format="%.3f"
    )

    OHE_config.alpha_r = st.number_input(
        "Temperature Coefficient of resistance (per deg cel) of rail wire", 
        value=0.003, 
        min_value=0.0, 
        step=0.001, 
        format="%.3f"
    )

    OHE_config.alpha_f = st.number_input(
        "Temperature Coefficient of resistance (per deg cel) of feeder wire", 
        value=0.004, 
        min_value=0.0, 
        step=0.001, 
        format="%.3f"
    )

    
    if st.button("Submit"):
            st.switch_page("pages/OHE_options.py")

if __name__ == "__main__":
    main()
    # Adding a styled back button
    st.markdown(
        f"""
        <a href="/" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )


