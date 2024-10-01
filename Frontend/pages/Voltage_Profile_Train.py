import os
import streamlit as st
from PIL import Image
# Create an Oct2Py instance once
from pages.workspace import workspace_variables
from oct2py import Oct2Py
oc = Oct2Py() 
oc.eval('cd("../backend_codes")') 

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
        </style>
        """,
            unsafe_allow_html=True,
        )

    #AT_MVA_profile.png -> name of plot in backend

    st.markdown("<h1 class='title'>Voltage Profile of a Particular Train</h1>", unsafe_allow_html=True)


    no_of_train = st.number_input("Enter the number of trains running per hour", min_value=0)
    train_number = st.number_input("Enter the train number to see its voltage profile", min_value=0)
    
    if st.button("Submit"):
        oc.eval("setenv('GNUTERM', 'gnuplot')")
        train_data = workspace_variables['train_data']
        d = workspace_variables['d']
        dTSS = workspace_variables['dTSS']
        y = workspace_variables['y']
        Vc_mag_Td = workspace_variables['Vc_mag_Td']    
        Vc_ang_Td = workspace_variables['Vc_ang_Td']
        VR_mag_Td = workspace_variables['VR_mag_Td']
        VR_ang_Td = workspace_variables['VR_ang_Td']
        Vc_mag_Md = workspace_variables['Vc_mag_Md']
        Vc_ang_Md = workspace_variables['Vc_ang_Md']
        VR_mag_Md = workspace_variables['VR_mag_Md']
        VR_ang_Md = workspace_variables['VR_ang_Md']
        oc.push('train_data', train_data)
        oc.push('d', d)
        oc.push('dTSS', dTSS)
        oc.push('y', y)
        oc.push('Vc_mag_Td', Vc_mag_Td)
        oc.push('Vc_ang_Td', Vc_ang_Td)
        oc.push('VR_mag_Td', VR_mag_Td)
        oc.push('VR_ang_Td', VR_ang_Td)
        oc.push('Vc_mag_Md', Vc_mag_Md)
        oc.push('Vc_ang_Md', Vc_ang_Md)
        oc.push('VR_mag_Md', VR_mag_Md)
        oc.push('VR_ang_Md', VR_ang_Md)
        oc.eval(f"train_voltage_profile_with_train_number({no_of_train},{train_number},train_data, d, dTSS, y, Vc_mag_Td, Vc_ang_Td, VR_mag_Td, VR_ang_Td, Vc_mag_Md, Vc_ang_Md, VR_mag_Md, VR_ang_Md)")
        image_path = '../Plots/Voltage_Profile_Train.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="Voltage_Profile_Train.png",  # Replace with the desired download filename
                mime="image/png"
            )


if __name__ == "__main__":
    main()
