import os
import streamlit as st
from run_loadflow import oc
from PIL import image

#AT_MVA_profile.png -> name of plot in backend

AT_no = st.number_input("Enter the AT number to see its MVA profile", min_value=0)

image_path = os.path.join(os.path.dirname(__file__), '../../backend_codes/AT_MVA_profile.png')

if st.button("Submit"):
    oc.eval(f"AT_MVA_profile({AT_no})")

img = Image.open(image_path)
st.image(img, caption="AT MVA Profile", use_column_width=True)