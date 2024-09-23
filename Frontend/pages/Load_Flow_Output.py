import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from run_loadflow import oc
import os

title = "GUI Bullet Train"
page_icon = ":bullet_train:"  # emojis: https://www.webfx.com/tools/emoji-cheat-sheet/
layout = "centered"

selection = None

# sidebar page links
def authenticated_menu():
    st.sidebar.empty()
    # st.sidebar.page_link("pages/1_Listings.py", label="Companies List")  


def loadMatFile():
    oc.eval("loadMat()")


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
    
    st.markdown("<h1 class='title'>Output of Load Flow</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    col1, col2 = st.columns(2)

    with col1:
        if st.button('Voltage profile at a particular time instant'):
            st.switch_page("pages/Make_System_Data.py")
        if st.button('Voltage profile of a particular train'):
            st.switch_page("pages/Execute_Load_Flow.py")
        if st.button('MVA profile of AT'):
            st.write("Button 1 clicked!")
        if st.button('Maximum MVA of all AT'):
            st.write("Button 1 clicked!")

    with col2:
        if st.button('Voltage profile at a particular distance'):
            st.write("Button 2 clicked!")
        if st.button('MVA profile of TSS'):
            st.write("Button 4 clicked!")
        if st.button('Maximum MVA of all TSS'):
            st.write("Button 1 clicked!")
        if st.button('Voltage unbalance profile of TSS'):
            st.write("Button 1 clicked!")
    
    if st.button('Maximum voltage unbalance of all TSS'):
        st.write("Button 1 clicked!")

if __name__ == "__main__":
    main()
    loadMatFile()
    # authenticated_menu()
