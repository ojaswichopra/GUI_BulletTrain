# 7. Maximum MVA of all AT
# connecteed backend file - "AT_maximum_MVA.m".

import os
import streamlit as st
from pages.run_loadflow import oc
from PIL import Image

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

#AT_maximum_MVA.png -> name of plot in backend

if st.button("Show maximum MVA of all AT"):
    oc.eval("AT_maximum_MVA")
    image_path = os.path.join(os.path.dirname(__file__), '../../backend_codes/AT_maximum_MVA.png')
    img = Image.open(image_path)
    st.image(img, caption="AT Maximum MVA", use_column_width=True)

