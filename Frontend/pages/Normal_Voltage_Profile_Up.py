import os
import streamlit as st
from PIL import Image
# Create an Oct2Py instance once
from pages.normal_workspace import normal_variables
from streamlit_extras.add_vertical_space import add_vertical_space
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

    st.markdown("<h1 class='title'>Voltage profile at a particular time instant Up Track</h1>", unsafe_allow_html=True)
    add_vertical_space(1)

    track_time_1 = st.number_input("Enter the time instant (in sec) at the which the voltage profile of track needs to be investigated", min_value=0)
    x_reso = st.number_input("Enter the distance resolution (in meter)", min_value=0)
    
    if st.button("Submit"):
        oc.eval("setenv('GNUTERM', 'gnuplot')")
        d = normal_variables['d']
        oc.push('d', d)

        TSS = normal_variables['TSS']
        oc.push('TSS', TSS)

        AT = normal_variables['AT']
        oc.push('AT', AT)

        y = normal_variables['y']
        oc.push('y', y)

        Vc_mag_Td_up = normal_variables['Vc_mag_Td_up']
        oc.push('Vc_mag_Td_up', Vc_mag_Td_up)

        Vc_ang_Td_up = normal_variables['Vc_ang_Td_up']
        oc.push('Vc_ang_Td_up', Vc_ang_Td_up)

        VR_mag_Td_up = normal_variables['VR_mag_Td_up']
        oc.push('VR_mag_Td_up', VR_mag_Td_up)

        VR_ang_Td_up = normal_variables['VR_ang_Td_up']
        oc.push('VR_ang_Td_up', VR_ang_Td_up)

        Vf_mag_Td_up = normal_variables['Vf_mag_Td_up']
        oc.push('Vf_mag_Td_up', Vf_mag_Td_up)

        Vf_ang_Td_up = normal_variables['Vf_ang_Td_up']
        oc.push('Vf_ang_Td_up', Vf_ang_Td_up)

        dTSS_T_up = normal_variables['dTSS_T_up']
        oc.push('dTSS_T_up', dTSS_T_up)

        Ic_line_mag_Td_up = normal_variables['Ic_line_mag_Td_up']
        oc.push('Ic_line_mag_Td_up', Ic_line_mag_Td_up)

        Ic_line_ang_Td_up = normal_variables['Ic_line_ang_Td_up']
        oc.push('Ic_line_ang_Td_up', Ic_line_ang_Td_up)

        Ir_line_mag_Td_up = normal_variables['Ir_line_mag_Td_up']
        oc.push('Ir_line_mag_Td_up', Ir_line_mag_Td_up)

        Ir_line_ang_Td_up = normal_variables['Ir_line_ang_Td_up']
        oc.push('Ir_line_ang_Td_up', Ir_line_ang_Td_up)

        If_line_mag_Td_up = normal_variables['If_line_mag_Td_up']
        oc.push('If_line_mag_Td_up', If_line_mag_Td_up)

        If_line_ang_Td_up = normal_variables['If_line_ang_Td_up']
        oc.push('If_line_ang_Td_up', If_line_ang_Td_up)

        Vc_mag_Md_up = normal_variables['Vc_mag_Md_up']
        oc.push('Vc_mag_Md_up', Vc_mag_Md_up)

        Vc_ang_Md_up = normal_variables['Vc_ang_Md_up']
        oc.push('Vc_ang_Md_up', Vc_ang_Md_up)

        VR_mag_Md_up = normal_variables['VR_mag_Md_up']
        oc.push('VR_mag_Md_up', VR_mag_Md_up)

        VR_ang_Md_up = normal_variables['VR_ang_Md_up']
        oc.push('VR_ang_Md_up', VR_ang_Md_up)

        Vf_mag_Md_up = normal_variables['Vf_mag_Md_up']
        oc.push('Vf_mag_Md_up', Vf_mag_Md_up)

        Vf_ang_Md_up = normal_variables['Vf_ang_Md_up']
        oc.push('Vf_ang_Md_up', Vf_ang_Md_up)

        dTSS_M_up = normal_variables['dTSS_M_up']
        oc.push('dTSS_M_up', dTSS_M_up)

        Ic_line_mag_Md_up = normal_variables['Ic_line_mag_Md_up']
        oc.push('Ic_line_mag_Md_up', Ic_line_mag_Md_up)

        Ic_line_ang_Md_up = normal_variables['Ic_line_ang_Md_up']
        oc.push('Ic_line_ang_Md_up', Ic_line_ang_Md_up)

        Ir_line_mag_Md_up = normal_variables['Ir_line_mag_Md_up']
        oc.push('Ir_line_mag_Md_up', Ir_line_mag_Md_up)

        Ir_line_ang_Md_up = normal_variables['Ir_line_ang_Md_up']
        oc.push('Ir_line_ang_Md_up', Ir_line_ang_Md_up)

        If_line_mag_Md_up = normal_variables['If_line_mag_Md_up']
        oc.push('If_line_mag_Md_up', If_line_mag_Md_up)

        If_line_ang_Md_up = normal_variables['If_line_ang_Md_up']
        oc.push('If_line_ang_Md_up', If_line_ang_Md_up)


        oc.eval(f"Full_UP_track_voltage_profile_instant_t({track_time_1},{x_reso},d, TSS, AT, y, Vc_mag_Td_up, Vc_ang_Td_up, VR_mag_Td_up, VR_ang_Td_up, Vf_mag_Td_up, Vf_ang_Td_up, dTSS_T_up, Ic_line_mag_Td_up, Ic_line_ang_Td_up, Ir_line_mag_Td_up, Ir_line_ang_Td_up, If_line_mag_Td_up, If_line_ang_Td_up, Vc_mag_Md_up, Vc_ang_Md_up, VR_mag_Md_up, VR_ang_Md_up, Vf_mag_Md_up, Vf_ang_Md_up, dTSS_M_up, Ic_line_mag_Md_up, Ic_line_ang_Md_up, Ir_line_mag_Md_up, Ir_line_ang_Md_up, If_line_mag_Md_up, If_line_ang_Md_up)")
        image_path = '../Plots_normal/Full_UP_track_voltage_profile_instant_t.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_container_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="Full_UP_track_voltage_profile_instant_t.png",  # Replace with the desired download filename
                mime="image/png"
            )
        
    if os.path.isfile('../normal_double_track/Voltage_distance_matrix_whole.mat'):
        AT = normal_variables['AT']
        TSS = normal_variables['TSS']
        oc.push('AT', AT)
        oc.push('TSS', TSS)
        
        col1, col2 = st.columns(2)
        oc.eval(f"load('Voltage_distance_matrix_whole.mat')")
        Voltage_distance_matrix_whole = oc.pull('Voltage_distance_matrix_whole')
        with col1:
            if st.button("Voltage profile of all TSSs at the entered time instant"):
                oc.eval(f"voltage_profile_design_predetermine_TSS(Voltage_distance_matrix_whole,AT,TSS)")
                image_path = '../Plots_normal/voltage_profile_design_predetermine_TSS.png'
                img = Image.open(image_path)
                st.image(img, caption="", use_container_width=True)

                with open(image_path, "rb") as file:
                    btn = st.download_button(
                        label="Download Plot",
                        data=file,
                        file_name="voltage_profile_design_predetermine_TSS.png",  # Replace with the desired download filename
                        mime="image/png"
                    )

        with col2:
            if st.button("Voltage profile of all ATs at the entered time instant"):
                oc.eval(f"voltage_profile_design_predetermine_AT(Voltage_distance_matrix_whole,AT,TSS)")
                image_path = '../Plots_normal/voltage_profile_design_predetermine_AT.png'
                img = Image.open(image_path)
                st.image(img, caption="", use_container_width=True)

                with open(image_path, "rb") as file:
                    btn = st.download_button(
                        label="Download Plot",
                        data=file,
                        file_name="voltage_profile_design_predetermine_AT.png",  # Replace with the desired download filename
                        mime="image/png"
                            )
            

if __name__ == "__main__":
    main()
    # if st.button("Back"):
    #     st.switch_page("pages/Load_Flow_Output.py")
    st.markdown(
        f"""
        <a href="/Normal_Voltage_Profile_Options" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
