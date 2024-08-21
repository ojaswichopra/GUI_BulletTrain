import streamlit as st
from streamlit_option_menu import option_menu
from streamlit_extras.add_vertical_space import add_vertical_space
import streamlit_shadcn_ui as ui

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
    </style>
    """,
        unsafe_allow_html=True,
    )
    
    add_vertical_space(5)
    col1, col2 = st.columns(2)

    with col1:
        if st.button('Make system data'):
            st.write("Button 1 clicked!")
        if st.button('Execute load flow'):
            st.write("Button 3 clicked!")
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
            st.write("Button 1 clicked!")


if __name__ == "__main__":
    main()
    # authenticated_menu()
