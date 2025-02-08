import os
import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from PIL import Image
# Create an Oct2Py instance once
from pages.normal_workspace import normal_variables
from oct2py import Oct2Py
oc = Oct2Py() 
oc.eval('cd("../normal_double_track")') 

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

    st.markdown("<h1 class='title'>Maximum voltage unbalance of all TSS</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    
    Unb = normal_variables['Unb']
    oc.push('Unb', Unb)

    maximum_voltage_unbalance = oc.eval("TSS_maximum_voltage_unbalance(Unb)")
    
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
