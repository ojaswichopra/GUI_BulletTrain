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
    
    st.markdown("<h1 class='title'>Two Adjacent TSS Outage</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    col1, col2 = st.columns(2)

    with col1:
        if st.button('Train voltage'):
            st.switch_page("pages/tTo_train_voltage.py")
        
    with col2:
        if st.button('TSS MVA & Voltage Unbalance profile'):
            st.switch_page("pages/tTo_TSS_MVA_unbalance_profile.py")
    
    c1,c2,c3,c4 = st.columns(4)
    with c2:
        if st.button('Voltage profile of full track at particular time instant'):
            st.switch_page("pages/tTo_voltage_profile_full_track.py")

    
if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/Load_Flow_Output_Outage" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
    

