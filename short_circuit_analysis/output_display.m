% display(' iteration required in load flow to converge for Teaser and Main winging');
% display('     iteration_main_winding         iteration_teaser_winding    ');
% display([      itrM'                                itrT']);
% 
% display('=================================================================================================================');
% display('----------voltage magnitude & angle of teasear-winding circuit -------------');
% display('=================================================================================================================');
% display('    Vc_mag                  Vr_mag              Vf_mag              Vc_ang           Vr_ang             Vf_ang');
% display('      kV                      kV                  kV                 deg               deg                deg');
s=1;
Vc_mag_T=zeros(1,N);
Vc_ang_T=zeros(1,N);
VR_mag_T=zeros(1,N);
VR_ang_T=zeros(1,N);
Vf_mag_T=zeros(1,N);
Vf_ang_T=zeros(1,N);
Ic_mag_T=zeros(1,N);
Ic_ang_T=zeros(1,N);
IR_mag_T=zeros(1,N);
IR_ang_T=zeros(1,N);
If_mag_T=zeros(1,N);
If_ang_T=zeros(1,N);
for j=1:1:N
    Vc_mag_T(j)=voltage_magnitudeT(s);
    Vc_ang_T(j)=voltage_angleT(s);
    Ic_mag_T(j)= I_bus_magnitudeT(s);
    Ic_ang_T(j)= I_bus_angleT(s);
    s=s+1;
    VR_mag_T(j)= voltage_magnitudeT(s);
    VR_ang_T(j)=voltage_angleT(s);
    IR_mag_T(j)= I_bus_magnitudeT(s);
    IR_ang_T(j)= I_bus_angleT(s);
    s=s+1;
    Vf_mag_T(j)= voltage_magnitudeT(s);
    Vf_ang_T(j)=voltage_angleT(s);
    If_mag_T(j)= I_bus_magnitudeT(s);
    If_ang_T(j)= I_bus_angleT(s);
    s=s+1;
end
% display([Vc_mag_T'      VR_mag_T'        Vf_mag_T'        Vc_ang_T'         VR_ang_T'         Vf_ang_T']);
% display('===================================================================================================================');
% display('----------Bus_current at each node magnitude & angle of teasear-winding circuit -------------');
% display('====================================================================================================================');
% display('    Ic_Bus_mag             Ir_Bus_mag           If_Bus_mag         Ic_Bus_ang        Ir_Bus_ang        If_Bus_ang');
% display('      kA                      kA                  kA                 deg               deg                deg');
% display([Ic_mag_T'      IR_mag_T'        If_mag_T'        Ic_ang_T'         IR_ang_T'         If_ang_T']);
% 
% display('--------------------------------------------------------------------------------------------------------------------------------------------------------------');
% 
% display('=====================================================================================================================');
% display('----------voltage magnitude & angle of main-winding circuit -------------');
% display('======================================================================================================================');
% display('    Vc_mag                  Vr_mag              Vf_mag              Vc_ang           Vr_ang            Vf_ang');
% display('      kV                      kV                  kV                  deg              deg               deg');
s=1;
Vc_mag_M=zeros(1,N_M);
Vc_ang_M=zeros(1,N_M);
VR_mag_M=zeros(1,N_M);
VR_ang_M=zeros(1,N_M);
Vf_mag_M=zeros(1,N_M);
Vf_ang_M=zeros(1,N_M);
Ic_mag_M=zeros(1,N_M);
Ic_ang_M=zeros(1,N_M);
IR_mag_M=zeros(1,N_M);
IR_ang_M=zeros(1,N_M);
If_mag_M=zeros(1,N_M);
If_ang_M=zeros(1,N_M);
for j=1:1:N_M
    Vc_mag_M(j)=voltage_magnitudeM(s);
    Vc_ang_M(j)=voltage_angleM(s);
    Ic_mag_M(j)= I_bus_magnitudeM(s);
    Ic_ang_M(j)= I_bus_angleM(s);
    s=s+1;
    VR_mag_M(j)= voltage_magnitudeM(s);
    VR_ang_M(j)=voltage_angleM(s);
    IR_mag_M(j)= I_bus_magnitudeM(s);
    IR_ang_M(j)= I_bus_angleM(s);
    s=s+1;
    Vf_mag_M(j)= voltage_magnitudeM(s);
    Vf_ang_M(j)=voltage_angleM(s);
    If_mag_M(j)= I_bus_magnitudeM(s);
    If_ang_M(j)= I_bus_angleM(s);
    s=s+1;
end
% display([Vc_mag_M'      VR_mag_M'        Vf_mag_M'      Vc_ang_M'       VR_ang_M'         Vf_ang_M']); 
% display('=================================================================================================================');
% display('----------Bus_current at each node magnitude & angle of Main-winding circuit -------------');
% display('==================================================================================================================');
% display('    Ic_Bus_mag             Ir_Bus_mag           If_Bus_mag         Ic_Bus_ang        Ir_Bus_ang        If_Bus_ang');
% display('      kA                      kA                  kA                 deg               deg                deg');
% display([Ic_mag_M'      IR_mag_M'        If_mag_M'        Ic_ang_M'         IR_ang_M'         If_ang_M']);
% display('==================================================================================================================');
% 
% display('--------------------------------------------------------------------------------------------------------------------------------');
% 
% display('=================================================================================================================');
% display('----------Line_current from start node to end node magnitude & angle of Teaser-winding circuit -------------');
% display('==================================================================================================================');

s=1;
Ic_line_mag_T=zeros(1,NBranch);
Ic_line_ang_T=zeros(1,NBranch);
Ir_line_mag_T=zeros(1,NBranch);
Ir_line_ang_T=zeros(1,NBranch);
If_line_mag_T=zeros(1,NBranch);
If_line_ang_T=zeros(1,NBranch);
for j=1:1:NBranch
    Ic_line_mag_T(j)=I_line_current_magT(s);
    Ic_line_ang_T(j)=I_line_current_angT(s);
    s=s+1;
    Ir_line_mag_T(j)=I_line_current_magT(s);
    Ir_line_ang_T(j)=I_line_current_angT(s);
    s=s+1;
    If_line_mag_T(j)=I_line_current_magT(s);
    If_line_ang_T(j)=I_line_current_angT(s);
    s=s+1;
end
% display('    start node             end node           Ic_line_mag            Ir_line_mag        If_line_mag          Ic_line_ang         Ir_line_ang        If_line_ang');
% display('                                                  kA                      kA                  kA                 deg                 deg                deg');
% display([line_start_bus'       line_end_bus'              Ic_line_mag_T'         Ir_line_mag_T'        If_line_mag_T'        Ic_line_ang_T'       Ir_line_ang_T'      If_line_ang_T']);
% display('==================================================================================================================');
% display('=================================================================================================================');
% display('----------Line_current from start node to end node magnitude & angle of main-winding circuit -------------');
% display('==================================================================================================================');

s=1;
Ic_line_mag_M=zeros(1,NBranch_M);
Ic_line_ang_M=zeros(1,NBranch_M);
Ir_line_mag_M=zeros(1,NBranch_M);
Ir_line_ang_M=zeros(1,NBranch_M);
If_line_mag_M=zeros(1,NBranch_M);
If_line_ang_M=zeros(1,NBranch_M);
for j=1:1:NBranch_M
    Ic_line_mag_M(j)=I_line_current_magM(s);
    Ic_line_ang_M(j)=I_line_current_angM(s);
    s=s+1;
    Ir_line_mag_M(j)=I_line_current_magM(s);
    Ir_line_ang_M(j)=I_line_current_angM(s);
    s=s+1;
    If_line_mag_M(j)=I_line_current_magM(s);
    If_line_ang_M(j)=I_line_current_angM(s);
    s=s+1;
end
% display('    start node             end node           Ic_line_mag            Ir_line_mag        If_line_mag          Ic_line_ang         Ir_line_ang        If_line_ang');
% display('                                                  kA                      kA                  kA                 deg                 deg                deg');
% display([line_start_bus_M'       line_end_bus_M'              Ic_line_mag_M'         Ir_line_mag_M'        If_line_mag_M'        Ic_line_ang_M'       Ir_line_ang_M'      If_line_ang_M']);
% display('==================================================================================================================');
