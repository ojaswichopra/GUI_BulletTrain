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
    
    st.markdown("<h1 class='title'>One TSS Output options - double track</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    col1, col2 = st.columns(2)

    with col1:
        if st.button('Voltage profile at a particular time instant'):
            st.switch_page("pages/.py")
        if st.button('Voltage profile of a particular train'):
            st.switch_page("pages/oTo_double_voltage_profile_train.py") 
        if st.button('MVA profile of AT'):
            st.switch_page("pages/.py") 
        if st.button('Maximum MVA of all AT'):
            st.switch_page("pages/.py") 
        

    with col2:
        if st.button('Voltage profile at a particular distance'):
            st.switch_page("pages/.py")
        if st.button('MVA profile of TSS'):
           st.switch_page("pages/.py") 
        if st.button('Maximum MVA of all TSS'):
            st.switch_page("pages/.py") 
        if st.button('Voltage unbalance profile of TSS'):
            st.switch_page("pages/.py") 
    
    c1,c2,c3,c4 = st.columns(4)
    with c2:
        if st.button('Maximum voltage unbalance of all TSS'):
            st.switch_page("pages/Normal_Maximum_voltage_unbalance_of_all_TSS.py") #tbd
    
if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/Load_Flow_Output_Outage" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
    

