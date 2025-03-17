import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
import numpy as np
from oct2py import Oct2Py
from PIL import Image

oc = Oct2Py() 
oc.eval('cd("../Harmonic_output/normal")') 

from pages.Harmonic_Workspace_normal import harmonic_workspace_normal

def main():


    # Settings
    # st.set_page_config(page_title=title, page_icon=page_icon, layout=layout)
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
    st.markdown("<h1 class='title'>Output of harmonic analysis - Normal condition</h1>", unsafe_allow_html=True)
    add_vertical_space(1)

    train_numbers = np.unique(harmonic_workspace_normal['train_number'])    # Get unique train numbers
    train_numbers = train_numbers.astype(int)
    # Dropdown for selecting a train number
    entered_train_number = st.selectbox("Select the train number to see its Contact terminal THD profile:", train_numbers)

    if st.button("Submit"):
        oc.eval("setenv('GNUTERM', 'gnuplot')")

        train_number = harmonic_workspace_normal['train_number']
        oc.push('train_number', train_number)

        track_type = harmonic_workspace_normal['track_type']
        oc.push('track_type', track_type)

        train_type = harmonic_workspace_normal['train_type']
        oc.push('train_type', train_type)

        start_time = harmonic_workspace_normal['start_time']
        oc.push('start_time', start_time)

        each_stop_train_data_up = harmonic_workspace_normal['each_stop_train_data_up']
        oc.push('each_stop_train_data_up', each_stop_train_data_up)

        rapid_train_data_up = harmonic_workspace_normal['rapid_train_data_up']
        oc.push('rapid_train_data_up', rapid_train_data_up)

        each_stop_train_data_down = harmonic_workspace_normal['each_stop_train_data_down']
        oc.push('each_stop_train_data_down', each_stop_train_data_down)

        rapid_train_data_down = harmonic_workspace_normal['rapid_train_data_down']
        oc.push('rapid_train_data_down', rapid_train_data_down)

        track_length = harmonic_workspace_normal['track_length']
        oc.push('track_length', track_length)

        d = harmonic_workspace_normal['d']
        oc.push('d', d)

        dTSS_up = harmonic_workspace_normal['dTSS_up']
        oc.push('dTSS_up', dTSS_up)

        dTSS_down = harmonic_workspace_normal['dTSS_down']
        oc.push('dTSS_down', dTSS_down)

        N_TSS = harmonic_workspace_normal['N_TSS']
        oc.push('N_TSS', N_TSS)

        y = harmonic_workspace_normal['y']
        oc.push('y', y)
        
        oc.eval(f"Train_contact_terminal_THD({entered_train_number}, train_number, track_type, train_type, start_time, each_stop_train_data_up, rapid_train_data_up, each_stop_train_data_down, rapid_train_data_down, track_length, d, dTSS_up, dTSS_down, N_TSS, y)")        

        image_path = '../Plots_harmonic/Train_contact_terminal_THD_normal.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="Train_contact_terminal_THD_normal.png",  # Replace with the desired download filename
                mime="image/png"
            )


if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/Harmonic_output" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )