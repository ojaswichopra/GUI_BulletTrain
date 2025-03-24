import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
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

    #AT_MVA_profile.png -> name of plot in backend

st.markdown("<h1 class='title'>Sub Modules</h1>", unsafe_allow_html=True)
add_vertical_space(1)

col1, col2 = st.columns(2)
st.session_state.oc.eval(f"load('Voltage_distance_matrix_whole.mat')")
Voltage_distance_matrix_whole = st.session_state.oc.pull('Voltage_distance_matrix_whole')
with col1:
    if st.button("Voltage profile of all TSSs at the entered time instant"):
        st.session_state.oc.eval(f"voltage_profile_design_predetermine_TSS(Voltage_distance_matrix_whole)")
        image_path = '../Plots/voltage_profile_design_predetermine_TSS.png'
        img = Image.open(image_path)
        st.image(img, caption="voltage_profile_design_predetermine_TSS", use_container_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="voltage_profile_design_predetermine_TSS.png",  # Replace with the desired download filename
                mime="image/png"
            )

with col2:
    if st.button("Voltage profile of all ATs at the entered time instant"):
        st.session_state.oc.eval(f"voltage_profile_design_predetermine_AT(Voltage_distance_matrix_whole)")
        image_path = '../Plots/voltage_profile_design_predetermine_AT.png'
        img = Image.open(image_path)
        st.image(img, caption="voltage_profile_design_predetermine_AT", use_container_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="voltage_profile_design_predetermine_AT.png",  # Replace with the desired download filename
                mime="image/png"
                    )