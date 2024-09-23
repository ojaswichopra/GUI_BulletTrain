import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from oct2py import Oct2Py

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

oc = Oct2Py()
oc.eval('cd("../backend_codes")')

st.title("Voltage profile at a particular time instant")

time = st.number_input("Enter the time instant (in sec) at which the voltage profile of the track needs to be investigated", min_value=0)
dist = st.number_input("Enter the distance resolution (in meter)", min_value=0)
if st.button("Submit"):
    oc.eval(f"""Full_track_voltage_profile_instant_t({time},{dist})""")
    col1, col2 = st.columns(2)
    with col1:
        st.button("Voltage profile of all TSSs at the previously entered time instant")
        if st.button("Submit"):
            oc.eval(f"""voltage_profile_design_predetermine_TSS""")
            
            
    with col2:
        st.button("Voltage profile of all ATs at the previously entered time instant")
        if st.button("Submit"):
            oc.eval(f"""voltage_profile_design_predetermine_AT""")