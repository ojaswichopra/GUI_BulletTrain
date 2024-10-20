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

   

    st.markdown("<h1 class='title'> Contact and Feeder total current at the substation</h1>", unsafe_allow_html=True)


    if st.button("Show contact & feeder bus bar current"):
        oc.eval("setenv('GNUTERM', 'gnuplot')")
        # st.write(workspace_variables)
        sub_station_catenary_current = en_workspace['sub_station_catenary_current']
        oc.push('sub_station_catenary_current', sub_station_catenary_current)
        
        sub_station_feeder_current = en_workspace['sub_station_feeder_current']
        oc.push('sub_station_feeder_current', sub_station_feeder_current)
        
        oc.eval(f"sub_station_current_plot(sub_station_catenary_current,sub_station_feeder_current)")
        image_path = '../Plots/sub_station_current.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="sub_station_current.png",  # Replace with the desired download filename
                mime="image/png"
            )


if __name__ == "__main__":
    main()
    if st.button("Back"):
        st.switch_page("pages/EN_Output.py")
