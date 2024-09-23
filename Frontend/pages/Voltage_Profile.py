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

st.markdown("<h1 class='title'>Voltage profile at a particular time instant</h1>", unsafe_allow_html=True)

time = st.number_input("Enter the time instant (in sec) at which the voltage profile of the track needs to be investigated", min_value=0)
dist = st.number_input("Enter the distance resolution (in meter)", min_value=0)
if st.button("Submit"):
    oc.eval(f"""Full_track_voltage_profile_instant_t({time},{dist})""")
    # Load the image
    image_path = '../Plots/Full_track_voltage_profile_instant_t.png'  # Replace with the path to your image
    image = Image.open(image_path)

    # Display the image
    st.image(image, caption='Your Image', use_column_width=True)

    # Provide a download button for the image
    with open(image_path, "rb") as file:
        btn = st.download_button(
            label="Download Plot",
            data=file,
            file_name="Full_track_voltage_profile_instant_t.png",  # Replace with the desired download filename
            mime="image/png"
        )
    col1, col2 = st.columns(2)
    with col1:
        st.button("Voltage profile of all TSSs at the previously entered time instant")
        if st.button("Submit"):
            oc.eval(f"""voltage_profile_design_predetermine_TSS""")
            
            
    with col2:
        st.button("Voltage profile of all ATs at the previously entered time instant")
        if st.button("Submit"):
            oc.eval(f"""voltage_profile_design_predetermine_AT""")