import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
import numpy as np
from oct2py import Oct2Py


def main():


    # Settings
    # st.set_page_config(page_title=title, page_icon=page_icon, layout=layout)
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
    st.markdown("<h1 class='title'>See Output</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    col1, col2 = st.columns(2)

    with col1:
        if st.button('Output of Load Flow'):
            st.switch_page("pages/Output_Loadflow_Options.py")
        if st.button('Output of Short Circuit Analysis'):
            st.switch_page("pages/SCA_output_options.py")
        # if st.button('Output of induced voltage calculations'):
        # st.switch_page("")
    
    with col2:
        if st.button('Output of OHE Temperature Rise Calculation'):
            st.switch_page("pages/OHE_output_options.py")
        if st.button('Output of harmonic analysis'):
            st.switch_page("pages/Harmonic_output.py")
            
    c1,c2,c3,c4 = st.columns(4)
    with c2:
        if st.button('Output of induced voltage calculations'):
            st.switch_page("pages/IVV_output_options.py")
        

if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/Landing" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )