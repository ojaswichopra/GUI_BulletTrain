import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from PIL import Image
# Create an Oct2Py instance once
from pages.normal_workspace import normal_variables
import pages.OHE_config as OHE_config
from oct2py import Oct2Py
oc = Oct2Py() 
oc.eval('cd("../OHE_temp/normal")') 

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

    st.markdown("<h1 class='title'>OHE Temperatue at a particular time instant for the entire track</h1>", unsafe_allow_html=True)
    add_vertical_space(1)

    time_instant = st.number_input("Enter the time instant (in second) at which OHE temperature along the track needs to be observed", min_value=0)

    if st.button("Submit"):
        oc.eval("setenv('GNUTERM', 'gnuplot')")

        Ic_line_mag_Td_down = normal_variables['Ic_line_mag_Td_down']
        oc.push('Ic_line_mag_Td_down', Ic_line_mag_Td_down)

        Ir_line_mag_Td_down = normal_variables['Ir_line_mag_Td_down']
        oc.push('Ir_line_mag_Td_down', Ir_line_mag_Td_down)

        If_line_mag_Td_down = normal_variables['If_line_mag_Td_down']
        oc.push('If_line_mag_Td_down', If_line_mag_Td_down)

        Ic_line_mag_Md_down = normal_variables['Ic_line_mag_Md_down']
        oc.push('Ic_line_mag_Md_down', Ic_line_mag_Md_down)

        Ir_line_mag_Md_down = normal_variables['Ir_line_mag_Md_down']
        oc.push('Ir_line_mag_Md_down', Ir_line_mag_Md_down)

        If_line_mag_Md_down = normal_variables['If_line_mag_Md_down']
        oc.push('If_line_mag_Md_down', If_line_mag_Md_down)

        y = normal_variables['y']
        oc.push('y', y)

        N_TSS = normal_variables['N_TSS']
        oc.push('N_TSS', N_TSS)

        d = normal_variables['d']
        oc.push('d', d)

        rad_C = normal_variables['rad_C']
        oc.push('rad_C', rad_C)

        rad_R1 = normal_variables['rad_R1']
        oc.push('rad_R1', rad_R1)

        rad_F = normal_variables['rad_F']
        oc.push('rad_F', rad_F)

        Resistance_C = normal_variables['Resistance_C']
        oc.push('Resistance_C', Resistance_C)

        Resistance_R1 = normal_variables['Resistance_R1']
        oc.push('Resistance_R1', Resistance_R1)

        Resistance_F = normal_variables['Resistance_F']
        oc.push('Resistance_F', Resistance_F)
                
        oc.eval(f"OHE_temp_cal_down_track_time({time_instant}, Ic_line_mag_Td_down, Ir_line_mag_Td_down, If_line_mag_Td_down, Ic_line_mag_Md_down, Ir_line_mag_Md_down, If_line_mag_Md_down, y, N_TSS, d, rad_C, rad_R1, rad_F, Resistance_C, Resistance_R1, Resistance_F, {OHE_config.Q_s}, {OHE_config.T_a}, {OHE_config.V_w}, {OHE_config.theta}, {OHE_config.e}, {OHE_config.a}, {OHE_config.T_0}, {OHE_config.mCp_c}, {OHE_config.mCp_r}, {OHE_config.mCp_f}, {OHE_config.alpha_c}, {OHE_config.alpha_r}, {OHE_config.alpha_f})")
        image_path = '../Plots_OHE/OHE_temp_cal_down_track_time.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="OHE_temp_cal_down_track_time.png",  # Replace with the desired download filename
                mime="image/png"
            )


if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/OHE_normal_down_track" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
