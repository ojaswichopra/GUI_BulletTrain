import streamlit as st
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

    c1,c2 = st.columns(2)
    with c1:
        if st.button("One TSS Outage"):
            st.switch_page("pages/Execute_Load_Flow_one.py")
    
    with c2:
        if st.button("Two Adjacent TSS Outage"): 
            st.switch_page("pages/Execute_Load_Flow_two.py")


if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/Execute_Load_Flow_MA" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
