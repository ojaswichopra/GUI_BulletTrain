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

    st.markdown("<h1 class='title'>Train timetable plot</h1>", unsafe_allow_html=True)


    if st.button("Show train timetable plot"):
        oc.eval("setenv('GNUTERM', 'gnuplot')")
        # st.write(workspace_variables)
        HS_train_A_F_data = en_workspace['HS_train_A_F_data']
        oc.push('HS_train_A_F_data', HS_train_A_F_data)
        HS_train_F_A_data = en_workspace['HS_train_F_A_data']
        oc.push('HS_train_F_A_data', HS_train_F_A_data)
        FR_train_A_F_data = en_workspace['FR_train_A_F_data']
        oc.push('FR_train_A_F_data', FR_train_A_F_data)
        SUB_train_A_F_data = en_workspace['SUB_train_A_F_data']
        oc.push('SUB_train_A_F_data', SUB_train_A_F_data)


        oc.eval(f"timetable_plot(HS_train_A_F_data,HS_train_F_A_data,FR_train_A_F_data,SUB_train_A_F_data)")
        image_path = '../Plots/timetable_plot.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="timetable_plot.png",  # Replace with the desired download filename
                mime="image/png"
            )


if __name__ == "__main__":
    main()
    if st.button("Back"):
        st.switch_page("pages/EN_Output.py")