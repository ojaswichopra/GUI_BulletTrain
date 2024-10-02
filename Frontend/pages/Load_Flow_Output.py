import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
# from pages.run_loadflow import oc
from oct2py import Oct2Py

    
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
            st.switch_page("pages/Voltage_Profile_Train.py")
        if st.button('MVA profile of AT'):
            st.switch_page("pages/MVA_Profile_of_AT.py")
        if st.button('Maximum MVA of all AT'):
            st.switch_page("pages/Maximum_MVA_of_all_AT.py")
        if st.button('Maximum voltage unbalance of all TSS'):
            st.switch_page("pages/Maximum_voltage_unbalance_of_all_TSS.py")

    with col2:
        if st.button('Voltage profile at a particular distance'):
            st.switch_page("pages/Voltage_Profile_Distance.py")
        if st.button('MVA profile of TSS'):
           st.switch_page("pages/MVA_Profile_of_TSS.py")
        if st.button('Maximum MVA of all TSS'):
            st.switch_page("pages/Maximum_MVA_of_all_TSS.py")
        if st.button('Voltage unbalance profile of TSS'):
            st.switch_page("pages/Voltage_profile_unbalance.py")
        if st.button("Back"):
            st.switch_page("Landing.py")
    
if __name__ == "__main__":
    main()
    

