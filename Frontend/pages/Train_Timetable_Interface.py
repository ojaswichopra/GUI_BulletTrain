import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
import os


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
    st.markdown("<h1 class='title'>Execute Load Flow</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    c1,c2 = st.columns(2)
    with c1:
        if st.button("Run Section"):
            st.switch_page("pages/Train_Timetable.py")
        
    
    with c2:
        if st.button("Final Compile"):
            st.switch_page("")


if __name__ == "__main__":
    main()
    # Adding a styled back button
    st.markdown(
        f"""
        <a href="/Landing" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
