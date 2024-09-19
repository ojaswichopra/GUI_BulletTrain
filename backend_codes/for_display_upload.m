
%%%% forteaser winding%%%%
itrTd(nt)=itrT;


g_l=length(Vc_mag_T);
for dd=1:1:g_l
    Vc_mag_Td(nt,dd)=Vc_mag_T(dd);
end
g_l=length(Vc_ang_T);
for dd=1:1:g_l
    Vc_ang_Td(nt,dd)=Vc_ang_T(dd);                  %%catenary%%
end
g_l=length(Ic_mag_T);
for dd=1:1:g_l
    Ic_mag_Td(nt,dd)=Ic_mag_T(dd);
end
g_l=length(Ic_ang_T);
for dd=1:1:g_l
    Ic_ang_Td(nt,dd)=Ic_ang_T(dd);
end


%%%%%%%
g_l=length(VR_mag_T);
for dd=1:1:g_l
    VR_mag_Td(nt,dd)=VR_mag_T(dd);
end
g_l=length(VR_ang_T);
for dd=1:1:g_l
    VR_ang_Td(nt,dd)=VR_ang_T(dd);                  %%Rail%%
end
g_l=length(IR_mag_T);
for dd=1:1:g_l
    IR_mag_Td(nt,dd)=IR_mag_T(dd);
end
g_l=length(IR_ang_T);
for dd=1:1:g_l
    IR_ang_Td(nt,dd)=IR_ang_T(dd);
end
%%%%
g_l=length(Vf_mag_T);
for dd=1:1:g_l
    Vf_mag_Td(nt,dd)=Vf_mag_T(dd);
end
g_l=length(Vf_ang_T);
for dd=1:1:g_l
    Vf_ang_Td(nt,dd)=Vf_ang_T(dd);                  %%feedder%%
end
g_l=length(If_mag_T);
for dd=1:1:g_l
    If_mag_Td(nt,dd)=If_mag_T(dd);
end
g_l=length(If_ang_T);
for dd=1:1:g_l
    If_ang_Td(nt,dd)=If_ang_T(dd);
end
%%%%%%% for main winding%%%%%%%
itrMd(nt)=itrM;

g_l=length(Vc_mag_M);
for dd=1:1:g_l
    Vc_mag_Md(nt,dd)=Vc_mag_M(dd);
end
g_l=length(Vc_ang_M);
for dd=1:1:g_l
    Vc_ang_Md(nt,dd)=Vc_ang_M(dd);
end
g_l=length(Ic_mag_M);
for dd=1:1:g_l
    Ic_mag_Md(nt,dd)=Ic_mag_M(dd);
end
g_l=length(Ic_ang_M);
for dd=1:1:g_l
    Ic_ang_Md(nt,dd)=Ic_ang_M(dd);
end


%%%%%%%
g_l=length(VR_mag_M);
for dd=1:1:g_l
    VR_mag_Md(nt,dd)=VR_mag_M(dd);
end
g_l=length(VR_ang_M);
for dd=1:1:g_l
    VR_ang_Md(nt,dd)=VR_ang_M(dd);
end
g_l=length(IR_mag_M);
for dd=1:1:g_l
    IR_mag_Md(nt,dd)=IR_mag_M(dd);
end
g_l=length(IR_ang_M);
for dd=1:1:g_l
    IR_ang_Md(nt,dd)=IR_ang_M(dd);
end
%%%%
g_l=length(Vf_mag_M);
for dd=1:1:g_l
    Vf_mag_Md(nt,dd)=Vf_mag_M(dd);
end
g_l=length(Vf_ang_M);
for dd=1:1:g_l
    Vf_ang_Md(nt,dd)=Vf_ang_M(dd);
end
g_l=length(If_mag_M);
for dd=1:1:g_l
    If_mag_Md(nt,dd)=If_mag_M(dd);
end
g_l=length(If_ang_M);
for dd=1:1:g_l
    If_ang_Md(nt,dd)=If_ang_M(dd);
end
%%% Teaser winding Line current %%
g_1=length(Ic_line_mag_T);
for dd=1:1:g_1
    Ic_line_mag_Td(nt,dd)=Ic_line_mag_T(dd);
end
g_1=length(Ic_line_ang_T);
for dd=1:1:g_1
    Ic_line_ang_Td(nt,dd)=Ic_line_ang_T(dd);
end
g_1=length(Ir_line_mag_T);
for dd=1:1:g_1
    Ir_line_mag_Td(nt,dd)=Ir_line_mag_T(dd);
end
g_1=length(Ir_line_ang_T);
for dd=1:1:g_1
    Ir_line_ang_Td(nt,dd)=Ir_line_ang_T(dd);
end
g_1=length(If_line_mag_T);
for dd=1:1:g_1
    If_line_mag_Td(nt,dd)=If_line_mag_T(dd);
end
g_1=length(If_line_ang_T);
for dd=1:1:g_1
    If_line_ang_Td(nt,dd)=If_line_ang_T(dd);
end

%% Main winding line current%%

g_1=length(Ic_line_mag_M);
for dd=1:1:g_1
    Ic_line_mag_Md(nt,dd)=Ic_line_mag_M(dd);
end
g_1=length(Ic_line_ang_M);
for dd=1:1:g_1
    Ic_line_ang_Md(nt,dd)=Ic_line_ang_M(dd);
end
g_1=length(Ir_line_mag_M);
for dd=1:1:g_1
    Ir_line_mag_Md(nt,dd)=Ir_line_mag_M(dd);
end
g_1=length(Ir_line_ang_M);
for dd=1:1:g_1
    Ir_line_ang_Md(nt,dd)=Ir_line_ang_M(dd);
end
g_1=length(If_line_mag_M);
for dd=1:1:g_1
    If_line_mag_Md(nt,dd)=If_line_mag_M(dd);
end
g_1=length(If_line_ang_M);
for dd=1:1:g_1
    If_line_ang_Md(nt,dd)=If_line_ang_M(dd);
end