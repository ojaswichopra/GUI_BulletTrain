import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from oct2py import Oct2Py
import os
from pages.workspace import workspace_variables
from pages.EN_workspace import en_workspace
import numpy as np



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
    </style>
    """,
        unsafe_allow_html=True,
    )

    
    st.markdown("<h1 class='title'>Select the output module</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    col1, col2 = st.columns(2)

    with col1:
        if st.button('Output of load flow'):
            st.switch_page("pages/Output_Load_Flow.py")
        if st.button('Output of short circuit analysis'):
            st.switch_page("")
        if st.button('Output of induced voltage calculation'):
            st.switch_page("")
    
    with col2:
        if st.button('Output of OHE temperature rise calculation'):
            st.switch_page("")
        if st.button('Output of harmonic analysis'):
            st.switch_page("")

if __name__ == "__main__":
    main()