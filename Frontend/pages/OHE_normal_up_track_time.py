import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from PIL import Image
# Create an Oct2Py instance once
from pages.normal_workspace import normal_variables
import pages.OHE_config as OHE_config
from oct2py import Oct2Py
oc = Oct2Py() 
oc.eval('cd("../OHE_temp/normal")') 
import os

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

    st.markdown("<h1 class='title'>OHE Temperature at a particular time instant for the entire track</h1>", unsafe_allow_html=True)
    add_vertical_space(1)

    time_instant = st.number_input("Enter the time instant (in second) at which OHE temperature along the track needs to be observed", min_value=0)

    if st.button("Submit"):
        if os.path.isfile('../OHE_temp/normal/OHE_temp_up_track_variables.mat'):
            oc.eval("setenv('GNUTERM', 'gnuplot')")
            oc.eval(f"OHE_temp_cal_up_track_time({time_instant})")
            image_path = '../Plots_OHE/OHE_temp_cal_up_track_time.png'
            img = Image.open(image_path)
            st.image(img, caption="", use_container_width=True)

            with open(image_path, "rb") as file:
                btn = st.download_button(
                    label="Download Plot",
                    data=file,
                    file_name="OHE_temp_cal_up_track_time.png",  # Replace with the desired download filename
                    mime="image/png"
                )
        else:
            st.warning("Please run the Calculation!")


if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/OHE_output_normal_up_track" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
