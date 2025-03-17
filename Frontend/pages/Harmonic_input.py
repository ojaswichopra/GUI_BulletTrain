import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
import os

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

    st.markdown("<h1 class='title'>Perform Harmonic Analysis</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    
    harmonic_file = st.file_uploader("Upload harmonic current spectrum data (.txt file)", type="txt")
    if harmonic_file is not None:
        save_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)),'..',  '../Harmonic')

        # Create the directory if it doesn't exist
        os.makedirs(save_directory, exist_ok=True)
        desired_filename = "Harmonic_current_spectrum.txt"
        # Step 4: Save the file in the backend folder
        with open(os.path.join(save_directory, desired_filename), "wb") as f:
            f.write(harmonic_file.getbuffer())
        st.success(f"File saved.")
 
    if st.button("Submit"):
        if harmonic_file is not None:
            st.switch_page("pages/Harmonic_options.py")
        else:
            st.warning("Upload Harmonic Current Spectrum Data!")

if __name__ == "__main__":
    main()
    # Adding a styled back button
    st.markdown(
        f"""
        <a href="/" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )


