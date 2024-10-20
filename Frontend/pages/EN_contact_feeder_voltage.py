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

   

    st.markdown("<h1 class='title'> Contact and Feeder bus bar voltage at the substation</h1>", unsafe_allow_html=True)


    if st.button("Show contact & feeder bus bar voltage"):
        oc.eval("setenv('GNUTERM', 'gnuplot')")
        # st.write(workspace_variables)
        Vc_mag_Td = en_workspace['Vc_mag_Td']
        oc.push('Vc_mag_Td', Vc_mag_Td)
        Vf_mag_Td = en_workspace['Vf_mag_Td']
        oc.push('Vf_mag_Td', Vf_mag_Td)
        
        oc.eval(f"sub_station_voltage_plot(Vc_mag_Td,Vf_mag_Td)")
        image_path = '../Plots/sub_station_voltage.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="sub_station_voltage.png",  # Replace with the desired download filename
                mime="image/png"
            )


if __name__ == "__main__":
    main()
    if st.button("Back"):
        st.switch_page("pages/EN_Output.py")
