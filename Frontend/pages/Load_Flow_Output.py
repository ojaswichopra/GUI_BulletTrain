import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
# from pages.run_loadflow import oc
from oct2py import Oct2Py

# # Create an Oct2Py instance once
if 'oc' not in st.session_state:
    st.success("Creating oct2py instance and rendering variables")
    st.session_state.oc = Oct2Py()  # Create an Oct2Py instance
    st.session_state.oc.eval('cd("../backend_codes")')  # Change to backend directory
    st.session_state.oc.eval('load("variable_load_flow_mum_to_ahm_each_stop.mat")')  # Load the .mat file
    st.session_state.mat_loaded = True  # Set the loaded flag

# # Initialize session state variable
# if 'loadMat' not in st.session_state:
#     st.session_state.loadMat = False

    
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
    </style>
    """,
        unsafe_allow_html=True,
    )
    
    st.markdown("<h1 class='title'>Output of Load Flow</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    col1, col2 = st.columns(2)

    with col1:
        if st.button('Voltage profile at a particular time instant'):
            st.switch_page("pages/Voltage_Profile.py")
        if st.button('Voltage profile of a particular train'):
            st.switch_page("pages/Execute_Load_Flow.py")
        if st.button('MVA profile of AT'):
            st.switch_page("pages/MVA_Profile_of_AT.py")
        if st.button('Maximum MVA of all AT'):
            st.write("Button 1 clicked!")

    with col2:
        if st.button('Voltage profile at a particular distance'):
            st.write("Button 2 clicked!")
        if st.button('MVA profile of TSS'):
            st.write("Button 4 clicked!")
        if st.button('Maximum MVA of all TSS'):
            st.write("Button 1 clicked!")
        if st.button('Voltage unbalance profile of TSS'):
            st.write("Button 1 clicked!")
    
    if st.button('Maximum voltage unbalance of all TSS'):
        st.write("Button 1 clicked!")

if __name__ == "__main__":
    main()

