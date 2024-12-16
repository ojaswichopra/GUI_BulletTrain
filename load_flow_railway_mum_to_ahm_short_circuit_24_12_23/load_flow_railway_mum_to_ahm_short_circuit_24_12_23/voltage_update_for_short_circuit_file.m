if fault_wind_side==1
    g_l=length(Vs_T(:,1));
    for dd=1:1:g_l
        Vc_mag_Td(nt,dd)=abs(Vs_T(dd,1));
        Vc_ang_Td(nt,dd)=angle(Vs_T(dd,1))*180/pi;
        VR_mag_Td(nt,dd)=abs(Vs_T(dd,2));
        VR_ang_Td(nt,dd)=angle(Vs_T(dd,2))*180/pi;
        Vf_mag_Td(nt,dd)=abs(Vs_T(dd,3));
        Vf_ang_Td(nt,dd)=angle(Vs_T(dd,3))*180/pi;
        

    end
    g_1=length(I_line_current_magT_s(:,1));
    for dd=1:1:g_1
        Ic_line_mag_Td(nt,dd)=I_line_current_magT_s(dd,1);
        Ic_line_ang_Td(nt,dd)=I_line_current_angT_s(dd,1);
        Ir_line_mag_Td(nt,dd)=I_line_current_magT_s(dd,2);
        Ir_line_ang_Td(nt,dd)=I_line_current_angT_s(dd,2);
        If_line_mag_Td(nt,dd)=I_line_current_magT_s(dd,3);
        If_line_ang_Td(nt,dd)=I_line_current_angT_s(dd,3);
    end
else
     g_l=length(Vs_M(:,1));
    for dd=1:1:g_l
        Vc_mag_Md(nt,dd)=abs(Vs_M(dd,1));
        Vc_ang_Md(nt,dd)=angle(Vs_M(dd,1))*180/pi;
        VR_mag_Md(nt,dd)=abs(Vs_M(dd,2));
        VR_ang_Md(nt,dd)=angle(Vs_M(dd,2))*180/pi;
        Vf_mag_Md(nt,dd)=abs(Vs_M(dd,3));
        Vf_ang_Md(nt,dd)=angle(Vs_M(dd,3))*180/pi;
        
    end
    g_1=length(I_line_current_magM_s(:,1));
    for dd=1:1:g_1
        Ic_line_mag_Md(nt,dd)=I_line_current_magM_s(dd,1);
        Ic_line_ang_Md(nt,dd)=I_line_current_angM_s(dd,1);
        Ir_line_mag_Md(nt,dd)=I_line_current_magM_s(dd,2);
        Ir_line_ang_Md(nt,dd)=I_line_current_angM_s(dd,2);
        If_line_mag_Md(nt,dd)=I_line_current_magM_s(dd,3);
        If_line_ang_Md(nt,dd)=I_line_current_angM_s(dd,3);
    end

end