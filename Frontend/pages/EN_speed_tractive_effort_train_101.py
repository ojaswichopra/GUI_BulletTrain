import os
import streamlit as st
from PIL import Image
# Create an Oct2Py instance once
from pages.EN_workspace import en_workspace
from streamlit_extras.add_vertical_space import add_vertical_space
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

   

    st.markdown("<h1 class='title'>Speed and Tractive Effort of Train 101</h1>", unsafe_allow_html=True)
    add_vertical_space(1)

    # if st.button("Show speed and tractive effort plot"):
    oc.eval("setenv('GNUTERM', 'gnuplot')")
    # st.write(workspace_variables)
    HS_train_A_F_data = en_workspace['HS_train_A_F_data']
    oc.push('HS_train_A_F_data', HS_train_A_F_data)
    

    oc.eval(f"speed_TE_plot(HS_train_A_F_data)")
    image_path = '../Plots/speed_te_plot.png'
    img = Image.open(image_path)
    st.image(img, caption="", use_column_width=True)

    with open(image_path, "rb") as file:
        btn = st.download_button(
            label="Download Plot",
            data=file,
            file_name="speed_te_plot.png",  # Replace with the desired download filename
            mime="image/png"
        )


if __name__ == "__main__":
    main()
    # if st.button("Back"):
    #     st.switch_page("pages/EN_Output.py")
    st.markdown(
    f"""
    <a href="/EN_Output" target="_self" class="custom-button">Back</a>
    """,
    unsafe_allow_html=True
    )
