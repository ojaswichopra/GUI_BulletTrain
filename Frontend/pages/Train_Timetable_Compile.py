import csv
import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
import pages.Train_Timetable_config as Train_Timetable_config
import pandas as pd
from oct2py import Oct2Py
oc = Oct2Py() 
oc.eval('cd("../train_timetable")') 

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

    st.markdown("<h1 class='title'>Final Compile</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    
    # Loop through the sections and ask for file uploads
    uploaded_files = {}
    for section in sections:
        # Extract section number and station names for display
        section_number = section.split(" ")[1]  # Extracting the number part from "Section X"
        
        # File uploader for the selected section
        uploaded_file = st.file_uploader(f"Upload timetable for {section}", type=["txt", "csv", "xlsx"], key=section_number)
        
        if uploaded_file:
            # Save the uploaded file in the '../train_timetable/' directory
            timetable_file_path = f"../train_timetable/train_timetable_{section_number}.txt"
            with open(timetable_file_path, "wb") as file:
                file.write(uploaded_file.getbuffer())  # Save file buffer to disk
            uploaded_files[section_number] = timetable_file_path
            st.success("File Uploaded!!")
    
    if st.button("Run Backend Process"):
        # Check if all files are uploaded before running backend process
        missing_files = [section for section in sections if section.split(" ")[1] not in uploaded_files]

        if len(missing_files) > 0:
            st.error(f"Please upload the timetable files for the following sections: {', '.join([file.split(' ')[1] for file in missing_files])}")
        else:
            oc.eval(f"""final_compile({number_of_sections})""")
            # Read the generated All_Stop.txt file after the backend process
            all_stop_file_path = "../train_timetable/All_Stop.txt"
            
            try:
                with open(all_stop_file_path, "r") as file:
                    file_content = file.read()
                    
                # Provide a download button for the file
                st.download_button(
                    label="Download All_Stop.txt",
                    data=file_content,
                    file_name="All_Stop.txt",
                    mime="text/plain"
                )
            except FileNotFoundError:
                st.error(f"{all_stop_file_path} not found. Please check if the backend process was successful.")

    

if __name__ == "__main__":
    main()
    # Adding a styled back button
    st.markdown(
        f"""
        <a href="/Train_Timetable_Interface" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )