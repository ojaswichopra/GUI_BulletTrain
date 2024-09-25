import os
import streamlit as st
from PIL import Image
# Create an Oct2Py instance once


def main():
    # if 'oc' in st.session_state:
    #     st.success("OC Instance up and running") #checking instance 


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

    #AT_MVA_profile.png -> name of plot in backend

    st.markdown("<h1 class='title'>MVA Profile of AT</h1>", unsafe_allow_html=True)


    AT_no = st.number_input("Enter the AT number to see its MVA profile", min_value=0)

    if st.button("Show MVA Profile"):
        st.session_state.oc.eval("setenv('GNUTERM', 'gnuplot')")
        AT_mva_mag = st.session_state.oc.pull('AT_mva_mag')
        st.session_state.oc.eval(f"AT_MVA_profile({AT_no}, AT_mva_mag)")
        image_path = '../Plots/AT_MVA_profile.png'
        img = Image.open(image_path)
        st.image(img, caption="AT MVA Profile", use_column_width=True)


if __name__ == "__main__":
    main()
