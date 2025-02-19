import os
import streamlit as st
from PIL import Image
# Create an Oct2Py instance once
from pages.oTo_double_Workspace import oTo_double_workspace
from streamlit_extras.add_vertical_space import add_vertical_space
from oct2py import Oct2Py
oc = Oct2Py() 
oc.eval('cd("../oTo_Double_Track")') 


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

    st.markdown("<h1 class='title'>Voltage profile at a particular time instant Down Track</h1>", unsafe_allow_html=True)
    add_vertical_space(1)

    track_time_1 = st.number_input("Enter the time instant (in sec) at the which the voltage profile of track needs to be investigated", min_value=0)
    x_reso = st.number_input("Enter the distance resolution (in meter)", min_value=0)
    
    if st.button("Submit"):
        oc.eval("setenv('GNUTERM', 'gnuplot')")
        
        N_TSS_O = oTo_double_workspace['N_TSS_O']
        oc.push('N_TSS_O', N_TSS_O)
        
        N_TSS = oTo_double_workspace['N_TSS']
        oc.push('N_TSS', N_TSS)
        
        d = oTo_double_workspace['d']
        oc.push('d', d)

        TSS = oTo_double_workspace['TSS']
        oc.push('TSS', TSS)

        AT = oTo_double_workspace['AT']
        oc.push('AT', AT)

        y = oTo_double_workspace['y']
        oc.push('y', y)

        Vc_mag_Td_down = oTo_double_workspace['Vc_mag_Td_down']
        oc.push('Vc_mag_Td_down', Vc_mag_Td_down)

        Vc_ang_Td_down = oTo_double_workspace['Vc_ang_Td_down']
        oc.push('Vc_ang_Td_down', Vc_ang_Td_down)

        VR_mag_Td_down = oTo_double_workspace['VR_mag_Td_down']
        oc.push('VR_mag_Td_down', VR_mag_Td_down)

        VR_ang_Td_down = oTo_double_workspace['VR_ang_Td_down']
        oc.push('VR_ang_Td_down', VR_ang_Td_down)

        Vf_mag_Td_down = oTo_double_workspace['Vf_mag_Td_down']
        oc.push('Vf_mag_Td_down', Vf_mag_Td_down)

        Vf_ang_Td_down = oTo_double_workspace['Vf_ang_Td_down']
        oc.push('Vf_ang_Td_down', Vf_ang_Td_down)

        dTSS_T_down = oTo_double_workspace['dTSS_T_down']
        oc.push('dTSS_T_down', dTSS_T_down)

        Ic_line_mag_Td_down = oTo_double_workspace['Ic_line_mag_Td_down']
        oc.push('Ic_line_mag_Td_down', Ic_line_mag_Td_down)

        Ic_line_ang_Td_down = oTo_double_workspace['Ic_line_ang_Td_down']
        oc.push('Ic_line_ang_Td_down', Ic_line_ang_Td_down)

        Ir_line_mag_Td_down = oTo_double_workspace['Ir_line_mag_Td_down']
        oc.push('Ir_line_mag_Td_down', Ir_line_mag_Td_down)

        Ir_line_ang_Td_down = oTo_double_workspace['Ir_line_ang_Td_down']
        oc.push('Ir_line_ang_Td_down', Ir_line_ang_Td_down)

        If_line_mag_Td_down = oTo_double_workspace['If_line_mag_Td_down']
        oc.push('If_line_mag_Td_down', If_line_mag_Td_down)

        If_line_ang_Td_down = oTo_double_workspace['If_line_ang_Td_down']
        oc.push('If_line_ang_Td_down', If_line_ang_Td_down)

        z1_loaded = oTo_double_workspace['z1']
        oc.push('z1_loaded', z1_loaded)

        Vc_mag_Md_down = oTo_double_workspace['Vc_mag_Md_down']
        oc.push('Vc_mag_Md_down', Vc_mag_Md_down)

        Vc_ang_Md_down = oTo_double_workspace['Vc_ang_Md_down']
        oc.push('Vc_ang_Md_down', Vc_ang_Md_down)

        VR_mag_Md_down = oTo_double_workspace['VR_mag_Md_down']
        oc.push('VR_mag_Md_down', VR_mag_Md_down)

        VR_ang_Md_down = oTo_double_workspace['VR_ang_Md_down']
        oc.push('VR_ang_Md_down', VR_ang_Md_down)

        Vf_mag_Md_down = oTo_double_workspace['Vf_mag_Md_down']
        oc.push('Vf_mag_Md_down', Vf_mag_Md_down)

        Vf_ang_Md_down = oTo_double_workspace['Vf_ang_Md_down']
        oc.push('Vf_ang_Md_down', Vf_ang_Md_down)

        dTSS_M_down = oTo_double_workspace['dTSS_M_down']
        oc.push('dTSS_M_down', dTSS_M_down)

        Ic_line_mag_Md_down = oTo_double_workspace['Ic_line_mag_Md_down']
        oc.push('Ic_line_mag_Md_down', Ic_line_mag_Md_down)

        Ic_line_ang_Md_down = oTo_double_workspace['Ic_line_ang_Md_down']
        oc.push('Ic_line_ang_Md_down', Ic_line_ang_Md_down)

        Ir_line_mag_Md_down = oTo_double_workspace['Ir_line_mag_Md_down']
        oc.push('Ir_line_mag_Md_down', Ir_line_mag_Md_down)

        Ir_line_ang_Md_down = oTo_double_workspace['Ir_line_ang_Md_down']
        oc.push('Ir_line_ang_Md_down', Ir_line_ang_Md_down)

        If_line_mag_Md_down = oTo_double_workspace['If_line_mag_Md_down']
        oc.push('If_line_mag_Md_down', If_line_mag_Md_down)

        If_line_ang_Md_down = oTo_double_workspace['If_line_ang_Md_down']
        oc.push('If_line_ang_Md_down', If_line_ang_Md_down)


        oc.eval(f"Full_Down_track_voltage_profile_instant_t_outage(N_TSS_O, N_TSS, {track_time_1},{x_reso},d, TSS, AT, y, Vc_mag_Td_down, Vc_ang_Td_down, VR_mag_Td_down, VR_ang_Td_down, Vf_mag_Td_down, Vf_ang_Td_down, dTSS_T_down, Ic_line_mag_Td_down, Ic_line_ang_Td_down, Ir_line_mag_Td_down, Ir_line_ang_Td_down, If_line_mag_Td_down, If_line_ang_Td_down, z1_loaded, Vc_mag_Md_down, Vc_ang_Md_down, VR_mag_Md_down, VR_ang_Md_down, Vf_mag_Md_down, Vf_ang_Md_down, dTSS_M_down, Ic_line_mag_Md_down, Ic_line_ang_Md_down, Ir_line_mag_Md_down, Ir_line_ang_Md_down, If_line_mag_Md_down, If_line_ang_Md_down)")
        image_path = '../Plots_oTo_double/Full_Down_track_voltage_profile_instant_t_outage.png'
        img = Image.open(image_path)
        st.image(img, caption="", use_column_width=True)

        with open(image_path, "rb") as file:
            btn = st.download_button(
                label="Download Plot",
                data=file,
                file_name="Full_Down_track_voltage_profile_instant_t_outage.png",  # Replace with the desired download filename
                mime="image/png"
            )
        
    if os.path.isfile('../oTo_double_track/Voltage_distance_matrix_whole.mat'):
        AT = oTo_double_workspace['AT']
        TSS = oTo_double_workspace['TSS']
        oc.push('AT', AT)
        oc.push('TSS', TSS)
        N_TSS_O = oTo_double_workspace['N_TSS_O']
        oc.push('N_TSS_O', N_TSS_O)
        
        col1, col2 = st.columns(2)
        oc.eval(f"load('Voltage_distance_matrix_whole.mat')")
        Voltage_distance_matrix_whole = oc.pull('Voltage_distance_matrix_whole')
        with col1:
            if st.button("Voltage profile of all TSSs at the entered time instant"):
                oc.eval(f"voltage_profile_design_predetermine_TSS_outage(N_TSS_O, Voltage_distance_matrix_whole,AT,TSS)")
                image_path = '../Plots_oTo_double/voltage_profile_design_predetermine_TSS_outage.png'
                img = Image.open(image_path)
                st.image(img, caption="", use_column_width=True)

                with open(image_path, "rb") as file:
                    btn = st.download_button(
                        label="Download Plot",
                        data=file,
                        file_name="voltage_profile_design_predetermine_TSS_outage.png",  # Replace with the desired download filename
                        mime="image/png"
                    )

        with col2:
            if st.button("Voltage profile of all ATs at the entered time instant"):
                oc.eval(f"voltage_profile_design_predetermine_AT_outage(N_TSS_O, Voltage_distance_matrix_whole,AT,TSS)")
                image_path = '../Plots_oTo_double/voltage_profile_design_predetermine_AT_outage.png'
                img = Image.open(image_path)
                st.image(img, caption="", use_column_width=True)

                with open(image_path, "rb") as file:
                    btn = st.download_button(
                        label="Download Plot",
                        data=file,
                        file_name="voltage_profile_design_predetermine_AT_outage.png",  # Replace with the desired download filename
                        mime="image/png"
                            )
            

if __name__ == "__main__":
    main()
    st.markdown(
        f"""
        <a href="/oTo_Voltage_Profile_Options" target="_self" class="custom-button">Back</a>
        """,
        unsafe_allow_html=True
    )
