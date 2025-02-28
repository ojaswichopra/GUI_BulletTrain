function OHE_temp_cal_down_track(Ic_line_mag_Td_down, Ir_line_mag_Td_down, If_line_mag_Td_down, Ic_line_mag_Md_down, Ir_line_mag_Md_down, If_line_mag_Md_down, y, N_TSS, d, rad_C, rad_R1, rad_F, Resistance_C, Resistance_R1, Resistance_F, Q_s, T_a, V_w, theta, e, a, T_0, mCp_c, mCp_r, mCp_f, alpha_c, alpha_r, alpha_f) 
    tic
    graphics_toolkit ("gnuplot")
 

    % OHE data
    D_c=2*rad_C;      %diameter of contact wire in m
    D_r=2*rad_R1;     %diameter of rail in m
    D_f=2*rad_F;      %diameter of feeder wire in m

    % T_0=20;  %temperature (deg cel) at which OHE resistances are specified (to be taken from the user)

    R_c_T0=Resistance_C/1000;   %resistance of contact wire at temp T_0 in ohms/m
    R_r_T0=Resistance_R1/1000;  %resistance of rail at temp T_0 in ohms/m
    R_f_T0=Resistance_F/1000;   %resistance of feeder wire at temp T_0 in ohms/m

    H_e=0;      %conductor (i.e. contact wire, rail, feeder wire) elevation in m

    
    T_c_initial=T_a;        %initial assumption (at t=0 sec) of contact wire temp in deg cel
    T_r_initial=T_a;        %initial assumption (at t=0 sec) of rail temp in deg cel
    T_f_initial=T_a;        %initial assumption (at t=0 sec) of feeder wire temp in deg cel

    Ic_M=max(Ic_line_mag_Md_down,[],2)*1000;   %maximum value of contact wire line currents of all main windings in Amp
    Ir_M=max(Ir_line_mag_Md_down,[],2)*1000;   %maximum value of rail line currents of all main windings in Amp
    If_M=max(If_line_mag_Md_down,[],2)*1000;   %maximum value of feeder wire line currents of all main windings in Amp
    Ic_T=max(Ic_line_mag_Td_down,[],2)*1000;   %maximum value of contact wire line currents of all teaser windings in Amp
    Ir_T=max(Ir_line_mag_Td_down,[],2)*1000;   %maximum value of rail line currents of all teaser windings in Amp
    If_T=max(If_line_mag_Td_down,[],2)*1000;   %maximum value of feeder wire line currents of all teaser windings in Amp

    k_angle=1.194-cosd(theta)+0.194*cosd(2*theta)+0.368*sind(2*theta);  %wind direction factor

    q_s_c=a*Q_s*D_c;   %solar heat gain (for contact wire) rate in W/m 
    q_s_r=a*Q_s*D_r;   %solar heat gain (for rail) rate in W/m
    q_s_f=a*Q_s*D_f;   %solar heat gain (for feeder wire) rate in W/m

    T_c_M=zeros(N_TSS*y,1);  %contact temperature of all main windings (array initialization)
    T_r_M=zeros(N_TSS*y,1);  %rail temperature of all main windings (array initialization)
    T_f_M=zeros(N_TSS*y,1);  %feeder temperature of all main windings (array initialization)

    T_c_T=zeros(N_TSS*y,1);  %contact temperature of all teaser windings (array initialization)
    T_r_T=zeros(N_TSS*y,1);  %rail temperature of all teaser windings (array initialization)
    T_f_T=zeros(N_TSS*y,1);  %feeder temperature of all teaser windings (array initialization)

    del_t=1;   %time step in sec

    %temperature rise calculation of all main windings
    for i_b=1:y:(N_TSS*y)

        T_c=T_c_initial;
        T_r=T_r_initial;
        T_f=T_f_initial;

    for i_c=0:(y-1)

    T_film_c=(T_c+T_a)/2;   %boundary temperature for contact
    T_film_r=(T_r+T_a)/2;   %boundary temperature for rail
    T_film_f=(T_f+T_a)/2;   %boundary temperature for feeder

    u_f_c=(1.458*(10^-6)*(T_film_c+273)^1.5)/(T_film_c+383.4);  %dynamic viscosity of air (for contact) in kg/m-s
    u_f_r=(1.458*(10^-6)*(T_film_r+273)^1.5)/(T_film_r+383.4);  %dynamic viscosity of air (for rail) in kg/m-s
    u_f_f=(1.458*(10^-6)*(T_film_f+273)^1.5)/(T_film_f+383.4);  %dynamic viscosity of air (for feeder) in kg/m-s

    r_f_c=(1.293-1.525*(10^-4)*H_e+6.379*(10^-9)*H_e^2)/(1+0.00367*T_film_c); %density of air (for contact) in kg/m^3
    r_f_r=(1.293-1.525*(10^-4)*H_e+6.379*(10^-9)*H_e^2)/(1+0.00367*T_film_r); %density of air (for rail) in kg/m^3
    r_f_f=(1.293-1.525*(10^-4)*H_e+6.379*(10^-9)*H_e^2)/(1+0.00367*T_film_f); %density of air (for feeder) in kg/m^3

    k_f_c=(2.424*10^-2)+(7.477*10^-5*T_film_c)-(4.407*10^-9*T_film_c^2); %thermal conductivity of air (for contact) in W/m.deg c
    k_f_r=(2.424*10^-2)+(7.477*10^-5*T_film_r)-(4.407*10^-9*T_film_r^2); %thermal conductivity of air (for rail) in W/m.deg c
    k_f_f=(2.424*10^-2)+(7.477*10^-5*T_film_f)-(4.407*10^-9*T_film_f^2); %thermal conductivity of air (for feeder) in W/m.deg c

    q_cn_c=3.645*(r_f_c^0.5)*(D_c^0.75)*((T_c-T_a)^1.25);  %heat loss rate due to natural convection in W/m (for contact)
    q_cn_r=3.645*(r_f_r^0.5)*(D_r^0.75)*((T_r-T_a)^1.25);  %heat loss rate due to natural convection in W/m (for rail)
    q_cn_f=3.645*(r_f_f^0.5)*(D_f^0.75)*((T_f-T_a)^1.25);  %heat loss rate due to natural convection in W/m (for feeder)

    N_re_c=(D_c*r_f_c*V_w)/u_f_c;    %Reynold's number (for contact)
    N_re_r=(D_r*r_f_r*V_w)/u_f_r;    %Reynold's number (for rail)
    N_re_f=(D_f*r_f_f*V_w)/u_f_f;    %Reynold's number (for feeder)

    q_c1_c=(1.01+1.35*(N_re_c^0.52))*k_f_c*k_angle*(T_c-T_a);  %heat loss rate due to forced convection (low wind speed) in W/m (for contact)
    q_c1_r=(1.01+1.35*(N_re_r^0.52))*k_f_r*k_angle*(T_r-T_a);  %heat loss rate due to forced convection (low wind speed) in W/m (for rail)
    q_c1_f=(1.01+1.35*(N_re_f^0.52))*k_f_f*k_angle*(T_f-T_a);  %heat loss rate due to forced convection (low wind speed) in W/m (for feeder)

    q_c2_c=0.754*(N_re_c^0.6)*k_f_c*k_angle*(T_c-T_a);     %heat loss rate due to forced convection (high wind speed) in W/m (for contact)
    q_c2_r=0.754*(N_re_r^0.6)*k_f_r*k_angle*(T_r-T_a);     %heat loss rate due to forced convection (high wind speed) in W/m (for rail)
    q_c2_f=0.754*(N_re_f^0.6)*k_f_f*k_angle*(T_f-T_a);     %heat loss rate due to forced convection (high wind speed) in W/m (for feeder)

    q_c_c=max([q_c1_c,q_c2_c,q_cn_c]);         %heat loss rate due to convection in W/m (for contact)
    q_c_r=max([q_c1_r,q_c2_r,q_cn_r]);         %heat loss rate due to convection in W/m (for rail)
    q_c_f=max([q_c1_f,q_c2_f,q_cn_f]);         %heat loss rate due to convection in W/m (for feeder)

    q_r_c=17.8*D_c*e*(((T_c+273)^4)-((T_a+273)^4))/100^4;   %heat loss rate due to radiation in W/m (for contact)
    q_r_r=17.8*D_r*e*(((T_r+273)^4)-((T_a+273)^4))/100^4;   %heat loss rate due to radiation in W/m (for rail)
    q_r_f=17.8*D_f*e*(((T_f+273)^4)-((T_a+273)^4))/100^4;   %heat loss rate due to radiation in W/m (for feeder)

    R_c=R_c_T0*(1+alpha_c*(T_c-T_0));   %resistance of contact at temp T_c in ohms/m;
    R_r=R_r_T0*(1+alpha_r*(T_r-T_0));   %resistance of rail at temp T_r in ohms/m;
    R_f=R_f_T0*(1+alpha_f*(T_f-T_0));   %resistance of feeder at temp T_f in ohms/m;

    del_T_c=(q_s_c+(Ic_M(i_b+i_c)^2)*R_c-q_c_c-q_r_c)*del_t/mCp_c;  %non-steady state heat balance equation (contact)
    del_T_r=(q_s_r+(Ir_M(i_b+i_c)^2)*R_r-q_c_r-q_r_r)*del_t/mCp_r;  %non-steady state heat balance equation (rail)
    del_T_f=(q_s_f+(If_M(i_b+i_c)^2)*R_f-q_c_f-q_r_f)*del_t/mCp_f;  %non-steady state heat balance equation (feeder)

    T_c=T_c+del_T_c;
    T_r=T_r+del_T_r;
    T_f=T_f+del_T_f;

    T_c_M(i_b+i_c)=T_c;
    T_r_M(i_b+i_c)=T_r;
    T_f_M(i_b+i_c)=T_f;

    end
    end

    %temperature rise calculation of all teaser windings
    for i_b=1:y:(N_TSS*y)

        T_c=T_c_initial;
        T_r=T_r_initial;
        T_f=T_f_initial;

    for i_c=0:(y-1)

    T_film_c=(T_c+T_a)/2;   %boundary temperature for contact
    T_film_r=(T_r+T_a)/2;   %boundary temperature for rail
    T_film_f=(T_f+T_a)/2;   %boundary temperature for feeder

    u_f_c=(1.458*(10^-6)*(T_film_c+273)^1.5)/(T_film_c+383.4);  %dynamic viscosity of air (for contact) in kg/m-s
    u_f_r=(1.458*(10^-6)*(T_film_r+273)^1.5)/(T_film_r+383.4);  %dynamic viscosity of air (for rail) in kg/m-s
    u_f_f=(1.458*(10^-6)*(T_film_f+273)^1.5)/(T_film_f+383.4);  %dynamic viscosity of air (for feeder) in kg/m-s

    r_f_c=(1.293-1.525*(10^-4)*H_e+6.379*(10^-9)*H_e^2)/(1+0.00367*T_film_c); %density of air (for contact) in kg/m^3
    r_f_r=(1.293-1.525*(10^-4)*H_e+6.379*(10^-9)*H_e^2)/(1+0.00367*T_film_r); %density of air (for rail) in kg/m^3
    r_f_f=(1.293-1.525*(10^-4)*H_e+6.379*(10^-9)*H_e^2)/(1+0.00367*T_film_f); %density of air (for feeder) in kg/m^3

    k_f_c=(2.424*10^-2)+(7.477*10^-5*T_film_c)-(4.407*10^-9*T_film_c^2); %thermal conductivity of air (for contact) in W/m.deg c
    k_f_r=(2.424*10^-2)+(7.477*10^-5*T_film_r)-(4.407*10^-9*T_film_r^2); %thermal conductivity of air (for rail) in W/m.deg c
    k_f_f=(2.424*10^-2)+(7.477*10^-5*T_film_f)-(4.407*10^-9*T_film_f^2); %thermal conductivity of air (for feeder) in W/m.deg c

    q_cn_c=3.645*(r_f_c^0.5)*(D_c^0.75)*((T_c-T_a)^1.25);  %heat loss rate due to natural convection in W/m (for contact)
    q_cn_r=3.645*(r_f_r^0.5)*(D_r^0.75)*((T_r-T_a)^1.25);  %heat loss rate due to natural convection in W/m (for rail)
    q_cn_f=3.645*(r_f_f^0.5)*(D_f^0.75)*((T_f-T_a)^1.25);  %heat loss rate due to natural convection in W/m (for feeder)

    N_re_c=(D_c*r_f_c*V_w)/u_f_c;    %Reynold's number (for contact)
    N_re_r=(D_r*r_f_r*V_w)/u_f_r;    %Reynold's number (for rail)
    N_re_f=(D_f*r_f_f*V_w)/u_f_f;    %Reynold's number (for feeder)

    q_c1_c=(1.01+1.35*(N_re_c^0.52))*k_f_c*k_angle*(T_c-T_a);  %heat loss rate due to forced convection (low wind speed) in W/m (for contact)
    q_c1_r=(1.01+1.35*(N_re_r^0.52))*k_f_r*k_angle*(T_r-T_a);  %heat loss rate due to forced convection (low wind speed) in W/m (for rail)
    q_c1_f=(1.01+1.35*(N_re_f^0.52))*k_f_f*k_angle*(T_f-T_a);  %heat loss rate due to forced convection (low wind speed) in W/m (for feeder)

    q_c2_c=0.754*(N_re_c^0.6)*k_f_c*k_angle*(T_c-T_a);     %heat loss rate due to forced convection (high wind speed) in W/m (for contact)
    q_c2_r=0.754*(N_re_r^0.6)*k_f_r*k_angle*(T_r-T_a);     %heat loss rate due to forced convection (high wind speed) in W/m (for rail)
    q_c2_f=0.754*(N_re_f^0.6)*k_f_f*k_angle*(T_f-T_a);     %heat loss rate due to forced convection (high wind speed) in W/m (for feeder)

    q_c_c=max([q_c1_c,q_c2_c,q_cn_c]);         %heat loss rate due to convection in W/m (for contact)
    q_c_r=max([q_c1_r,q_c2_r,q_cn_r]);         %heat loss rate due to convection in W/m (for rail)
    q_c_f=max([q_c1_f,q_c2_f,q_cn_f]);         %heat loss rate due to convection in W/m (for feeder)

    q_r_c=17.8*D_c*e*(((T_c+273)^4)-((T_a+273)^4))/100^4;   %heat loss rate due to radiation in W/m (for contact)
    q_r_r=17.8*D_r*e*(((T_r+273)^4)-((T_a+273)^4))/100^4;   %heat loss rate due to radiation in W/m (for rail)
    q_r_f=17.8*D_f*e*(((T_f+273)^4)-((T_a+273)^4))/100^4;   %heat loss rate due to radiation in W/m (for feeder)

    R_c=R_c_T0*(1+alpha_c*(T_c-T_0));   %resistance of contact at temp T_c in ohms/m;
    R_r=R_r_T0*(1+alpha_r*(T_r-T_0));   %resistance of rail at temp T_r in ohms/m;
    R_f=R_f_T0*(1+alpha_f*(T_f-T_0));   %resistance of feeder at temp T_f in ohms/m;

    % del_t=1;   %time step in sec

    del_T_c=(q_s_c+(Ic_T(i_b+i_c)^2)*R_c-q_c_c-q_r_c)*del_t/mCp_c;  %non-steady state heat balance equation (contact)
    del_T_r=(q_s_r+(Ir_T(i_b+i_c)^2)*R_r-q_c_r-q_r_r)*del_t/mCp_r;  %non-steady state heat balance equation (rail)
    del_T_f=(q_s_f+(If_T(i_b+i_c)^2)*R_f-q_c_f-q_r_f)*del_t/mCp_f;  %non-steady state heat balance equation (feeder)

    T_c=T_c+del_T_c;
    T_r=T_r+del_T_r;
    T_f=T_f+del_T_f;

    T_c_T(i_b+i_c)=T_c;
    T_r_T(i_b+i_c)=T_r;
    T_f_T(i_b+i_c)=T_f;

    end
    end

    T_c_track=zeros(2*N_TSS*y,1);   %contact temperature of all windings along the track (array initialization) 
    T_r_track=zeros(2*N_TSS*y,1);   %rail temperature of all windings along the track (array initialization)
    T_f_track=zeros(2*N_TSS*y,1);   %feeder temperature of all windings along the track (array initialization)

    %Suppose Teaser winding is the 1st winding from mumbai (starting point)

    winding_position=0;
    check=1;
    count_T=1;
    count_M=1;

    for ii=1:2*N_TSS*y
        if ii==(2*winding_position+1)*y+1
            check=check+1;
            winding_position=winding_position+1;
        end
        condition_odd=mod(check,2);
        if (condition_odd==1)
            T_c_track(ii)=T_c_T(count_T);
            T_r_track(ii)=T_r_T(count_T);
            T_f_track(ii)=T_f_T(count_T);
            count_T=count_T+1;
        else
            T_c_track(ii)=T_c_M(count_M);
            T_r_track(ii)=T_r_M(count_M);
            T_f_track(ii)=T_f_M(count_M);
            count_M=count_M+1;
        end
    end

    save('y.mat', 'y');
    save('d.mat', 'd');
    save('T_c_track_down.mat', 'T_c_track');
    save('T_r_track_down.mat', 'T_r_track');
    save('T_f_track_down.mat', 'T_f_track');
    save('T_c_initial_down.mat', 'T_c_initial');
    save('T_r_initial_down.mat', 'T_r_initial');
    save('T_f_initial_down.mat', 'T_f_initial');

    toc


end
