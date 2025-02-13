import os
import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from PIL import Image
import pandas as pd
# Create an Oct2Py instance once
from pages.normal_workspace import normal_variables
from oct2py import Oct2Py
oc = Oct2Py() 
import pandas as pd
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

    st.markdown("<h1 class='title'>Maximum MVA of all TSS</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    
    s_apprant_power_MVA_mag = normal_variables['s_apprant_power_MVA_mag']
    oc.push('s_apprant_power_MVA_mag', s_apprant_power_MVA_mag)

    maximum_mva_TSS = oc.eval("TSS_maximum_MVA(s_apprant_power_MVA_mag)")
    flattened_mva_values = maximum_mva_TSS[0]
    maximum_mva_tss_df = pd.DataFrame({
        "Maximum MVA Value": flattened_mva_values
    })

    maximum_mva_tss_df.index = range(1, len(maximum_mva_tss_df) + 1)
    maximum_mva_tss_df.rename_axis("TSS Number", inplace=True)

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
    st.dataframe(styled_table, use_container_width=True)
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

if __name__ == "__main__":
    main()
    # if st.button("Back"):
    #     st.switch_page("pages/Load_Flow_Output.py")
    st.markdown(
        f"""
        <a href="/Normal_Load_Flow_Output" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
