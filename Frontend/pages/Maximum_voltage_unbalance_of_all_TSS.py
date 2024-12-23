import os
import streamlit as st
from PIL import Image
from streamlit_extras.add_vertical_space import add_vertical_space
from pages.workspace import workspace_variables
from oct2py import Oct2Py
import pandas as pd

# Create an Oct2Py instance once
oc = Oct2Py() 
oc.eval('cd("../backend_codes")') 

def main():
    st.markdown(
        """
        <style>
            [data-testid="collapsedControl"] {
                display: none;
            }
            .title {
                text-align: center;
            }
            .table-container {
                display: flex;
                justify-content: center; /* Center the table container */
                margin: auto;
                width: 100%;  /* Full width */
            }
            .styled-table {
                width: 80%;  /* Set table width */
                border-collapse: collapse;
            }
            .styled-table th,
            .styled-table td {
                padding: 10px;  /* Add padding for broader columns */
                text-align: center;  /* Center text in cells */
            }
            .download-button {
                display: flex;
                justify-content: center; /* Center the download button */
                margin-top: 20px; /* Add some space above the button */
            }
            /* Center all paragraph text */
            p {
                text-align: center;
            }
            .custom-button {
                display: inline-block;
                text-decoration: none;
                padding: 10px 30px;
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

    st.markdown("<h1 class='title'>Maximum Voltage Unbalance of all TSS</h1>", unsafe_allow_html=True)
    add_vertical_space(3)

    Unb = workspace_variables['Unb']
    oc.push('Unb', Unb)

    # Evaluate the function and get the result
    maximum_voltage_unbalance = oc.eval(f"TSS_maximum_voltage_unbalance(Unb)")

    # Assuming the result is a 1D array, convert it to a DataFrame with two columns
    maximum_voltage_unbalance_df = pd.DataFrame({
        "Maximum Voltage Unbalance(%)": maximum_voltage_unbalance[0]  # Your existing voltage unbalance data
    })

    # Create a new index starting from 1
    maximum_voltage_unbalance_df.index = range(1, len(maximum_voltage_unbalance_df) + 1)

    # Rename the index axis
    maximum_voltage_unbalance_df.rename_axis("TSS Number", inplace=True)

    # Center-align the DataFrame content and create a styled HTML table
    styled_table = maximum_voltage_unbalance_df.style.set_table_attributes('class="styled-table"') \
        .set_table_styles([{
            'selector': 'th',
            'props': [('text-align', 'center')]
        }, {
            'selector': 'td',
            'props': [('text-align', 'center')]
        }])

    # Display the table with the index label using st.dataframe
    st.markdown("<div class='table-container'>", unsafe_allow_html=True)  # Centering the table
    st.dataframe(styled_table, use_container_width=True)  # Ensure it uses full width
    st.markdown("</div>", unsafe_allow_html=True)

    # Add a download button for the DataFrame
    csv = maximum_voltage_unbalance_df.to_csv(index=True).encode('utf-8')
    st.markdown("<div class='download-button'>", unsafe_allow_html=True)
    st.download_button(
        label="Download Voltage Unbalance Values as CSV",
        data=csv,
        file_name='maximum_voltage_unbalance.csv',
        mime='text/csv',
        key='download-csv'
    )
    st.markdown("</div>", unsafe_allow_html=True)

    # if st.button("Back"):
    #     st.switch_page("pages/Load_Flow_Output.py")

if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/Load_Flow_Output" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
