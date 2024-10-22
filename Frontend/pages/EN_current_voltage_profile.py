import os
import streamlit as st
from PIL import Image
# Create an Oct2Py instance once
from pages.EN_workspace import en_workspace
from oct2py import Oct2Py
oc = Oct2Py() 
oc.eval('cd("../EN-50641")') 

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

   

    st.markdown("<h1 class='title'>Current and Voltage profile of Train 101 along the track</h1>", unsafe_allow_html=True)


    if st.button("Show current and voltage profile"):
        oc.eval("setenv('GNUTERM', 'gnuplot')")
        # st.write(workspace_variables)
        HS_train_A_F_data = en_workspace['HS_train_A_F_data']
        oc.push('HS_train_A_F_data', HS_train_A_F_data)
        d = en_workspace['d']
        oc.push('d', d)
        line_data_M_emp = en_workspace['line_data_M_emp']
        oc.push('line_data_M_emp', line_data_M_emp)
        dTSS = en_workspace['dTSS']
        oc.push('dTSS', dTSS)
        y_whole = en_workspace['y_whole']
        oc.push('y_whole', y_whole)
        Vc_mag_Td = en_workspace['Vc_mag_Td']
        oc.push('Vc_mag_Td', Vc_mag_Td)
        y = en_workspace['y']
        oc.push('y', y)
        Vc_ang_Td = en_workspace['Vc_ang_Td']
        oc.push('Vc_ang_Td', Vc_ang_Td)
        VR_mag_Td = en_workspace['VR_mag_Td']
        oc.push('VR_mag_Td', VR_mag_Td)
        VR_ang_Td = en_workspace['VR_ang_Td']
        oc.push('VR_ang_Td', VR_ang_Td)
        pTSS_T = en_workspace['pTSS_T']
        oc.push('pTSS_T', pTSS_T)
        


        oc.eval(f"train_101_voltage_current_profile(HS_train_A_F_data,d,line_data_M_emp,dTSS,y_whole,Vc_mag_Td,y,Vc_ang_Td,VR_mag_Td,VR_ang_Td,pTSS_T)")
        image_path = '../Plots/voltage_current_profile.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="voltage_current_profile.png",  # Replace with the desired download filename
                mime="image/png"
            )


if __name__ == "__main__":
    main()
    if st.button("Back"):
        st.switch_page("pages/EN_Output.py")
