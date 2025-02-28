import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from PIL import Image
# Create an Oct2Py instance once
from pages.normal_workspace import normal_variables
import pages.OHE_config as OHE_config
from oct2py import Oct2Py
oc = Oct2Py() 
oc.eval('cd("../OHE_temp/normal")') 
 
title = "Output Options"
page_icon = ":bullet_train:"  # emojis: https://www.webfx.com/tools/emoji-cheat-sheet/
layout = "centered"

selection = None

def main():

    # Settings
    st.set_page_config(page_title=title, page_icon=page_icon, layout=layout)
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
    st.markdown("<h1 class='title'>Normal Condition - Down Track</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    col1, col2 = st.columns(2)

    with col1:
        if st.button('OHE Temperature at a particular time instant for the entire track'):
            st.switch_page("pages/OHE_normal_down_track_time.py")
    
    with col2:
        if st.button('OHE Temperature at a particular distance for the entire duration of train simulation'):
            st.switch_page("pages/OHE_normal_down_track_dist.py")

    
if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/OHE_output_normal_options" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )