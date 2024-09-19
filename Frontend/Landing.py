import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from oct2py import Oct2Py
import os

title = "GUI Bullet Train"
page_icon = ":bullet_train:"  # emojis: https://www.webfx.com/tools/emoji-cheat-sheet/
layout = "centered"

selection = None

# sidebar page links
def authenticated_menu():
    st.sidebar.empty()
    # st.sidebar.page_link("pages/1_Listings.py", label="Companies List")  


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
    
    st.markdown("<h1 class='title'>Graphical User Interface</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    col1, col2 = st.columns(2)

    with col1:
        if st.button('Make system data'):
            st.switch_page("pages/Make_System_Data.py")
        if st.button('Execute load flow'):
            st.switch_page("pages/Execute_Load_Flow.py")
        if st.button('Perform harmonic analysis'):
            st.write("Button 1 clicked!")
        if st.button('Calculate induced voltage'):
            st.write("Button 1 clicked!")

    with col2:
        if st.button('Prepare train timetable'):
            st.write("Button 2 clicked!")
        if st.button('Perform short circuit analysis'):
            st.write("Button 4 clicked!")
        if st.button('Calculate OHE temerature rise'):
            st.write("Button 1 clicked!")
        if st.button('See output'):
            oc = Oct2Py()
            oc.eval('cd("../backend\\ codes")')
            oc.eval(f"trial({1},{2})")
            print("Load flow executed successfully!")
            if os.path.isfile("../backend codes/trail.mat"):
                st.write(f"File exists.")
            else:
                st.write(f"No.")


if __name__ == "__main__":
    main()
    # authenticated_menu()
