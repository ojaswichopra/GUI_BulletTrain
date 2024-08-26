import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
import matlab.engine

# Define the path to your system data file
file_path = "../system data file.txt"


def main():
    st.markdown(
        """
    <style>
        [data-testid="collapsedControl"] {
            display: none
        }
        .stButton button {
            width: 100px;
            height: 100%;
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
    </style>
    """,
        unsafe_allow_html=True,
    )
    
    st.markdown("<h1 class='title'>Execute Load Flow</h1>", unsafe_allow_html=True)
    
    add_vertical_space(2)
    # File uploads for system data and train timetable
    system_data_file = st.file_uploader("Upload System Data File (.txt)", type="txt", key="system_data")
    timetable_file = st.file_uploader("Upload Train Timetable (.txt)", type="txt")

    # Input fields for other parameters
    N = st.number_input("Enter the number of trains running per hour", min_value=0)
    H_hr = st.number_input("Enter the number of hours of train scheduling per day", min_value=0)
    train_time = st.number_input("Enter the time (in seconds) taken by one train to complete the route", min_value=0)
    
    if st.button("Submit"):
        if not system_data_file or not timetable_file or N <= 0 or H_hr <= 0 or train_time <= 0:
                st.warning("Please provide all the inputs correctly!")
        else:
            # Perform the load flow calculations here
            eng=matlab.engine.start_matlab()
            script_folder = '../backend codes'
            eng.cd(script_folder)
            # eng.code_run(nargout=0)
            eng.quit()
            st.success("Load flow executed successfully!")

if __name__ == "__main__":
    main()