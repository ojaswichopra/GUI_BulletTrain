import os
import streamlit as st
from PIL import Image
from pages.workspace import workspace_variables
from streamlit_extras.add_vertical_space import add_vertical_space
from oct2py import Oct2Py
import pandas as pd  # Import pandas for DataFrame handling

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
                margin: auto;
                width: 80%;  /* Adjust as needed */
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
        </style>
        """,
        unsafe_allow_html=True,
    )

    st.markdown("<h1 class='title'>Maximum MVA of all TSS</h1>", unsafe_allow_html=True)

    s_apprant_power_MVA_mag = workspace_variables['s_apprant_power_MVA_mag']
    oc.push('s_apprant_power_MVA_mag', s_apprant_power_MVA_mag)
    
    # Evaluate the function and get the result
    maximum_mva_tss = oc.eval(f"TSS_maximum_MVA(s_apprant_power_MVA_mag)")

    # Flatten the 2D list to 1D
    flattened_mva_values = maximum_mva_tss[0] 

    # Create DataFrame from the flattened values
    maximum_mva_tss_df = pd.DataFrame(flattened_mva_values, columns=["MVA Values"])
    
    # Create a new column for labels starting from 1
    maximum_mva_tss_df.index += 1  # Start index from 1

    add_vertical_space(3)

    # Center-align the DataFrame content
    styled_table = maximum_mva_tss_df.style.set_table_attributes('style="margin:auto; width:80%;"')\
                    .set_table_styles([{
                        'selector': 'th',
                        'props': [('text-align', 'center')]
                    }, {
                        'selector': 'td',
                        'props': [('text-align', 'center')]
                    }])

    # Display the table with center-aligned text
    st.markdown("<div class='table-container'>", unsafe_allow_html=True)  # Centering the table
    st.table(styled_table)
    st.markdown("</div>", unsafe_allow_html=True)

    # Add a download button for the DataFrame
    csv = maximum_mva_tss_df.to_csv(index=True).encode('utf-8')
    st.markdown("<div class='download-button'>", unsafe_allow_html=True)
    st.download_button(
        label="Download MVA Values as CSV",
        data=csv,
        file_name='maximum_mva_tss.csv',
        mime='text/csv',
        key='download-csv'
    )
    st.markdown("</div>", unsafe_allow_html=True)

    if st.button("Back"):
        st.switch_page("pages/Load_Flow_Output.py")

if __name__ == "__main__":
    main()
