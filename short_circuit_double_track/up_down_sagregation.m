%%% teaser winding voltage and line current sagregation%%%%
YY_up=nonzeros(dTSS_T_up(nt,:));
YY_up=transpose(YY_up);
YY_down=nonzeros(dTSS_T_down(nt,:));
YY_down=transpose(YY_down);
g_tot=length(Vc_mag_T);
g_line=length(Ic_line_mag_T);
g_line_up=length(YY_up);
g_line_down=length(YY_down);
tt=nonzeros(tTSS_T_up(nt,:));
tt2=nonzeros(tTSS_T_down(nt,:));
tt=transpose(tt);
tt2=transpose(tt2);
g_nod_up= length(tt);
g_nod_down= length(tt2);
for dd=1:1:g_nod_up
    
    Vc_mag_Td_up(nt,dd)=Vc_mag_T(dd);
    Vc_ang_Td_up(nt,dd)=Vc_ang_T(dd);
    Ic_mag_Td_up(nt,dd)=Ic_mag_T(dd);
    Ic_ang_Td_up(nt,dd)=Ic_ang_T(dd);
    VR_mag_Td_up(nt,dd)=VR_mag_T(dd);
    VR_ang_Td_up(nt,dd)=VR_ang_T(dd);
    IR_mag_Td_up(nt,dd)=IR_mag_T(dd);
    IR_ang_Td_up(nt,dd)=IR_ang_T(dd);
    Vf_mag_Td_up(nt,dd)=Vf_mag_T(dd);
    Vf_ang_Td_up(nt,dd)=Vf_ang_T(dd);
    If_mag_Td_up(nt,dd)=If_mag_T(dd);
    If_ang_Td_up(nt,dd)=If_ang_T(dd);
end
for dd=1:1:g_nod_down
    if dd==1
        Vc_mag_Td_down(nt,dd)=Vc_mag_T(1);
        Vc_ang_Td_down(nt,dd)=Vc_ang_T(1);
        Ic_mag_Td_down(nt,dd)=Ic_mag_T(1);
        Ic_ang_Td_down(nt,dd)=Ic_ang_T(1);
        VR_mag_Td_down(nt,dd)=VR_mag_T(1);
        VR_ang_Td_down(nt,dd)=VR_ang_T(1);
        IR_mag_Td_down(nt,dd)=IR_mag_T(1);
        IR_ang_Td_down(nt,dd)=IR_ang_T(1);
        Vf_mag_Td_down(nt,dd)=Vf_mag_T(1);
        Vf_ang_Td_down(nt,dd)=Vf_ang_T(1);
        If_mag_Td_down(nt,dd)=If_mag_T(1);
        If_ang_Td_down(nt,dd)=If_ang_T(1);
    else
        Vc_mag_Td_down(nt,dd)=Vc_mag_T(g_nod_up+dd-1);
        Vc_ang_Td_down(nt,dd)=Vc_ang_T(g_nod_up+dd-1);
        Ic_mag_Td_down(nt,dd)=Ic_mag_T(g_nod_up+dd-1);
        Ic_ang_Td_down(nt,dd)=Ic_ang_T(g_nod_up+dd-1);
        VR_mag_Td_down(nt,dd)=VR_mag_T(g_nod_up+dd-1);
        VR_ang_Td_down(nt,dd)=VR_ang_T(g_nod_up+dd-1);
        IR_mag_Td_down(nt,dd)=IR_mag_T(g_nod_up+dd-1);
        IR_ang_Td_down(nt,dd)=IR_ang_T(g_nod_up+dd-1);
        Vf_mag_Td_down(nt,dd)=Vf_mag_T(g_nod_up+dd-1);
        Vf_ang_Td_down(nt,dd)=Vf_ang_T(g_nod_up+dd-1);
        If_mag_Td_down(nt,dd)=If_mag_T(g_nod_up+dd-1);
        If_ang_Td_down(nt,dd)=If_ang_T(g_nod_up+dd-1);
    end
end
for dd=1:1:g_line_up
    Ic_line_mag_Td_up(nt,dd)=Ic_line_mag_T(dd);
    Ic_line_ang_Td_up(nt,dd)=Ic_line_ang_T(dd);
    Ir_line_mag_Td_up(nt,dd)=Ir_line_mag_T(dd);
    Ir_line_ang_Td_up(nt,dd)=Ir_line_ang_T(dd);
    If_line_mag_Td_up(nt,dd)=If_line_mag_T(dd);
    If_line_ang_Td_up(nt,dd)=If_line_ang_T(dd);
end

for dd=1:1:g_line_down
%     if dd==1
%         Ic_line_mag_Td_down(nt,dd)=Ic_line_mag_T(1);
%         Ic_line_ang_Td_down(nt,dd)=Ic_line_ang_T(1);
%         Ir_line_mag_Td_down(nt,dd)=Ir_line_mag_T(1);
%         Ir_line_ang_Td_down(nt,dd)=Ir_line_ang_T(1);
%         If_line_mag_Td_down(nt,dd)=If_line_mag_T(1);
%         If_line_ang_Td_down(nt,dd)=If_line_ang_T(1);
%     else
        Ic_line_mag_Td_down(nt,dd)=Ic_line_mag_T(g_line_up+dd);
        Ic_line_ang_Td_down(nt,dd)=Ic_line_ang_T(g_line_up+dd);
        Ir_line_mag_Td_down(nt,dd)=Ir_line_mag_T(g_line_up+dd);
        Ir_line_ang_Td_down(nt,dd)=Ir_line_ang_T(g_line_up+dd);
        If_line_mag_Td_down(nt,dd)=If_line_mag_T(g_line_up+dd);
        If_line_ang_Td_down(nt,dd)=If_line_ang_T(g_line_up+dd);
%     end
end
%%% Main winding voltage and line current sagregation%%%%
ZZ_up=nonzeros(dTSS_M_up(nt,:));
ZZ_up=transpose(ZZ_up);
ZZ_down=nonzeros(dTSS_M_down(nt,:));
ZZ_down=transpose(ZZ_down);
g_tot_m=length(Vc_mag_M);
g_line_m=length(Ic_line_mag_M);
g_line_up_m=length(ZZ_up);
g_line_down_m=length(ZZ_down);
tt_m=nonzeros(tTSS_M_up(nt,:));
tt2_m=nonzeros(tTSS_M_down(nt,:));
tt_m=transpose(tt_m);
tt2_m=transpose(tt2_m);
g_nod_up_m= length(tt_m);
g_nod_down_m= length(tt2_m);
for dd=1:1:g_nod_up_m
    
    Vc_mag_Md_up(nt,dd)=Vc_mag_M(dd);
    Vc_ang_Md_up(nt,dd)=Vc_ang_M(dd);
    Ic_mag_Md_up(nt,dd)=Ic_mag_M(dd);
    Ic_ang_Md_up(nt,dd)=Ic_ang_M(dd);
    VR_mag_Md_up(nt,dd)=VR_mag_M(dd);
    VR_ang_Md_up(nt,dd)=VR_ang_M(dd);
    IR_mag_Md_up(nt,dd)=IR_mag_M(dd);
    IR_ang_Md_up(nt,dd)=IR_ang_M(dd);
    Vf_mag_Md_up(nt,dd)=Vf_mag_M(dd);
    Vf_ang_Md_up(nt,dd)=Vf_ang_M(dd);
    If_mag_Md_up(nt,dd)=If_mag_M(dd);
    If_ang_Md_up(nt,dd)=If_ang_M(dd);
end
for dd=1:1:g_nod_down_m
    if dd==1
        Vc_mag_Md_down(nt,dd)=Vc_mag_M(1);
        Vc_ang_Md_down(nt,dd)=Vc_ang_M(1);
        Ic_mag_Md_down(nt,dd)=Ic_mag_M(1);
        Ic_ang_Md_down(nt,dd)=Ic_ang_M(1);
        VR_mag_Md_down(nt,dd)=VR_mag_M(1);
        VR_ang_Md_down(nt,dd)=VR_ang_M(1);
        IR_mag_Md_down(nt,dd)=IR_mag_M(1);
        IR_ang_Md_down(nt,dd)=IR_ang_M(1);
        Vf_mag_Md_down(nt,dd)=Vf_mag_M(1);
        Vf_ang_Md_down(nt,dd)=Vf_ang_M(1);
        If_mag_Md_down(nt,dd)=If_mag_M(1);
        If_ang_Md_down(nt,dd)=If_ang_M(1);
    else
        Vc_mag_Md_down(nt,dd)=Vc_mag_M(g_nod_up_m+dd-1);
        Vc_ang_Md_down(nt,dd)=Vc_ang_M(g_nod_up_m+dd-1);
        Ic_mag_Md_down(nt,dd)=Ic_mag_M(g_nod_up_m+dd-1);
        Ic_ang_Md_down(nt,dd)=Ic_ang_M(g_nod_up_m+dd-1);
        VR_mag_Md_down(nt,dd)=VR_mag_M(g_nod_up_m+dd-1);
        VR_ang_Md_down(nt,dd)=VR_ang_M(g_nod_up_m+dd-1);
        IR_mag_Md_down(nt,dd)=IR_mag_M(g_nod_up_m+dd-1);
        IR_ang_Md_down(nt,dd)=IR_ang_M(g_nod_up_m+dd-1);
        Vf_mag_Md_down(nt,dd)=Vf_mag_M(g_nod_up_m+dd-1);
        Vf_ang_Md_down(nt,dd)=Vf_ang_M(g_nod_up_m+dd-1);
        If_mag_Md_down(nt,dd)=If_mag_M(g_nod_up_m+dd-1);
        If_ang_Md_down(nt,dd)=If_ang_M(g_nod_up_m+dd-1);
    end
end
for dd=1:1:g_line_up_m
    Ic_line_mag_Md_up(nt,dd)=Ic_line_mag_M(dd);
    Ic_line_ang_Md_up(nt,dd)=Ic_line_ang_M(dd);
    Ir_line_mag_Md_up(nt,dd)=Ir_line_mag_M(dd);
    Ir_line_ang_Md_up(nt,dd)=Ir_line_ang_M(dd);
    If_line_mag_Md_up(nt,dd)=If_line_mag_M(dd);
    If_line_ang_Md_up(nt,dd)=If_line_ang_M(dd);
end

for dd=1:1:g_line_down_m
%     if dd==1
%         Ic_line_mag_Md_down(nt,dd)=Ic_line_mag_M(1);
%         Ic_line_ang_Md_down(nt,dd)=Ic_line_ang_M(1);
%         Ir_line_mag_Md_down(nt,dd)=Ir_line_mag_M(1);
%         Ir_line_ang_Md_down(nt,dd)=Ir_line_ang_M(1);
%         If_line_mag_Md_down(nt,dd)=If_line_mag_M(1);
%         If_line_ang_Md_down(nt,dd)=If_line_ang_M(1);
%     else
        Ic_line_mag_Md_down(nt,dd)=Ic_line_mag_M(g_line_up_m+dd);
        Ic_line_ang_Md_down(nt,dd)=Ic_line_ang_M(g_line_up_m+dd);
        Ir_line_mag_Md_down(nt,dd)=Ir_line_mag_M(g_line_up_m+dd);
        Ir_line_ang_Md_down(nt,dd)=Ir_line_ang_M(g_line_up_m+dd);
        If_line_mag_Md_down(nt,dd)=If_line_mag_M(g_line_up_m+dd);
        If_line_ang_Md_down(nt,dd)=If_line_ang_M(g_line_up_m+dd);
%     end
end

