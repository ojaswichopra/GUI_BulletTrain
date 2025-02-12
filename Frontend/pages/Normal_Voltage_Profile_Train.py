import os
import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from PIL import Image
# Create an Oct2Py instance once
from pages.normal_workspace import normal_variables
from oct2py import Oct2Py
import numpy as np
oc = Oct2Py() 
oc.eval('cd("../normal_double_track")') 

def main():
    st.markdown(
            """
        <style>
            [data-testid="collapsedControl"] {
                display: none
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

    st.markdown("<h1 class='title'>Voltage Profile of a Particular Train</h1>", unsafe_allow_html=True)
    add_vertical_space(1)

    # Assuming normal_variables is a dictionary containing a DataFrame
    train_numbers = np.unique(normal_variables['train_number'])    # Get unique train numbers
    train_numbers = train_numbers.astype(int)
    # Dropdown for selecting a train number
    entered_train_number = st.selectbox("Select the train number to see its voltage profile", train_numbers)

    # st.write(f"Selected Train Number: {entered_train_number}")
    #no_of_train = st.number_input("Enter the number of trains running per hour", min_value=0)
    # entered_train_number = st.number_input("Enter the train number to see its voltage profile", min_value=0)
    
    if st.button("Submit"):
        oc.eval("setenv('GNUTERM', 'gnuplot')")

        d = normal_variables['d']
        dTSS_T_up = normal_variables['dTSS_T_up']
        Vc_mag_Td_up = normal_variables['Vc_mag_Td_up']
        Vc_ang_Td_up = normal_variables['Vc_ang_Td_up']
        VR_mag_Td_up = normal_variables['VR_mag_Td_up']
        VR_ang_Td_up = normal_variables['VR_ang_Td_up']
        Vf_mag_Td_up = normal_variables['Vf_mag_Td_up']
        Vf_ang_Td_up = normal_variables['Vf_ang_Td_up']
        dTSS_M_down = normal_variables['dTSS_M_down']   
        Vc_mag_Md_down = normal_variables['Vc_mag_Md_down']
        Vc_ang_Md_down = normal_variables['Vc_ang_Md_down']
        VR_mag_Md_down = normal_variables['VR_mag_Md_down']
        VR_ang_Md_down = normal_variables['VR_ang_Md_down']
        Vf_mag_Md_down = normal_variables['Vf_mag_Md_down']
        Vf_ang_Md_down = normal_variables['Vf_ang_Md_down']
        y = normal_variables['y']
        dTSS_M_up  = normal_variables['dTSS_M_up']
        dTSS_up = normal_variables['dTSS_up']
        dTSS_down = normal_variables['dTSS_down']
        Vc_mag_Md_up    = normal_variables['Vc_mag_Md_up']
        Vc_ang_Md_up    = normal_variables['Vc_ang_Md_up']
        VR_mag_Md_up    = normal_variables['VR_mag_Md_up']
        VR_ang_Md_up    = normal_variables['VR_ang_Md_up']
        Vf_mag_Md_up    = normal_variables['Vf_mag_Md_up']
        Vf_ang_Md_up    = normal_variables['Vf_ang_Md_up']
        dTSS_T_down = normal_variables['dTSS_T_down']
        Vc_mag_Td_down = normal_variables['Vc_mag_Td_down']
        Vc_ang_Td_down = normal_variables['Vc_ang_Td_down'] 
        VR_mag_Td_down = normal_variables['VR_mag_Td_down']
        VR_ang_Td_down = normal_variables['VR_ang_Td_down']
        Vf_mag_Td_down = normal_variables['Vf_mag_Td_down']
        Vf_ang_Td_down = normal_variables['Vf_ang_Td_down']
        train_number = normal_variables['train_number']
        track_type = normal_variables['track_type']
        train_type = normal_variables['train_type']
        start_time = normal_variables['start_time']
        each_stop_train_data_up = normal_variables['each_stop_train_data_up']
        rapid_train_data_up = normal_variables['rapid_train_data_up']
        each_stop_train_data_down = normal_variables['each_stop_train_data_down']
        rapid_train_data_down = normal_variables['rapid_train_data_down']
        track_length = normal_variables['track_length']


        oc.push('d', d)
        oc.push('dTSS_T_up', dTSS_T_up)
        oc.push('Vc_mag_Td_up', Vc_mag_Td_up)
        oc.push('Vc_ang_Td_up', Vc_ang_Td_up)
        oc.push('VR_mag_Td_up', VR_mag_Td_up)

        oc.push('VR_ang_Td_up', VR_ang_Td_up)
        oc.push('Vf_mag_Td_up', Vf_mag_Td_up)
        oc.push('Vf_ang_Td_up', Vf_ang_Td_up)
        oc.push('dTSS_M_down', dTSS_M_down)
        oc.push('Vc_mag_Md_down', Vc_mag_Md_down)
        oc.push('Vc_ang_Md_down', Vc_ang_Md_down)
        oc.push('VR_mag_Md_down', VR_mag_Md_down)
        oc.push('VR_ang_Md_down', VR_ang_Md_down)
        oc.push('Vf_mag_Md_down', Vf_mag_Md_down)
        oc.push('Vf_ang_Md_down', Vf_ang_Md_down)
        oc.push('y', y)
        oc.push('dTSS_M_up', dTSS_M_up)
        oc.push('dTSS_up', dTSS_up)
        oc.push('dTSS_down', dTSS_down)
        oc.push('Vc_mag_Md_up', Vc_mag_Md_up)
        oc.push('Vc_ang_Md_up', Vc_ang_Md_up)
        oc.push('VR_mag_Md_up', VR_mag_Md_up)
        oc.push('VR_ang_Md_up', VR_ang_Md_up)
        oc.push('Vf_mag_Md_up', Vf_mag_Md_up)
        oc.push('Vf_ang_Md_up', Vf_ang_Md_up)
        oc.push('dTSS_T_down', dTSS_T_down)
        oc.push('Vc_mag_Td_down', Vc_mag_Td_down)
        oc.push('Vc_ang_Td_down', Vc_ang_Td_down)
        oc.push('VR_mag_Td_down', VR_mag_Td_down)
        oc.push('VR_ang_Td_down', VR_ang_Td_down)
        oc.push('Vf_mag_Td_down', Vf_mag_Td_down)
        oc.push('Vf_ang_Td_down', Vf_ang_Td_down)
        oc.push('train_number', train_number)
        oc.push('track_type', track_type)
        oc.push('train_type', train_type)
        oc.push('start_time', start_time)
        oc.push('each_stop_train_data_up', each_stop_train_data_up)
        oc.push('rapid_train_data_up', rapid_train_data_up)
        oc.push('each_stop_train_data_down', each_stop_train_data_down)
        oc.push('rapid_train_data_down', rapid_train_data_down)
        oc.push('track_length', track_length)

        
        oc.eval(f"train_voltage_profile_with_train_number({entered_train_number},d, dTSS_T_up, Vc_mag_Td_up, Vc_ang_Td_up, VR_mag_Td_up, VR_ang_Td_up, Vf_mag_Td_up, Vf_ang_Td_up, dTSS_M_down, Vc_mag_Md_down, Vc_ang_Md_down, VR_mag_Md_down, VR_ang_Md_down, Vf_mag_Md_down, Vf_ang_Md_down, y, dTSS_M_up, dTSS_up, dTSS_down, Vc_mag_Md_up, Vc_ang_Md_up, VR_mag_Md_up, VR_ang_Md_up, Vf_mag_Md_up, Vf_ang_Md_up, dTSS_T_down, Vc_mag_Td_down, Vc_ang_Td_down, VR_mag_Td_down, VR_ang_Td_down, Vf_mag_Td_down, Vf_ang_Td_down, train_number, track_type, train_type, start_time, each_stop_train_data_up, rapid_train_data_up, each_stop_train_data_down, rapid_train_data_down, track_length)")
        image_path = '../Plots_normal/train_voltage_profile_with_train_number.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="train_voltage_profile_with_train_number.png",  # Replace with the desired download filename
                mime="image/png"
            )


if __name__ == "__main__":
    main()
    # if st.button("Back"):
    #     st.switch_page("pages/Load_Flow_Output.py")
    st.markdown(
        f"""
        <a href="/Normal_Load_Flow_Output" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
