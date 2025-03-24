import os
import streamlit as st
from PIL import Image
# Create an Oct2Py instance once
from pages.oTo_Workspace import oTo_workspace
from streamlit_extras.add_vertical_space import add_vertical_space
from oct2py import Oct2Py
import pandas as pd
oc = Oct2Py() 
oc.eval('cd("../one_TSS_outage")') 




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

    st.markdown("<h1 class='title'>TSS MVA & Voltage Unbalance profile</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    nn_track = st.number_input("Enter the TSS number for MVA profile", min_value=0)

    if(st.button("Show TSS MVA profile")):
        oc.eval("setenv('GNUTERM', 'gnuplot')")

        TSS = oTo_workspace['TSS']
        oc.push('TSS', TSS)
        N_TSS_O = oTo_workspace['N_TSS_O']
        oc.push('N_TSS_O', N_TSS_O)
        dTSS_T = oTo_workspace['dTSS_T']
        oc.push('dTSS_T', dTSS_T)
        s_apprant_power_MVA_mag = oTo_workspace['s_apprant_power_MVA_mag']
        oc.push('s_apprant_power_MVA_mag', s_apprant_power_MVA_mag)
        # Mva_sec_abs = oTo_workspace['Mva_sec_abs']
        # oc.push('Mva_sec_abs', Mva_sec_abs)
        Unb = oTo_workspace['Unb']
        oc.push('Unb', Unb)
        tt_time = oTo_workspace['tt_time']
        oc.push('tt_time', tt_time)

        oc.eval(f"TSS_MVA_voltage_unbalance_profile_plot_outage_load_txt({nn_track},TSS,N_TSS_O,dTSS_T,s_apprant_power_MVA_mag,Unb,tt_time)")
        # maximum_mva = result[0], maximum_unbalance = result[1]
        # maximum_mva, maximum_unbalance = oc.feval(
        #     "TSS_MVA_voltage_unbalance_profile_plot_outage_load_txt", 
        #     TSS, N_TSS_O, dTSS_T, s_apprant_power_MVA_mag, Unb, tt_time
        # )
        image_path = '../Plots_oTo/oTo_TSS_MVA_voltage_unbalance.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_container_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="oTo_TSS_MVA_voltage_unbalance.png",  # Replace with the desired download filename
                mime="image/png"
            )
    if os.path.isfile('../one_TSS_outage/maximum_mva_and_unbalance.mat'):

        oc.eval(f"load('maximum_mva_and_unbalance.mat')")
        col1, col2 = st.columns(2)
        maximum_mva = oc.pull('maximum_mva')
        maximum_unbalance = oc.pull('maximum_unbalance')
        with col1:
            if(st.button("Maximum MVA of all TSS")):
                
                flattened_maximum_mva = maximum_mva[0]
                maximum_mva_df = pd.DataFrame({
                    "Maximum MVA" : flattened_maximum_mva
                })
                # print(maximum_mva_df)
                maximum_mva_df.index = range(1, len(maximum_mva_df)+1)
                maximum_mva_df.rename_axis("TSS Number", inplace=True)
                add_vertical_space(2)
                styled_table1 = maximum_mva_df.style.set_table_attributes('style="margin:auto; width:80%;"')\
                                .set_table_styles([{
                                    'selector': 'th',
                                    'props': [('text-align', 'center')]
                                }, {
                                    'selector': 'td',
                                    'props': [('text-align', 'center')]
                                }])
                
                # Display the table with center-aligned text
                st.markdown("<div class='table-container'>", unsafe_allow_html=True)  # Centering the table
                st.dataframe(styled_table1, use_container_width=True)
                st.markdown("</div>", unsafe_allow_html=True)

                # Add a download button for the DataFrame
                csv = maximum_mva_df.to_csv(index=True).encode('utf-8')
                st.markdown("<div class='download-button'>", unsafe_allow_html=True)
                st.download_button(
                    label="Download Maximum MVA Values as CSV",
                    data=csv,
                    file_name='maximum_MVA_tss.csv',
                    mime='text/csv',
                    key='download-csv-1'
                )
                st.markdown("</div>", unsafe_allow_html=True)
        with col2: 
            if(st.button("Maximum Voltage Unbalance of all TSS")):
                
                flattened_maximum_unbalance = maximum_unbalance[0]
                maximum_unbalance_df = pd.DataFrame({
                    "Maximum voltage unbalance (%)" : flattened_maximum_unbalance
                })

                maximum_unbalance_df.index = range(1, len(maximum_unbalance_df)+1)
                maximum_unbalance_df.rename_axis("TSS Number", inplace=True)
                add_vertical_space(2)
                styled_table2 = maximum_unbalance_df.style.set_table_attributes('style="margin:auto; width:80%;"')\
                                .set_table_styles([{
                                    'selector': 'th',
                                    'props': [('text-align', 'center')]
                                }, {
                                    'selector': 'td',
                                    'props': [('text-align', 'center')]
                                }])
                
                # Display the table with center-aligned text
                st.markdown("<div class='table-container'>", unsafe_allow_html=True)  # Centering the table
                st.dataframe(styled_table2, use_container_width=True)
                st.markdown("</div>", unsafe_allow_html=True)

                # Add a download button for the DataFrame
                csv = maximum_unbalance_df.to_csv(index=True).encode('utf-8')
                st.markdown("<div class='download-button'>", unsafe_allow_html=True)
                st.download_button(
                    label="Download Maximum Unbalance Values as CSV",
                    data=csv,
                    file_name='maximum_unbalance_tss.csv',
                    mime='text/csv',
                    key='download-csv-2'
                )
                st.markdown("</div>", unsafe_allow_html=True)


if __name__ == "__main__":
    main()
    # if st.button("Back"):
    #     st.switch_page("pages/oTo_output_options.py")
    st.markdown(
        f"""
        <a href="/oTo_output_options" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
