import os
import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from PIL import Image
import numpy as np


def main():
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
        .custom-button {
                display: inline-block;
                text-decoration: none;
                padding: 10px 30px;
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
    
    
    
    st.markdown("<h1 class='title'>Output of Short Circuit Analysis</h1>", unsafe_allow_html=True)

    col1, col2 = st.columns(2)
    with col1:
        if st.button('Voltage Profile of the track at the time instant of fault'):
            image_path = '../Plots_SCA/voltage_profile.png'
            img = Image.open(image_path)
            st.image(img, caption="", use_column_width=True)

            with open(image_path, "rb") as file:
                btn = st.download_button(
                    label="Download Plot",
                    data=file,
                    file_name="voltage_profile_SCA.png",  # Replace with the desired download filename
                    mime="image/png"
                )

    with col2:
        if st.button('Line Current Profile of the track at the time instant of fault'):
            image_path = '../Plots_SCA/current_profile.png'
            img = Image.open(image_path)
            st.image(img, caption="", use_column_width=True)

            with open(image_path, "rb") as file:
                btn = st.download_button(
                    label="Download Plot",
                    data=file,
                    file_name="current_profile_SCA.png",  # Replace with the desired download filename
                    mime="image/png"
                )
                
if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/Output_Options" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
