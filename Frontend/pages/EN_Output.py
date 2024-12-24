import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space

    
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
    
    st.markdown("<h1 class='title'>Output of EN-50641 standard</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    col1, col2 = st.columns(2)

    with col1:
        if st.button('Train timetable plot'):
            st.switch_page('pages/EN_Train_Timetable.py')
        if st.button('Speed and Tractive Effort of Train 101'):
            st.switch_page('pages/EN_speed_tractive_effort_train_101.py')
    
    with col2:
        if st.button('Contact and Feeder bus bar voltage at the substation'):
            st.switch_page('pages/EN_contact_feeder_voltage.py')
        if st.button('Contact and Feeder total current at the substation'):
            st.switch_page('pages/EN_contact_feeder_current.py')
    
    c1,c2,c3,c4 = st.columns(4)
    with c2:
        if st.button('Current and Voltage profile of Train 101 along the track'):
            st.switch_page('pages/EN_current_voltage_profile.py')




if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/Output_Loadflow_Options" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
    