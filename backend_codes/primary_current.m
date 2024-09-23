I_busT_1=[Ic_mag_Td(ii_ntt,1)*(cos(Ic_ang_Td(ii_ntt,1)*pi/180)+i*sin(Ic_ang_Td(ii_ntt,1)*pi/180));
                IR_mag_Td(ii_ntt,1)*(cos(IR_ang_Td(ii_ntt,1)*pi/180)+i*sin(IR_ang_Td(ii_ntt,1)*pi/180));
                If_mag_Td(ii_ntt,1)*(cos(If_ang_Td(ii_ntt,1)*pi/180)+i*sin(If_ang_Td(ii_ntt,1)*pi/180))];

I_busM_1=[Ic_mag_Md(ii_ntt,1)*(cos(Ic_ang_Md(ii_ntt,1)*pi/180)+i*sin(Ic_ang_Md(ii_ntt,1)*pi/180));
                IR_mag_Md(ii_ntt,1)*(cos(IR_ang_Md(ii_ntt,1)*pi/180)+i*sin(IR_ang_Md(ii_ntt,1)*pi/180));
                If_mag_Md(ii_ntt,1)*(cos(If_ang_Md(ii_ntt,1)*pi/180)+i*sin(If_ang_Md(ii_ntt,1)*pi/180))];

V_busT_1=[Vc_mag_Td(ii_ntt,1)*(cos(Vc_ang_Td(ii_ntt,1)*pi/180)+i*sin(Vc_ang_Td(ii_ntt,1)*pi/180));
                VR_mag_Td(ii_ntt,1)*(cos(VR_ang_Td(ii_ntt,1)*pi/180)+i*sin(VR_ang_Td(ii_ntt,1)*pi/180));
                Vf_mag_Td(ii_ntt,1)*(cos(Vf_ang_Td(ii_ntt,1)*pi/180)+i*sin(Vf_ang_Td(ii_ntt,1)*pi/180))];

V_busM_1=[Vc_mag_Md(ii_ntt,1)*(cos(Vc_ang_Md(ii_ntt,1)*pi/180)+i*sin(Vc_ang_Md(ii_ntt,1)*pi/180));
                VR_mag_Md(ii_ntt,1)*(cos(VR_ang_Md(ii_ntt,1)*pi/180)+i*sin(VR_ang_Md(ii_ntt,1)*pi/180));
                Vf_mag_Md(ii_ntt,1)*(cos(Vf_ang_Md(ii_ntt,1)*pi/180)+i*sin(Vf_ang_Md(ii_ntt,1)*pi/180))];


Itc=I_busT_1(1)-(V_busT_1(1)*((1/(2*Z1))+(1/Zs1)))-(V_busT_1(3)*((-1/(2*Z1))+(1/Zs1)))+(V_busT_1(2)*2/Zs1);
Itf=I_busT_1(3)-(V_busT_1(3)*((1/(2*Z1))+(1/Zs1)))-(V_busT_1(1)*((-1/(2*Z1))+(1/Zs1)))+(V_busT_1(2)*2/Zs1);
Imc=I_busM_1(1)-(V_busM_1(1)*((1/(2*Z2))+(1/Zs2)))-(V_busM_1(3)*((-1/(2*Z2))+(1/Zs2)))+(V_busM_1(2)*2/Zs2);
Imf=I_busM_1(3)-(V_busM_1(3)*((1/(2*Z2))+(1/Zs2)))-(V_busM_1(1)*((-1/(2*Z2))+(1/Zs2)))+(V_busM_1(2)*2/Zs2);
Imr=(V_busM_1(1)/(Zs2/2))+(V_busM_1(3)/(Zs2/2))-(4*V_busM_1(2)/Zs2);
Itr=(V_busT_1(1)/(Zs1/2))+(V_busT_1(3)/(Zs1/2))-(4*V_busT_1(2)/Zs1);

 Mva_main_sec1=V_busM_1'*[conj(Imc);conj(Imr);conj(Imf)];
 Mva_teaser_sec1=V_busT_1'*[conj(Itc);conj(Itr);conj(Itf)];
% Mva_main_sec1=V_busM_1(1)*conj(Imc)+V_busM_1(2)*conj(Imr)+V_busM_1(3)*conj(Imf);
% Mva_teaser_sec1=V_busT_1(1)*conj(Itc)+V_busT_1(2)*conj(Itr)+V_busT_1(3)*conj(Itf);
Mva_sec1=Mva_teaser_sec1+Mva_main_sec1;
Mva_sec(i_time,n_track)=Mva_sec1;
Mva_sec_abs(i_time,n_track)=abs(Mva_sec1);
% Multiply1=[(1/(2*a1)) (-1/(2*a1)) (-1/(2*a1)) 0 0 0; (-1/(4*a1)) (1/(4*a1)) (1/(4*a1)) (1/(2*a2)) (-1/(2*a2)) (-1/(2*a2)); (-1/(4*a1)) (1/(4*a1)) (1/(4*a1)) (-1/(2*a2)) (1/(2*a2)) (1/(2*a2))];
Multiply=[(1/(2*a1)) (-1/(2*a1)) 0 0; (-1/(4*a1)) (1/(4*a1)) (1/(2*a2)) (-1/(2*a2)); (-1/(4*a1)) (1/(4*a1)) (-1/(2*a2)) (1/(2*a2))];
IABC=[0;0;0];
 IABC=Multiply*[Itc; Itf; Imc; Imf];
% IABC=Multiply1*[Itc; Itr; Itf; Imc; Imr; Imf];
IA_primary(i_time,n_track)=IABC(1,1);
IB_primary(i_time,n_track)=IABC(2,1);
IC_primary(i_time,n_track)=IABC(3,1);
Vt_a=Va-Zshort*IABC(1,1);
Vt_b=Vb-Zshort*IABC(2,1);
Vt_c=Vc-Zshort*IABC(3,1);
Vt_ABC=[Vt_a;Vt_b;Vt_c];
% s_AP_pw=(Va*conj(IABC(1))/(2/sqrt(3)))+(Vb*conj(IABC(2))/sqrt(3))+(Vc*conj(IABC(3))/sqrt(3));
  s_AP_pw=(Vt_a*conj(IABC(1))/(2/sqrt(3)))+((Vt_b)*conj(IABC(2)+IABC(1)/2));
% s_AP_pw=(Va*conj(IABC(1))/(2/sqrt(3)))+((Vb)*conj(IABC(2)+IABC(1)/2));
% s_AP_pw=(Va*conj(IABC(1))/(2/sqrt(3)))+((Vb)*conj(IABC(2)+IABC(1)/2))/2 + (Vc*conj(IABC(3)+IABC(1)/2))/2;
tt_time(i_time)=i_time;
s_apprant_power(i_time,n_track)=s_AP_pw;
s_apprant_power_MVA_mag(i_time,n_track)=abs(s_AP_pw);
P_active_power(i_time,n_track)=real(s_AP_pw);
Q_reactive_power(i_time,n_track)=imag(s_AP_pw);
Vt_a=Va-Zshort*IABC(1,1);
Vt_b=Vb-Zshort*IABC(2,1);
Vt_c=Vc-Zshort*IABC(3,1);
Vt_ABC=[Vt_a;Vt_b;Vt_c];
a=exp(i*2*pi/3);
SeqI=[1,1,1;1,a,a*a;1,a*a,a]*Vt_ABC/3;
Unb(i_time,n_track)=(abs(SeqI(3,1))/abs(SeqI(2,1)))*100;

% Itc=I_busT(1)-(VcrfT(1)*((1/(2*Z1))+(1/Zs1)))-(VcrfT(3)*((-1/(2*Z1))+(1/Zs1)))+(VcrfT(2)*2/Zs1);
% Itf=I_busT(3)-(VcrfT(3)*((1/(2*Z1))+(1/Zs1)))-(VcrfT(1)*((-1/(2*Z1))+(1/Zs1)))+(VcrfT(2)*2/Zs1);
% Imc=I_busM(1)-(VcrfM(1)*((1/(2*Z2))+(1/Zs2)))-(VcrfM(3)*((-1/(2*Z2))+(1/Zs2)))+(VcrfM(2)*2/Zs2);
% Imf=I_busM(3)-(VcrfM(3)*((1/(2*Z2))+(1/Zs2)))-(VcrfM(1)*((-1/(2*Z2))+(1/Zs2)))+(VcrfM(2)*2/Zs2);