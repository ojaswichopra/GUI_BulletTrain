import csv
import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
import os
import multiprocessing
from pages.run_loadflow import run_train_timetable  # Import the backend function directly
# import Train_Timetable_config
import pages.Train_Timetable_config as Train_Timetable_config
import pandas as pd

# Read the Excel file
train_operation_data = pd.read_excel("../train_timetable/stopage_data_train_time_rapid.xlsx")

# Extract necessary columns
station_names = train_operation_data["Station"].tolist()

# Determine sections
number_of_sections = len(station_names) - 1  # Sections are between stations
sections = [
    f"Section {i+1} - {station_names[i]} to {station_names[i+1]}"
    for i in range(number_of_sections)
]

def run_backend_process(M, g, delt, eff, m_decl, a, b, c, max_speed, sect):
    # Run the backend function in a new process
    backend_process = multiprocessing.Process(
        target=run_train_timetable, args=(M, g, delt, eff, m_decl, a, b, c, max_speed, sect)
    )
    backend_process.start()

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

    st.markdown("<h1 class='title'>Run Section</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    selected_section = st.selectbox("Choose a section:", sections)
    sec = sections.index(selected_section) + 1
    global recipient
    recipient = st.text_input("Enter email address to which you would like to recive the section schedule")
    # Display the selected section
    # st.write(f"You selected: {selected_section} {sec}")
    if st.button("Submit"):
        with open('../train_timetable/email.txt', 'w') as file:
            file.write(recipient)
        run_backend_process({Train_Timetable_config.M}, {Train_Timetable_config.g}, {Train_Timetable_config.delt}, {Train_Timetable_config.eff}, {Train_Timetable_config.m_decl}, {Train_Timetable_config.a}, {Train_Timetable_config.b}, {Train_Timetable_config.c}, {Train_Timetable_config.max_speed},{sec})
        st.success("Initiated!!")

if __name__ == "__main__":
    main()
    # Adding a styled back button
    st.markdown(
        f"""
        <a href="/Train_Timetable" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )