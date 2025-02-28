function Induced_voltage_victim(rad_C, rad_R1, rad_F, rad_M1, rad_G, Resistance_C, Resistance_R1, Resistance_F, Resistance_M1, Resistance_G, Ch, nFd, nFh, Mh, gd, gh, freq, row, Ic_line_mag_Td_up, Ir_line_mag_Td_up, If_line_mag_Td_up, Ic_line_mag_Md_up, Ir_line_mag_Md_up, If_line_mag_Md_up, Ic_line_ang_Td_up, Ir_line_ang_Td_up, If_line_ang_Td_up, Ic_line_ang_Md_up, Ir_line_ang_Md_up, If_line_ang_Md_up, Ic_line_mag_Td_down, Ir_line_mag_Td_down, If_line_mag_Td_down, Ic_line_mag_Md_down, Ir_line_mag_Md_down, If_line_mag_Md_down, Ic_line_ang_Td_down, Ir_line_ang_Td_down, If_line_ang_Td_down, Ic_line_ang_Md_down, Ir_line_ang_Md_down, If_line_ang_Md_down, y, N_TSS, d, victim_wire_d, victim_wire_h, track_spacing, rad_victim_mm, resistance_victim_wire, ke, kt)
    tic
    % load("mum_to_sab_double_track_load_flow_variables.mat");
    % rad_C=load("rad_C.txt");
    % rad_R1=load("rad_R1.txt");
    % rad_F=load("rad_F.txt");
    % rad_M1=load("rad_M1.txt");
    % rad_G=load("rad_G.txt");
    % Resistance_C=load("Resistance_C.txt");
    % Resistance_R1=load("Resistance_R1.txt");
    % Resistance_F=load("Resistance_F.txt");
    % Resistance_M1=load("Resistance_M1.txt");
    % Resistance_G=load("Resistance_G.txt");
    % Ch=load("Ch.txt");
    % nFd=load("nFd.txt");
    % nFh=load("nFh.txt");
    % Mh=load("Mh.txt");
    % gd=load("gd.txt");
    % gh=load("gh.txt");
    % freq=load("freq.txt");
    % row=load("row.txt");
    % % Up-track OHE line currents obtained from the power flow program   
    % Ic_line_mag_Td_up=load("Ic_line_mag_Td_up.txt");  %contact wire line currents (magnitude) of all teaser windings in kA
    % Ir_line_mag_Td_up=load("Ir_line_mag_Td_up.txt");  %rail line currents (magnitude) of all teaser windings in kA
    % If_line_mag_Td_up=load("If_line_mag_Td_up.txt");  %feeder wire line currents (magnitude) of all teaser windings in kA
    % Ic_line_mag_Md_up=load("Ic_line_mag_Md_up.txt");  %contact wire line currents (magnitude) of all main windings in kA
    % Ir_line_mag_Md_up=load("Ir_line_mag_Md_up.txt");  %rail line currents (magnitude) of all main windings in kA
    % If_line_mag_Md_up=load("If_line_mag_Md_up.txt");  %feeder wire line currents (magnitude) of all main windings in kA

    % Ic_line_ang_Td_up=load("Ic_line_ang_Td_up.txt");  %contact wire line currents (angle) of all teaser windings in degree
    % Ir_line_ang_Td_up=load("Ir_line_ang_Td_up.txt");  %rail line currents (angle) of all teaser windings in degree
    % If_line_ang_Td_up=load("If_line_ang_Td_up.txt");  %feeder wire line currents (angle) of all teaser windings in degree
    % Ic_line_ang_Md_up=load("Ic_line_ang_Md_up.txt");  %contact wire line currents (angle) of all main windings in degree
    % Ir_line_ang_Md_up=load("Ir_line_ang_Md_up.txt");  %rail line currents (angle) of all main windings in degree
    % If_line_ang_Md_up=load("If_line_ang_Md_up.txt");  %feeder wire line currents (angle) of all main windings in degree

    % % Down-track OHE line currents obtained from the power flow program   
    % Ic_line_mag_Td_down=load("Ic_line_mag_Td_down.txt");  %contact wire line currents (magnitude) of all teaser windings in kA
    % Ir_line_mag_Td_down=load("Ir_line_mag_Td_down.txt");  %rail line currents (magnitude) of all teaser windings in kA
    % If_line_mag_Td_down=load("If_line_mag_Td_down.txt");  %feeder wire line currents (magnitude) of all teaser windings in kA
    % Ic_line_mag_Md_down=load("Ic_line_mag_Md_down.txt");  %contact wire line currents (magnitude) of all main windings in kA
    % Ir_line_mag_Md_down=load("Ir_line_mag_Md_down.txt");  %rail line currents (magnitude) of all main windings in kA
    % If_line_mag_Md_down=load("If_line_mag_Md_down.txt");  %feeder wire line currents (magnitude) of all main windings in kA

    % Ic_line_ang_Td_down=load("Ic_line_ang_Td_down.txt");  %contact wire line currents (angle) of all teaser windings in degree
    % Ir_line_ang_Td_down=load("Ir_line_ang_Td_down.txt");  %rail line currents (angle) of all teaser windings in degree
    % If_line_ang_Td_down=load("If_line_ang_Td_down.txt");  %feeder wire line currents (angle) of all teaser windings in degree
    % Ic_line_ang_Md_down=load("Ic_line_ang_Md_down.txt");  %contact wire line currents (angle) of all main windings in degree
    % Ir_line_ang_Md_down=load("Ir_line_ang_Md_down.txt");  %rail line currents (angle) of all main windings in degree
    % If_line_ang_Md_down=load("If_line_ang_Md_down.txt");  %feeder wire line currents (angle) of all main windings in degree

    % y=load("y.txt");  %total time instants (seconds) of operation for each winding (depends on train scheduling)
    % N_TSS=load("N_TSS.txt");  %total no of TSS aong the track
    % d=load("d.txt");

    %to be taken from the user
    % Track-1 rail is taken as the reference point i.e. origin (0,0) and the distance of all
    % % other conductors of track-1 and track-2 are measured from this reference point
    % victim_wire_d=4.5;  % Horizontal distance (m) of victim wire measured from rail of track-1
    % victim_wire_h=12;   % Vertical distance or height (m) of victim wire measured from rail of track-1
    % track_spacing=4;   % Distance (m) between track-1 rail and track-2 rail
    % rad_victim_mm=7.5;  % Radius (mm) of victim wire 
    % resistance_victim_wire=0.3;  % Resistance (ohm/km) of victim wire 
    % ke=0.24;  % Screening factor of victim wire
    % kt=1;   % Screening factor of traction conductors

    rad_victim=rad_victim_mm/1000;  % radius of victim wire in meter

    % The geometrical orientation of track-2 conductors is considered to be identical as of track-1 conductors
    x_C2=track_spacing;  % Horizontal distance (m) of contact wire of track-2 measured from rail of track-1
    x_R2=track_spacing;  % Horizontal distance (m) of rail of track-2 measured from rail of track-1
    x_F2=track_spacing+nFd;  % Horizontal distance (m) of feeder wire of track-2 measured from rail of track-1
    x_M2=track_spacing;  % Horizontal distance (m) of messenger wire of track-2 measured from rail of track-1
    x_G2=track_spacing+gd;  % Horizontal distance (m) of ground wire of track-2 measured from rail of track-1

    % C1 R1 F1 M1 G1 : Track-1 conductors (contact, rail, feeder, messenger, ground)
    % C2 R2 F2 M2 G2 : Track-2 conductors (contact, rail, feeder, messenger, ground)
    % V : Victim conductor 
    x_d=[0   0  -nFd  x_C2  x_R2  x_F2  -victim_wire_d  0  -gd  x_M2  x_G2];  % x-coordinates of C1 R1 F1 C2 R2 F2 V M1 G1 M2 G2
    y_d=[Ch  0   nFh   Ch    0    nFh    victim_wire_h  Mh  gh   Mh    gh ];  % y-coordinates of C1 R1 F1 C2 R2 F2 V M1 G1 M2 G2

    %The parameters (radius and resistance) of track-2 conductors are considered to be identical as of track-1 conductors
    ri=[rad_C rad_R1 rad_F rad_C rad_R1 rad_F rad_victim rad_M1 rad_G rad_M1 rad_G]; % radius (m) of C1 R1 F1 C2 R2 F2 V M1 G1 M2 G2
    rii=[Resistance_C Resistance_R1 Resistance_F Resistance_C Resistance_R1 Resistance_F resistance_victim_wire... 
        Resistance_M1 Resistance_G Resistance_M1 Resistance_G]; % self resistance (ohm/km) of C1 R1 F1 C2 R2 F2 V M1 G1 M2 G2

    k=length(x_d);
    c=9.86e-7*freq;
    h=2*pi*freq*2e-7;
    de=659*sqrt(row/freq);  % equivalent depth of earth return in meter

    for i=1:k
        for m=1:k
            if i==m
                d_c(i,m)=ri(i);
                riii(i,m)=rii(i);
                gmr(i,m)=0.7788*d_c(i,m);
                Z(i,m)=riii(i,m)+((c+(h*((1/log(gmr(i,m)))+log(de)))*1i)*10^3); % self impedance (ohm/km)
            else
                riii(i,m)=0;
                d_c(i,m)=sqrt((x_d(i)-x_d(m))^2+(y_d(i)-y_d(m))^2);
                Z(i,m)=riii(i,m)+(c+(h*((1/log(d_c(i,m)))+log(de)))*1i)*10^3; % mutual impedance (ohm/km)
            end
        end
    end

    % Eliminating the conductors M1 G1 M2 G2 from the impedance matrix using kron's reduction
    A=Z(1:(k-4),1:(k-4));
    B=Z(1:(k-4),k-3:k);
    % C=B';  % conjugate transpose of complex array
    % C=B.';  % non-conjugate transpose of complex array
    % C=transpose(B); % non-conjugate transpose of complex array
    C=Z(k-3:k,1:(k-4));
    D=Z(k-3:k,k-3:k);
    Z_reduced=A-B*(inv(D))*C;
    Z_M=Z_reduced(end,1:(end-1));  %mutual impedance (ohm/km) b/w (C1 & V),(R1 & V),(F1 & V),(C2 & V),(R2 & V),(F2 & V)

    D_c_M_up=size(Ic_line_mag_Md_up);
    D_c_T_up=size(Ic_line_mag_Td_up);
    D_c_M_down=size(Ic_line_mag_Md_down);
    D_c_T_down=size(Ic_line_mag_Td_down);

    % Up-track
    Ic_M_up=zeros(D_c_M_up(1),D_c_M_up(2));  %contact line current of all main windings (initialization)
    Ir_M_up=zeros(D_c_M_up(1),D_c_M_up(2));  %rail line current of all main windings (initialization)
    If_M_up=zeros(D_c_M_up(1),D_c_M_up(2));  %feeder line current of all main windings (initialization)
    Ic_T_up=zeros(D_c_T_up(1),D_c_T_up(2));  %contact line current of all teaser windings (initialization)
    Ir_T_up=zeros(D_c_T_up(1),D_c_T_up(2));  %rail line current of all teaser windings (initialization)
    If_T_up=zeros(D_c_T_up(1),D_c_T_up(2));  %feeder line current of all teaser windings (initialization)

    % Down-track
    Ic_M_down=zeros(D_c_M_down(1),D_c_M_down(2));  %contact line current of all main windings (initialization)
    Ir_M_down=zeros(D_c_M_down(1),D_c_M_down(2));  %rail line current of all main windings (initialization)
    If_M_down=zeros(D_c_M_down(1),D_c_M_down(2));  %feeder line current of all main windings (initialization)
    Ic_T_down=zeros(D_c_T_down(1),D_c_T_down(2));  %contact line current of all teaser windings (initialization)
    Ir_T_down=zeros(D_c_T_down(1),D_c_T_down(2));  %rail line current of all teaser windings (initialization)
    If_T_down=zeros(D_c_T_down(1),D_c_T_down(2));  %feeder line current of all teaser windings (initialization)

    % Up-track contact, rail, feeder line current (kA) of all main windings in complex rectangular form
    for i= 1:D_c_M_up(1)
        for m= 1:D_c_M_up(2)
            Ic_M_up(i,m)=Ic_line_mag_Md_up(i,m)*cosd(Ic_line_ang_Md_up(i,m))+1j*Ic_line_mag_Md_up(i,m)*sind(Ic_line_ang_Md_up(i,m)); 
            Ir_M_up(i,m)=Ir_line_mag_Md_up(i,m)*cosd(Ir_line_ang_Md_up(i,m))+1j*Ir_line_mag_Md_up(i,m)*sind(Ir_line_ang_Md_up(i,m)); 
            If_M_up(i,m)=If_line_mag_Md_up(i,m)*cosd(If_line_ang_Md_up(i,m))+1j*If_line_mag_Md_up(i,m)*sind(If_line_ang_Md_up(i,m)); 
        end
    end

    % Up-track contact, rail, feeder line current (kA) of all teaser windings in complex rectangular form
    for i= 1:D_c_T_up(1)
        for m= 1:D_c_T_up(2)
            Ic_T_up(i,m)=Ic_line_mag_Td_up(i,m)*cosd(Ic_line_ang_Td_up(i,m))+1j*Ic_line_mag_Td_up(i,m)*sind(Ic_line_ang_Td_up(i,m)); 
            Ir_T_up(i,m)=Ir_line_mag_Td_up(i,m)*cosd(Ir_line_ang_Td_up(i,m))+1j*Ir_line_mag_Td_up(i,m)*sind(Ir_line_ang_Td_up(i,m)); 
            If_T_up(i,m)=If_line_mag_Td_up(i,m)*cosd(If_line_ang_Td_up(i,m))+1j*If_line_mag_Td_up(i,m)*sind(If_line_ang_Td_up(i,m)); 
        end
    end

    % Down-track contact, rail, feeder line current (kA) of all main windings in complex rectangular form
    for i= 1:D_c_M_down(1)
        for m= 1:D_c_M_down(2)
            Ic_M_down(i,m)=Ic_line_mag_Md_down(i,m)*cosd(Ic_line_ang_Md_down(i,m))+1j*Ic_line_mag_Md_down(i,m)*sind(Ic_line_ang_Md_down(i,m)); 
            Ir_M_down(i,m)=Ir_line_mag_Md_down(i,m)*cosd(Ir_line_ang_Md_down(i,m))+1j*Ir_line_mag_Md_down(i,m)*sind(Ir_line_ang_Md_down(i,m)); 
            If_M_down(i,m)=If_line_mag_Md_down(i,m)*cosd(If_line_ang_Md_down(i,m))+1j*If_line_mag_Md_down(i,m)*sind(If_line_ang_Md_down(i,m)); 
        end
    end

    % Down-track contact, rail, feeder line current (kA) of all teaser windings in complex rectangular form
    for i= 1:D_c_T_down(1)
        for m= 1:D_c_T_down(2)
            Ic_T_down(i,m)=Ic_line_mag_Td_down(i,m)*cosd(Ic_line_ang_Td_down(i,m))+1j*Ic_line_mag_Td_down(i,m)*sind(Ic_line_ang_Td_down(i,m)); 
            Ir_T_down(i,m)=Ir_line_mag_Td_down(i,m)*cosd(Ir_line_ang_Td_down(i,m))+1j*Ir_line_mag_Td_down(i,m)*sind(Ir_line_ang_Td_down(i,m)); 
            If_T_down(i,m)=If_line_mag_Td_down(i,m)*cosd(If_line_ang_Td_down(i,m))+1j*If_line_mag_Td_down(i,m)*sind(If_line_ang_Td_down(i,m)); 
        end
    end

    % Up-track
    Ic_M_up_max=max(Ic_M_up,[],2); %maximum value of catenary line currents (kA) of all main windings (complex rectangular form)
    Ir_M_up_max=max(Ir_M_up,[],2); %maximum value of rail line currents (kA) of all main windings (complex rectangular form)
    If_M_up_max=max(If_M_up,[],2); %maximum value of feeder line currents (kA) of all main windings (complex rectangular form)
    Ic_T_up_max=max(Ic_T_up,[],2); %maximum value of catenary line currents (kA) of all teaser windings (complex rectangular form)
    Ir_T_up_max=max(Ir_T_up,[],2); %maximum value of rail line currents (kA) of all teaser windings (complex rectangular form)
    If_T_up_max=max(If_T_up,[],2); %maximum value of feeder line currents (kA) of all teaser windings (complex rectangular form)

    % Down-track
    Ic_M_down_max=max(Ic_M_down,[],2); %maximum value of catenary line currents (kA) of all main windings (complex rectangular form)
    Ir_M_down_max=max(Ir_M_down,[],2); %maximum value of rail line currents (kA) of all main windings (complex rectangular form)
    If_M_down_max=max(If_M_down,[],2); %maximum value of feeder line currents (kA) of all main windings (complex rectangular form)
    Ic_T_down_max=max(Ic_T_down,[],2); %maximum value of catenary line currents (kA) of all teaser windings (complex rectangular form)
    Ir_T_down_max=max(Ir_T_down,[],2); %maximum value of rail line currents (kA) of all teaser windings (complex rectangular form)
    If_T_down_max=max(If_T_down,[],2); %maximum value of feeder line currents (kA) of all teaser windings (complex rectangular form)

    for i_a=1:(2*N_TSS)
        winding_length(i_a)=(d(i_a+1)-d(i_a))/1000;  %length of all windings in km
    end

    winding_position=0;
    check=1;
    count_T=1;
    count_M=1;

    for i_a=1:(2*N_TSS)
        if i_a==2*winding_position+2
            check=check+1;
            winding_position=winding_position+1;
        end
        condition_odd=mod(check,2);
        if (condition_odd==1)
            winding_length_T(count_T)=winding_length(i_a);
            count_T=count_T+1;
        else
            winding_length_M(count_M)=winding_length(i_a);
            count_M=count_M+1;
        end
    end

    voltage_induced_M=zeros(N_TSS*y,1);
    voltage_induced_T=zeros(N_TSS*y,1);

    count=0;
    for i_b=1:y:(N_TSS*y)
        count=count+1;
        for i_c=0:(y-1)
            voltage_induced_M(i_b+i_c)=winding_length_M(count)*kt*ke*(Z_M*[Ic_M_up_max(i_b+i_c);Ir_M_up_max(i_b+i_c);If_M_up_max(i_b+i_c);...
                Ic_M_down_max(i_b+i_c);Ir_M_down_max(i_b+i_c);If_M_down_max(i_b+i_c)]);
            voltage_induced_T(i_b+i_c)=winding_length_T(count)*kt*ke*(Z_M*[Ic_T_up_max(i_b+i_c);Ir_T_up_max(i_b+i_c);If_T_up_max(i_b+i_c);...
                Ic_T_down_max(i_b+i_c);Ir_T_down_max(i_b+i_c);If_T_down_max(i_b+i_c)]);
        end
    end

    voltage_induced_mag_M=abs(voltage_induced_M); %magnitude (kV) of the voltage induced in the victim wire  corresponding to all main windings
    voltage_induced_ang_M=angle(voltage_induced_M)*(180/pi); %angle (degree) of the voltage induced  in the victim wire  corresponding to all main windings
    voltage_induced_mag_T=abs(voltage_induced_T); %magnitude (kV) of the voltage induced in the victim wire  corresponding to all teaser windings
    voltage_induced_ang_T=angle(voltage_induced_T)*(180/pi); %angle (degree) of the voltage induced in the victim wire  corresponding to all teaser windings

    V_track=zeros(2*N_TSS*y,1);   %induced voltage corresponding to all windings along the track (array initialization)

    %Suppose Teaser winding is the 1st winding from mumbai (starting point)

    winding_position_1=0;
    check_1=1;
    count_T_1=1;
    count_M_1=1;

    for ii=1:2*N_TSS*y
        if ii==(2*winding_position_1+1)*y+1
            check_1=check_1+1;
            winding_position_1=winding_position_1+1;
        end
        condition_odd=mod(check_1,2);
        if (condition_odd==1)
            V_track(ii)=voltage_induced_mag_T(count_T_1);
            count_T_1=count_T_1+1;
        else
            V_track(ii)=voltage_induced_mag_M(count_M_1);
            count_M_1=count_M_1+1;
        end
    end

    save('y.mat', 'y');
    save('d.mat', 'd');
    save('V_track.mat', 'V_track');

    % time_instant=input('Enter the time instant (in second) at which induced voltage along the track needs to be observed: ');

    % for i_e=1:length(d)-1
    %     for i_f=d(i_e)+1:d(i_e+1)
    %         track_distance(i_f,1)=i_f;   % distance (m)
    %         track_V(i_f,1)=V_track((i_e-1)*y+time_instant);  % induced voltage magnitude (kV)
    %     end
    % end

    % figure('Name','Induced voltage along the track at a particular time instant')
    % plot(track_distance/1000,track_V)
    % xlabel('Distance (km)')
    % ylabel('Induced voltage magnitude (kV)')
    % allAxes = findall(gcf, 'Type', 'axes'); % Find all axes in the current figure
    % set(allAxes, 'XLim', [0 d(end)/1000], 'XTick', d/1000, 'FontSize', 12, 'FontWeight', 'bold'); % Set font size and weight
    % allLines = findall(gcf, 'Type', 'line'); % Find all line objects in the figure
    % set(allLines, 'LineWidth', 1.5);          % Set the line width to 1.5

    % dist=input('Enter the distance (in km) at which induced voltage over entire durations of train simualtion needs to be observed: ');
    % time=1:y;  % time (seconds)
    % figure('Name','Induced voltage at a particular distance for entire durations of train simulation')
    % for ii=1:length(d)-1
    %     if dist>=d(ii)/1000 && dist<d(ii+1)/1000
    %         plot(time/60,V_track((ii-1)*y+1:ii*y));
    %         xlabel('Time (minute)')
    %         ylabel('Induced voltage magnitude (kV)')
    %         allAxes = findall(gcf, 'Type', 'axes'); % Find all axes in the current figure
    %         set(allAxes, 'XLim', [0 time(end)/60], 'FontSize', 12, 'FontWeight', 'bold'); % Set font size and weight
    %         allLines = findall(gcf, 'Type', 'line'); % Find all line objects in the figure
    %         set(allLines, 'LineWidth', 1.5);          % Set the line width to 1.5
    %     end
    % end
    toc
end