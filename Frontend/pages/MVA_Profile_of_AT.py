import os
import streamlit as st
from PIL import Image
from streamlit_extras.add_vertical_space import add_vertical_space
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

    st.markdown("<h1 class='title'>MVA Profile of AT</h1>", unsafe_allow_html=True)
    add_vertical_space(1)

    AT_no = st.number_input("Enter the AT number to see its MVA profile", min_value=0)

    if st.button("Show MVA Profile"):
        oc.eval("setenv('GNUTERM', 'gnuplot')")
        # st.write(workspace_variables)
        AT_mva_mag = workspace_variables['AT_mva_mag']
        # st.write(AT_mva_mag)
        oc.push('AT_mva_mag', AT_mva_mag)
        oc.eval(f"AT_MVA_profile({AT_no}, AT_mva_mag)")
        image_path = '../Plots/AT_MVA_profile.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_container_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="AT_MVA_profile.png",  # Replace with the desired download filename
                mime="image/png"
            )


if __name__ == "__main__":
    main()
    # if st.button("Back"):
    #     st.switch_page("pages/Load_Flow_Output.py")
    st.markdown(
        f"""
        <a href="/Load_Flow_Output" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
