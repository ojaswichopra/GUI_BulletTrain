import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from oct2py import Oct2Py
import os


title = "GUI Bullet Train"
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

    
    st.markdown("<h1 class='title'>Select the type of analysis</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    #col1, col2 = st.columns(2)

    # with col1:
    #     if st.button('Normal track'):
    #         st.switch_page("pages/Short_Circuit_Analysis.py")

    # with col2:
    if st.button('Double track'):
        st.switch_page("pages/SCA_double.py")



if __name__ == "__main__":
    main()
    # authenticated_menu()
    st.markdown(
        f"""
        <a href="/" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
