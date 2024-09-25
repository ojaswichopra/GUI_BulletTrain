import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
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
            height: 100%;
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
if 'oc' in st.session_state:
        st.success("OC Instance up and running") #checking instance 

st.markdown("<h1 class='title'>Voltage profile at a particular time instant</h1>", unsafe_allow_html=True)

time = st.number_input("Enter the time instant (in sec) at which the voltage profile of the track needs to be investigated", min_value=0)
dist = st.number_input("Enter the distance resolution (in meter)", min_value=0)
if st.button("Submit"):
    st.session_state.oc.eval("setenv('GNUTERM', 'gnuplot')")
    st.session_state.oc.eval(f"""Full_track_voltage_profile_instant_t({time},{dist})""")
    image_path = '../Plots/Full_track_voltage_profile_instant_t.png'
    img = Image.open(image_path)
    st.image(img, caption="Full Track Voltage Profile Instant", use_column_width=True)

