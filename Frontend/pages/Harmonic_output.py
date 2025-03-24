import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
import numpy as np
from oct2py import Oct2Py

from pages.Harmonic_Workspace_normal import harmonic_workspace_normal

# Helper function to check if a string can be converted to a float
def is_numeric(value):
    try:
        float(value)
        return True
    except ValueError:
        return False

# Function to read text files and process their content
def read_text_file(file_path):
    try:
        with open(file_path, 'r') as file:
            content = file.readlines()

        if not content:
            print("The file is empty.")
            return None

        # Process the content to determine its structure
        if len(content) == 1:  # Single line
            values = content[0].split()
            numeric_values = [float(v) for v in values if is_numeric(v)]

            if len(numeric_values) == 1:
                return numeric_values[0]  # Scalar
            else:
                return np.array(numeric_values)  # 1D array

        else:  # Multiple lines
            array_2d = []
            for line in content:
                values = line.split()
                numeric_values = [float(v) for v in values if is_numeric(v)]

                if numeric_values:
                    array_2d.append(numeric_values)

            if len(array_2d) == 1 and len(array_2d[0]) == 1:
                return array_2d[0][0]  # Single value in a 2D structure
            else:
                return np.array(array_2d)  # 2D array

    except FileNotFoundError:
        print("The specified file was not found.")
        return None
    except ValueError:
        print("Error converting values to numeric.")
        return None

def load_harmonic_workspace():
    variable_names = [
        'train_number', 'track_type', 'train_type', 'start_time', 'each_stop_train_data_up', 'rapid_train_data_up', 'each_stop_train_data_down', 'rapid_train_data_down', 'track_length', 'd', 'dTSS_up', 'dTSS_down', 'N_TSS', 'y'
    ]

    for var in variable_names:
        harmonic_workspace_normal[var] = read_text_file(f'../normal_text_files/{var}.txt')


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
    st.markdown("<h1 class='title'>Output of harmonic analysis</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    col1, col2 = st.columns(2)

    with col1:
        if st.button('Normal condition'):
            load_harmonic_workspace()
            st.switch_page("pages/Harmonic_output_normal.py")
    
    with col2:
        if st.button('TSS outage condition'):
            st.switch_page("pages/.py")
        

if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/Output_Options" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )