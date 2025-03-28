
ZbusT=inv(YbusT);  % Impedance matrix of teaser side at fundamental frequency
ZbusM=inv(YbusM);  % Impedance matrix of main side at fundamental frequency

%Array initialization
Ibus_h_T=zeros(3*N,H-1);   % Bus injected harmonic current vector of teaser side
Ibus_h_M=zeros(3*N_M,H-1);   % Bus injected harmonic current vector of main side
Vbus_h_T=zeros(3*N,H-1);    % Harmonic bus voltages of Teaser side
Vbus_h_M=zeros(3*N_M,H-1);  % Harmonic bus voltages of Main side
V_H_T=zeros(3*N,1);
V_H_M=zeros(3*N,1);
THD_T=zeros(3*N,1);    %THD of teaser side
THD_M=zeros(3*N_M,1);  %THD of main side
I_line_1_2_h_T=zeros(6,H-1); % Teaser winding up-track and down-track node 1 to node 2 harmonic line currents  
I_C_F_T_h=zeros(2,H-1); % Teaser winding up-track and down-track combined Contact and Feeder harmonic current
I_line_1_2_h_M=zeros(6,H-1); % Main winding up-track and down-track node 1 to node 2 harmonic line currents
I_C_F_M_h=zeros(2,H-1); % Main winding up-track and down-track combined Contact and Feeder harmonic current
I_ABC_h=zeros(3,H-1); % TSS primary side three-phase harmonic currents
Vt_ABC_h=zeros(3,H-1); % TSS primary side three-phase harmonic terminal voltages

z_line_1_2_up_T=z1*(dTSS_T_up(nt,1)/1000); % Teaser winding up-track node 1 to node 2 line impedance (ohm) at fundamental frequency
z_line_1_2_down_T=z1*(dTSS_T_down(nt,1)/1000);% Teaser winding down-track node 1 to node 2 line impedance (ohm) at fundamental frequency
z_line_1_2_up_M=z1*(dTSS_M_up(nt,1)/1000); % Main winding up-track node 1 to node 2 line impedance (ohm) at fundamental frequency
z_line_1_2_down_M=z1*(dTSS_M_down(nt,1)/1000);% Main winding down-track node 1 to node 2 line impedance (ohm) at fundamental frequency

node_up_T=length(nonzeros(tTSS_T_up(nt,:)));
node_down_T=length(nonzeros(tTSS_T_down(nt,:)));

node_up_M=length(nonzeros(tTSS_M_up(nt,:)));
node_down_M=length(nonzeros(tTSS_M_down(nt,:)));

for i_a=2:H
    for i_b=1:N
        if (bus_type(i_b)==1 || bus_type(i_b)==3)  % For TSS node and AT node
            Ibus_h_T(3*i_b-2:3*i_b,i_a-1)=[0;0;0];
        elseif (bus_type(i_b)==2)   % Train node
            P=bus_power(i_b);  % Active power (MW) of Train
            pf=bus_pf(i_b);    % Train power factor
            pf_ang=acos(pf);   % Power factor angle
            Q=P*tan(pf_ang);   % Reactive power (MW) of Train
            Vc_T=Vc_mag_Td(nt,i_b)*(cosd(Vc_ang_Td(nt,i_b))+1i*sind(Vc_ang_Td(nt,i_b)));  % Train contact terminal voltage (kV)
            I_fund=(P-1i*Q)/conj(Vc_T);       % Fundamental current (kA) drawn by the train
            I_fund_mag=abs(I_fund);           % Magnitude of Fundamental current (kA) drawn by the train
            I_h_mag=I_fund_mag*(harmonic_spectrum(i_a-1,2)/100);  % Magnitude (kA) of i_ath order harmonic current drawn by train
            I_h_ang=harmonic_spectrum(i_a-1,3);    % Phase angle (degree) of i_ath order harmonic current drawn by train
            I_h_cmplx=I_h_mag*(cosd(I_h_ang)+1i*sind(I_h_ang)); % i_ath order harmonic current (kA) drawn by train in complex rectangular form
            Ibus_h_T(3*i_b-2:3*i_b,i_a-1)=[-I_h_cmplx;I_h_cmplx;0];  % i_ath order harmonic injected current at train C,R,F terminals      
        end    
    end
    ZbusT_real=real(ZbusT);
    ZbusT_imag=imag(ZbusT);
    ZbusT_h=ZbusT_real+1i*ZbusT_imag*i_a;   % Impedance matrix of teaser side at i_ath harmonic order
    Vbus_h_T(:,i_a-1)=ZbusT_h*Ibus_h_T(:,i_a-1);  % Bus voltage (kV) of teaser side at i_ath harmonic order

    % Teaser winding up-track node 1 to node 2 line impedance (ohm) at i_ath harmonic order
    z_line_1_2_up_T_h=real(z_line_1_2_up_T)+1i*imag(z_line_1_2_up_T)*i_a;

    % Teaser winding up-track node 1 to node 2 line currents (kA) at i_ath harmonic order
    I_line_1_2_h_T(1:3,i_a-1)=(inv(z_line_1_2_up_T_h))*(Vbus_h_T(1:3,i_a-1)-Vbus_h_T(4:6,i_a-1));

    % Teaser winding down-track node 1 to node 2 line impedance (ohm) at i_ath harmonic order
    z_line_1_2_down_T_h=real(z_line_1_2_down_T)+1i*imag(z_line_1_2_down_T)*i_a;

    % Teaser winding down-track node 1 to node 2 line currents (kA) at i_ath harmonic order
    I_line_1_2_h_T(4:6,i_a-1)=(inv(z_line_1_2_down_T_h))*(Vbus_h_T(1:3,i_a-1)-Vbus_h_T(3*(node_up_T+1)-2:3*(node_up_T+1),i_a-1));

    I_C_F_T_h(:,i_a-1)=I_line_1_2_h_T(1:2:3,i_a-1)+I_line_1_2_h_T(4:2:6,i_a-1);
end

for i_a=2:H
    for i_b=1:N_M
        if (bus_type_M(i_b)==1 || bus_type_M(i_b)==3)  % For TSS node and AT node
            Ibus_h_M(3*i_b-2:3*i_b,i_a-1)=[0;0;0];
        elseif (bus_type_M(i_b)==2)   % Train node
            P=bus_power_M(i_b);  % Active power (MW) of Train
            pf=bus_pf_M(i_b);  % Train power factor
            pf_ang=acos(pf);   % Power factor angle
            Q=P*tan(pf_ang);  % Reactive power (MW) of Train
            Vc_T=Vc_mag_Md(nt,i_b)*(cosd(Vc_ang_Md(nt,i_b))+1i*sind(Vc_ang_Md(nt,i_b)));  % Train contact terminal voltage (kV)
            I_fund=(P-1i*Q)/conj(Vc_T);  % Fundamental current (kA) drawn by the train
            I_fund_mag=abs(I_fund);      % Magnitude of Fundamental current (kA) drawn by the train
            I_h_mag=I_fund_mag*(harmonic_spectrum(i_a-1,2)/100);  % Magnitude (kA) of i_ath order harmonic current drawn by train
            I_h_ang=harmonic_spectrum(i_a-1,3);  % Phase angle (degree) of i_ath order harmonic current drawn by train
            I_h_cmplx=I_h_mag*(cosd(I_h_ang)+1i*sind(I_h_ang));  % i_ath order harmonic current (kA) drawn by train in complex rectangular form
            Ibus_h_M(3*i_b-2:3*i_b,i_a-1)=[-I_h_cmplx;I_h_cmplx;0]; % i_ath order harmonic injected current at train C,R,F terminals         
        end    
    end
    ZbusM_real=real(ZbusM);
    ZbusM_imag=imag(ZbusM);
    ZbusM_h=ZbusM_real+1i*ZbusM_imag*i_a;   % Impedance matrix of main side at i_ath harmonic order
    Vbus_h_M(:,i_a-1)=ZbusM_h*Ibus_h_M(:,i_a-1);  % Bus voltage (kV) of main side at i_ath harmonic order

    % Main winding up-track node 1 to node 2 line impedance (ohm) at i_ath harmonic order
    z_line_1_2_up_M_h=real(z_line_1_2_up_M)+1i*imag(z_line_1_2_up_M)*i_a;

    % Main winding up-track node 1 to node 2 line currents (kA) at i_ath harmonic order
    I_line_1_2_h_M(1:3,i_a-1)=(inv(z_line_1_2_up_M_h))*(Vbus_h_M(1:3,i_a-1)-Vbus_h_M(4:6,i_a-1));

    % Main winding down-track node 1 to node 2 line impedance (ohm) at i_ath harmonic order
    z_line_1_2_down_M_h=real(z_line_1_2_down_M)+1i*imag(z_line_1_2_down_M)*i_a;

    % Main winding down-track node 1 to node 2 line currents (kA) at i_ath harmonic order
    I_line_1_2_h_M(4:6,i_a-1)=(inv(z_line_1_2_down_M_h))*(Vbus_h_M(1:3,i_a-1)-Vbus_h_M(3*(node_up_M+1)-2:3*(node_up_M+1),i_a-1));

    I_C_F_M_h(:,i_a-1)=I_line_1_2_h_M(1:2:3,i_a-1)+I_line_1_2_h_M(4:2:6,i_a-1);
end

for i_a=2:H
    I_ABC_h(:,i_a-1)=Multiply*[I_C_F_T_h(:,i_a-1);I_C_F_M_h(:,i_a-1)];% TSS primary side three-phase harmonic currents (kA)
    Zshort_h=real(Zshort)+1i*imag(Zshort)*i_a; % Source side (grid) impedance (ohm) at i_ath harmonic order
    Vt_ABC_h(:,i_a-1)=Zshort_h*I_ABC_h(:,i_a-1); % TSS primary side three-phase terminal voltages (kV) at i_ath harmonic order
end

I_tc=(Ic_line_mag_Td_up(nt,1)*(cosd(Ic_line_ang_Td_up(nt,1))+1i*sind(Ic_line_ang_Td_up(nt,1))))+...
    (Ic_line_mag_Td_down(nt,1)*(cosd(Ic_line_ang_Td_down(nt,1))+1i*sind(Ic_line_ang_Td_down(nt,1))));
I_tf=(If_line_mag_Td_up(nt,1)*(cosd(If_line_ang_Td_up(nt,1))+1i*sind(If_line_ang_Td_up(nt,1))))+...
    (If_line_mag_Td_down(nt,1)*(cosd(If_line_ang_Td_down(nt,1))+1i*sind(If_line_ang_Td_down(nt,1))));
I_mc=(Ic_line_mag_Md_up(nt,1)*(cosd(Ic_line_ang_Md_up(nt,1))+1i*sind(Ic_line_ang_Md_up(nt,1))))+...
    (Ic_line_mag_Md_down(nt,1)*(cosd(Ic_line_ang_Md_down(nt,1))+1i*sind(Ic_line_ang_Md_down(nt,1))));
I_mf=(If_line_mag_Md_up(nt,1)*(cosd(If_line_ang_Md_up(nt,1))+1i*sind(If_line_ang_Md_up(nt,1))))+...
    (If_line_mag_Md_down(nt,1)*(cosd(If_line_ang_Md_down(nt,1))+1i*sind(If_line_ang_Md_down(nt,1))));
I_ABC=Multiply*[I_tc;I_tf;I_mc;I_mf];% TSS primary side three-phase fundamental currents (kA)
Vt_ABC=[V_A;V_B;V_C]-Zshort*I_ABC; % TSS primary side three-phase terminal voltages (kV) at fundamental frequency

for i_a=1:3
    TSS_primary_THD(nt,i_a)=(sqrt(sum((abs(Vt_ABC_h(i_a,:))).^2))/abs(Vt_ABC(i_a)))*100;% TSS primary side three-phase THD (%)
end

for i_a=1:3*N
    summ=0;
    for i_b=2:H
        summ=summ+(abs(Vbus_h_T(i_a,i_b-1)))^2;  % sum of squares of harmonic voltages
    end
    V_H_T(i_a)=summ;  % sum of squares of harmonic voltages
end

% THD (percentage) of teaser side buses
for i_a=1:N
    THD_T(3*i_a-2)=(sqrt(V_H_T(3*i_a-2))/Vc_mag_Td(nt,i_a))*100;
    THD_T(3*i_a-1)=(sqrt(V_H_T(3*i_a-1))/VR_mag_Td(nt,i_a))*100;
    THD_T(3*i_a)=(sqrt(V_H_T(3*i_a))/Vf_mag_Td(nt,i_a))*100;
end

for i_a=1:3*N_M
    summ=0;
    for i_b=2:H
        summ=summ+(abs(Vbus_h_M(i_a,i_b-1)))^2;  % sum of squares of harmonic voltages
    end
    V_H_M(i_a,1)=summ;  % sum of squares of harmonic voltages
end

% THD (percentage) of main side buses
for i_a=1:N_M
    THD_M(3*i_a-2)=(sqrt(V_H_M(3*i_a-2))/Vc_mag_Md(nt,i_a))*100;
    THD_M(3*i_a-1)=(sqrt(V_H_M(3*i_a-1))/VR_mag_Md(nt,i_a))*100;
    THD_M(3*i_a)=(sqrt(V_H_M(3*i_a))/Vf_mag_Md(nt,i_a))*100;
end

for i_a=1:N
    THD_C_T(nt,i_a)=THD_T(3*i_a-2);
    THD_R_T(nt,i_a)=THD_T(3*i_a-1);
    THD_F_T(nt,i_a)=THD_T(3*i_a);
end

for i_a=1:N_M
    THD_C_M(nt,i_a)=THD_M(3*i_a-2);
    THD_R_M(nt,i_a)=THD_M(3*i_a-1);
    THD_F_M(nt,i_a)=THD_M(3*i_a);
end

THD_C_T_up(nt,1:node_up_T)=THD_C_T(nt,1:node_up_T);
THD_C_T_down(nt,1)=THD_C_T(nt,1);
THD_C_T_down(nt,2:node_down_T)=THD_C_T(nt,node_up_T+1:node_up_T+node_down_T-1);

THD_C_M_up(nt,1:node_up_M)=THD_C_M(nt,1:node_up_M);
THD_C_M_down(nt,1)=THD_C_M(nt,1);
THD_C_M_down(nt,2:node_down_M)=THD_C_M(nt,node_up_M+1:node_up_M+node_down_M-1);

