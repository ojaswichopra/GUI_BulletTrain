% clc
% clearvars
format longG
tic
% load("required_variable_load_flow_mum_to_ahm_each_stop.mat");
d = load("d.txt");
dTSS_T = load("dTSS_T.txt");
Ic_line_mag_Td = load("Ic_line_mag_Td.txt");
Ic_line_ang_Td = load("Ic_line_ang_Td.txt");
Ir_line_mag_Td = load("Ir_line_mag_Td.txt");
Ir_line_ang_Td = load("Ir_line_ang_Td.txt");
If_line_mag_Td = load("If_line_mag_Td.txt");
If_line_ang_Td = load("If_line_ang_Td.txt");
Vc_mag_Td = load("Vc_mag_Td.txt");
Vc_ang_Td = load("Vc_ang_Td.txt");
VR_mag_Td = load("VR_mag_Td.txt");
VR_ang_Td = load("VR_ang_Td.txt");
Vf_mag_Td = load("Vf_mag_Td.txt");
Vf_ang_Td = load("Vf_ang_Td.txt");

%loading back the complex variable z1 from its text file
z1_loaded = load("z1.txt");
% Determine the number of columns
num_cols = size(z1_loaded, 2) / 2;  % Total columns divided by 2

% Separate real and imaginary parts
real_parts = z1_loaded(:, 1:num_cols);           % First half for real parts
imag_parts = z1_loaded(:, num_cols+1:end);       % Second half for imaginary parts

% Combine real and imaginary parts to reconstruct the complex variable z1
z1 = real_parts + 1i * imag_parts;

y = load("y.txt");
dTSS_M = load("dTSS_M.txt");
Ic_line_mag_Md = load("Ic_line_mag_Md.txt");
Ic_line_ang_Md = load("Ic_line_ang_Md.txt");
Ir_line_mag_Md = load("Ir_line_mag_Md.txt");
Ir_line_ang_Md = load("Ir_line_ang_Md.txt");
If_line_mag_Md = load("If_line_mag_Md.txt");
If_line_ang_Md = load("If_line_ang_Md.txt");
Vc_mag_Md = load("Vc_mag_Md.txt");
Vc_ang_Md = load("Vc_ang_Md.txt");
VR_mag_Md = load("VR_mag_Md.txt");
VR_ang_Md = load("VR_ang_Md.txt");
Vf_mag_Md = load("Vf_mag_Md.txt");
Vf_ang_Md = load("Vf_ang_Md.txt");

total_distance_from_start_point= input(['Enter the distance (in Km) from starting point ' ...
'at which the voltage profile over entire durations of train scheduling needs to be investigated']);
total_distance_from_start_point=total_distance_from_start_point*1000;
d_index_length=length(d);
for i_ddd=1:1:d_index_length
    if total_distance_from_start_point<=d(i_ddd)
        d_index=i_ddd;
        break;
    end
end
track_TSS_no=fix((d_index)/2);
winding_defination(1)=1;
i_def=2;
for i_ddd=2:1:(d_index_length-1)/2
    condition_odd=mod(i_ddd,2);
    if condition_odd==0
        winding_defination(i_def)=2;
        winding_defination(i_def+1)=2;
        i_def=i_def+2;
    end
    if condition_odd==1
        winding_defination(i_def)=1;
        winding_defination(i_def+1)=1;
        i_def=i_def+2;
    end
end
if winding_defination(i_def-1)==1
    winding_defination(i_def)=2;
else
    winding_defination(i_def)=1;
end
check_winding=winding_defination(d_index-1);
cond_int=isinteger((d_index-1)/2);
if cond_int==1
    length_tss=total_distance_from_start_point-d(d_index-1);
else
    length_tss=d(d_index)-total_distance_from_start_point;
end
distance_over_day=length_tss;

% track_TSS_no=input('Enter the TSS number for which track voltage profile needs to be check');
% check_winding=input('Enter the TSS winding side "1" for Teaser winding side of TSS and "2" for Main winding side of TSS');
%distance_over_day=input('Enter the distance from TSS for voltage profile of entire day in meter');


if check_winding==1 %%% For teaser winding%%%%
    ntt=length(dTSS_T(:,1));
    point_i=1;
    for ii_ntt=((track_TSS_no-1)*y+1):1:track_TSS_no*y
        LL=nonzeros(dTSS_T(ii_ntt,:));
        track_line_length= sum(LL);
        no_of_sec=length(LL);
        LL_x=0;
        LL_xx=zeros(1,no_of_sec);
        for n_LL_x=1:1:no_of_sec

            LL_x=LL_x+(LL(n_LL_x));
            LL_xx(1,n_LL_x)=LL_x;
        end

        LL_xxx=nonzeros(LL_xx(1,:));
        section=0;
        for n_LL_x=1:1:no_of_sec
            if LL_xxx(n_LL_x)>=distance_over_day
                section=n_LL_x;
                break
            end
        end
        if section~=0
            I_line_current_track=[Ic_line_mag_Td(ii_ntt,section)*(cos(Ic_line_ang_Td(ii_ntt,section)*pi/180)+i*sin(Ic_line_ang_Td(ii_ntt,section)*pi/180));
                Ir_line_mag_Td(ii_ntt,section)*(cos(Ir_line_ang_Td(ii_ntt,section)*pi/180)+i*sin(Ir_line_ang_Td(ii_ntt,section)*pi/180));
                If_line_mag_Td(ii_ntt,section)*(cos(If_line_ang_Td(ii_ntt,section)*pi/180)+i*sin(If_line_ang_Td(ii_ntt,section)*pi/180))];

            V_section_bus=[Vc_mag_Td(ii_ntt,section)*(cos(Vc_ang_Td(ii_ntt,section)*pi/180)+i*sin(Vc_ang_Td(ii_ntt,section)*pi/180));
                VR_mag_Td(ii_ntt,section)*(cos(VR_ang_Td(ii_ntt,section)*pi/180)+i*sin(VR_ang_Td(ii_ntt,section)*pi/180));
                Vf_mag_Td(ii_ntt,section)*(cos(Vf_ang_Td(ii_ntt,section)*pi/180)+i*sin(Vf_ang_Td(ii_ntt,section)*pi/180));];
            if section==1
                len=distance_over_day;
                Voltage_distance(point_i,:)=transpose(V_section_bus-(z1*len/1000)*I_line_current_track);
            else
                len=distance_over_day-LL_xxx(section-1);
                Voltage_distance(point_i,:)=transpose(V_section_bus-(z1*len/1000)*I_line_current_track);
            end
        end
        if section==0
            section_end=no_of_sec;
            V_section_bus=[Vc_mag_Td(ii_ntt,section_end)*(cos(Vc_ang_Td(ii_ntt,section_end)*pi/180)+i*sin(Vc_ang_Td(ii_ntt,section_end)*pi/180));
                VR_mag_Td(ii_ntt,section_end)*(cos(VR_ang_Td(ii_ntt,section_end)*pi/180)+i*sin(VR_ang_Td(ii_ntt,section_end)*pi/180));
                Vf_mag_Td(ii_ntt,section_end)*(cos(Vf_ang_Td(ii_ntt,section_end)*pi/180)+i*sin(Vf_ang_Td(ii_ntt,section_end)*pi/180));];
            I_line_current_track=[0;0;0];
            len=distance_over_day-LL_xxx(section_end);
            Voltage_distance(point_i,:)=transpose(V_section_bus-(z1*len/1000)*I_line_current_track);
        end


        time_points(point_i)=point_i;
        point_i=point_i+1;
    end
    %plot(time_points,abs(Voltage_distance));
    % Create a figure handle
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);

    subplot(3,1,1)
    plot(time_points,abs(Voltage_distance(:,1)));
    xlabel('Time (sec)','FontWeight','bold')
    ylabel('Contact voltage magnitude (kV)','FontWeight','bold')
    subplot(3,1,2)
    plot(time_points,abs(Voltage_distance(:,2)));
    xlabel('Time (sec)','FontWeight','bold')
    ylabel('Rail voltage magnitude (kV)','FontWeight','bold')
    subplot(3,1,3)
    plot(time_points,abs(Voltage_distance(:,3)));
    xlabel('Time (sec)','FontWeight','bold')
    ylabel('Feeder voltage magnitude (kV)','FontWeight','bold')

else %%%% Main Winding side %%%%
    ntt=length(dTSS_M(:,1));
    point_i=1;
    for ii_ntt=((track_TSS_no-1)*y+1):1:track_TSS_no*y
        LL=nonzeros(dTSS_M(ii_ntt,:));
        track_line_length= sum(LL);
        no_of_sec=length(LL);
        LL_x=0;
        LL_xx=zeros(1,no_of_sec);
        for n_LL_x=1:1:no_of_sec

            LL_x=LL_x+(LL(n_LL_x));
            LL_xx(1,n_LL_x)=LL_x;
        end

        LL_xxx=nonzeros(LL_xx(1,:));
        section=0;
        for n_LL_x=1:1:no_of_sec
            if LL_xxx(n_LL_x)>=distance_over_day
                section=n_LL_x;
                break
            end
        end
        if section~=0
            I_line_current_track_M=[Ic_line_mag_Md(ii_ntt,section)*(cos(Ic_line_ang_Md(ii_ntt,section)*pi/180)+i*sin(Ic_line_ang_Md(ii_ntt,section)*pi/180));
                Ir_line_mag_Md(ii_ntt,section)*(cos(Ir_line_ang_Md(ii_ntt,section)*pi/180)+i*sin(Ir_line_ang_Md(ii_ntt,section)*pi/180));
                If_line_mag_Md(ii_ntt,section)*(cos(If_line_ang_Md(ii_ntt,section)*pi/180)+i*sin(If_line_ang_Md(ii_ntt,section)*pi/180))];

            V_section_bus_M=[Vc_mag_Md(ii_ntt,section)*(cos(Vc_ang_Md(ii_ntt,section)*pi/180)+i*sin(Vc_ang_Md(ii_ntt,section)*pi/180));
                VR_mag_Md(ii_ntt,section)*(cos(VR_ang_Md(ii_ntt,section)*pi/180)+i*sin(VR_ang_Md(ii_ntt,section)*pi/180));
                Vf_mag_Md(ii_ntt,section)*(cos(Vf_ang_Md(ii_ntt,section)*pi/180)+i*sin(Vf_ang_Md(ii_ntt,section)*pi/180));];

            if section==1
                len=distance_over_day;
                Voltage_distance_M(point_i,:)=transpose(V_section_bus_M-(z1*len/1000)*I_line_current_track_M);
            else
                len=distance_over_day-LL_xxx(section-1);
                Voltage_distance_M(point_i,:)=transpose(V_section_bus_M-(z1*len/1000)*I_line_current_track_M);
            end
        end
        if section==0
            section_end=no_of_sec;
            I_line_current_track_M=[0;0;0];

            V_section_bus_M=[Vc_mag_Md(ii_ntt,section_end)*(cos(Vc_ang_Md(ii_ntt,section_end)*pi/180)+i*sin(Vc_ang_Md(ii_ntt,section_end)*pi/180));
                VR_mag_Md(ii_ntt,section_end)*(cos(VR_ang_Md(ii_ntt,section_end)*pi/180)+i*sin(VR_ang_Md(ii_ntt,section_end)*pi/180));
                Vf_mag_Md(ii_ntt,section_end)*(cos(Vf_ang_Md(ii_ntt,section_end)*pi/180)+i*sin(Vf_ang_Md(ii_ntt,section_end)*pi/180));];
            len=distance_over_day-LL_xxx(section_end);

            Voltage_distance_M(point_i,:)=transpose(V_section_bus_M-(z1*len/1000)*I_line_current_track_M);
        end

        time_points(point_i)=point_i;
        point_i=point_i+1;
    end
    %plot(time_points,abs(Voltage_distance_M));
    % Create a figure handle
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);

    subplot(3,1,1)
    plot(time_points,abs(Voltage_distance_M(:,1)));
    xlabel('Time (sec)','FontWeight','bold')
    ylabel('Contact voltage magnitude (kV)','FontWeight','bold')
    subplot(3,1,2)
    plot(time_points,abs(Voltage_distance_M(:,2)));
    xlabel('Time (sec)','FontWeight','bold')
    ylabel('Rail voltage magnitude (kV)','FontWeight','bold')
    subplot(3,1,3)
    plot(time_points,abs(Voltage_distance_M(:,3)));
    xlabel('Time (sec)','FontWeight','bold')
    ylabel('Feeder voltage magnitude (kV)','FontWeight','bold')
end
toc
