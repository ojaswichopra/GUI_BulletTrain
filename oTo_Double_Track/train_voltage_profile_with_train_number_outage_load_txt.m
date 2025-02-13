clc
clear all
format longG
tic
% load("Double_load_flow_outage.mat");

N_TSS_O=load("N_TSS_O.txt");
N_TSS=load("N_TSS.txt");

%%%%
d = load("d.txt");
dTSS_T_up = load("dTSS_T_up.txt");

Vc_mag_Td_up = load("Vc_mag_Td_up.txt");
Vc_ang_Td_up = load("Vc_ang_Td_up.txt");
VR_mag_Td_up = load("VR_mag_Td_up.txt");
VR_ang_Td_up = load("VR_ang_Td_up.txt");
Vf_mag_Td_up = load("Vf_mag_Td_up.txt");
Vf_ang_Td_up = load("Vf_ang_Td_up.txt");

dTSS_M_down = load("dTSS_M_down.txt");

Vc_mag_Md_down = load("Vc_mag_Md_down.txt");
Vc_ang_Md_down = load("Vc_ang_Md_down.txt");
VR_mag_Md_down = load("VR_mag_Md_down.txt");
VR_ang_Md_down = load("VR_ang_Md_down.txt");
Vf_mag_Md_down = load("Vf_mag_Md_down.txt");
Vf_ang_Md_down = load("Vf_ang_Md_down.txt");

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
dTSS_M_up = load("dTSS_M_up.txt");
dTSS_up = load("dTSS_up.txt");
dTSS_down = load("dTSS_down.txt");
Vc_mag_Md_up = load("Vc_mag_Md_up.txt");
Vc_ang_Md_up = load("Vc_ang_Md_up.txt");
VR_mag_Md_up = load("VR_mag_Md_up.txt");
VR_ang_Md_up = load("VR_ang_Md_up.txt");
Vf_mag_Md_up = load("Vf_mag_Md_up.txt");
Vf_ang_Md_up = load("Vf_ang_Md_up.txt");

dTSS_T_down = load("dTSS_T_down.txt");

Vc_mag_Td_down = load("Vc_mag_Td_down.txt");
Vc_ang_Td_down = load("Vc_ang_Td_down.txt");
VR_mag_Td_down = load("VR_mag_Td_down.txt");
VR_ang_Td_down = load("VR_ang_Td_down.txt");
Vf_mag_Td_down = load("Vf_mag_Td_down.txt");
Vf_ang_Td_down = load("Vf_ang_Td_down.txt");
train_number = load("train_number.txt");

track_type = load("track_type.txt");

train_type = load("train_type.txt");
start_time = load("start_time.txt");
each_stop_train_data_up = load("each_stop_train_data_up.txt");
rapid_train_data_up = load("rapid_train_data_up.txt");
each_stop_train_data_down = load("each_stop_train_data_down.txt");
rapid_train_data_down = load("rapid_train_data_down.txt");
track_length = load("track_length.txt");
%%%%



% no_of_train=N_train_per_hour;
% train_number=input('enter the trains number or name = ');


% Display available train numbers
fprintf('Available train numbers: ');
fprintf('%d ', train_number);
fprintf('\n');

% Prompt user for input
entered_train_number = input('Enter the train number to see its voltage profile: ');

% Check if the entered train number exists in the list
if ismember(entered_train_number, train_number)
    fprintf('Train %d exists. Displaying voltage profile...\n', entered_train_number);
    % Add code to display the voltage profile
else
    fprintf('Invalid train number. Please enter a valid train number.\n');
end



% entered_train_number=input('Enter the train number to see its voltage profile ');
enter_train_indx=find(entered_train_number==train_number);
enter_track_type=track_type(enter_train_indx);
enter_train_type=train_type(enter_train_indx);
enter_train_starting_time=start_time(enter_train_indx);

if enter_track_type==1 %% up track
    if enter_train_type==1 %% each stop up
        train_time_space=enter_train_starting_time*60;
        train1_position=length(each_stop_train_data_up(:,1));
        for t_i= 1:1:train1_position
            ct_train_pos=each_stop_train_data_up(t_i,3)*1000;
            train1_time(t_i)=each_stop_train_data_up(t_i,1)+train_time_space;
            train_distance_from_start(t_i)=each_stop_train_data_up(t_i,3)*1000;
            %%%%
            d_length=length(d);
            d_new_length=d_length-2*length(N_TSS_O);
            dd_i=1;
            if N_TSS_O==1
                for d_i=1:1:d_new_length
                    if dd_i==2*N_TSS_O-1
                        dd_i=dd_i;
                        % continue
                    end
                    if dd_i==2*N_TSS_O
                        dd_i=dd_i+2;
                    end
                    d_new(d_i)=d(dd_i);
                    dd_i=dd_i+1;
                end
            elseif N_TSS_O==N_TSS
                for d_i=1:1:d_new_length
                    if dd_i==2*N_TSS_O-1
                        dd_i=dd_i+2;
                        % continue
                    end
                    if dd_i==2*N_TSS_O
                        dd_i=dd_i+1;
                    end
                    d_new(d_i)=d(dd_i);
                    dd_i=dd_i+1;
                end

            else
                for d_i=1:1:d_new_length
                    if dd_i==2*N_TSS_O-1
                        dd_i=dd_i+1;
                    end
                    if dd_i==2*N_TSS_O+1
                        dd_i=dd_i+1;
                    end
                    d_new(d_i)=d(dd_i);
                    dd_i=dd_i+1;
                end
            end

            d_modified=zeros(1,d_new_length-1);
            for jj=1:1:d_new_length-1
                d_modified(jj)=d_new(jj+1)-d_new(jj);
            end
            %%%%%
            d_index_length=length(d_new);
            for i_ddd=1:1:d_index_length
                if ct_train_pos<=d_new(i_ddd)           %finding the index of the TSS no at the perticular distance
                    d_index=i_ddd;
                    break;
                end
            end
            track_TSS_no=fix((d_index)/2); % tss number of the distance
            if N_TSS_O==1
                winding_defination(1)=2;
            else
                winding_defination(1)=1;
            end

            i_def=2;
            for i_ddd=2:1:(d_index_length-1)/2
                %%
                if i_ddd==N_TSS_O   %%for outage_winding seperation
                    condition_odd=mod(i_ddd,2);
                    if condition_odd==0
                        winding_defination(i_def)=2;
                        winding_defination(i_def+1)=1;
                        i_def=i_def+2;
                    else condition_odd==1
                        winding_defination(i_def)=1;
                        winding_defination(i_def+1)=2;
                        i_def=i_def+2;
                    end
                elseif (i_ddd > N_TSS_O)
                    condition_odd=mod(i_ddd,2);
                    if condition_odd==0
                        winding_defination(i_def)=1;
                        winding_defination(i_def+1)=1;
                        i_def=i_def+2;
                    end
                    if condition_odd==1
                        winding_defination(i_def)=2;
                        winding_defination(i_def+1)=2;
                        i_def=i_def+2;
                    end

                else


                    %%
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
            end
            if winding_defination(i_def-1)==1
                winding_defination(i_def)=2;
            else
                winding_defination(i_def)=1;
            end

            check_winding=winding_defination(d_index-1);
            %     disp(d_index-1)
            odd_check=mod((d_index-1),2);
            %cond_int=isinteger((d_index-1)/2);
            if odd_check==0%cond_int==1
                length_tss=ct_train_pos-d_new(d_index-1);
                %         disp("RE")
            else
                length_tss=d_new(d_index)-ct_train_pos;
                %         disp("fr")
            end
            distance_from_Tss=length_tss;
            local_dis_len=length(dTSS_up((y*(d_index-2)+t_i+train_time_space),:));
            d_sum=0;
            for xx_d=1:1:local_dis_len
                d_sum=d_sum+ dTSS_up((y*(d_index-2)+t_i+train_time_space),xx_d);
                if abs(distance_from_Tss-d_sum)<0.00001
                    local_ind=xx_d;
                    break;
                end
            end

            if check_winding==1
                voltage_train(t_i)=Vc_mag_Td_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(Vc_ang_Td_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(Vc_ang_Td_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
                voltage_train_rail(t_i)=VR_mag_Td_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(VR_ang_Td_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(VR_ang_Td_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
            end
            if check_winding==2
                voltage_train(t_i)=Vc_mag_Md_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(Vc_ang_Md_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(Vc_ang_Md_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
                voltage_train_rail(t_i)=VR_mag_Md_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(VR_ang_Md_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(VR_ang_Md_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
            end

        end
        voltage_train_abs= transpose(abs(voltage_train));
        voltage_train_rail_abs= transpose(abs(voltage_train_rail));

    else %% rapid up
        train_time_space=enter_train_starting_time*60;
        train1_position=length(rapid_train_data_up(:,1));
        for t_i= 1:1:train1_position
            ct_train_pos=rapid_train_data_up(t_i,3)*1000;
            train1_time(t_i)=rapid_train_data_up(t_i,1)+train_time_space;
            train_distance_from_start(t_i)=rapid_train_data_up(t_i,3)*1000;
            %%%%
            d_length=length(d);
            d_new_length=d_length-2*length(N_TSS_O);
            dd_i=1;
            if N_TSS_O==1
                for d_i=1:1:d_new_length
                    if dd_i==2*N_TSS_O-1
                        dd_i=dd_i;
                        % continue
                    end
                    if dd_i==2*N_TSS_O
                        dd_i=dd_i+2;
                    end
                    d_new(d_i)=d(dd_i);
                    dd_i=dd_i+1;
                end
            elseif N_TSS_O==N_TSS
                for d_i=1:1:d_new_length
                    if dd_i==2*N_TSS_O-1
                        dd_i=dd_i+2;
                        % continue
                    end
                    if dd_i==2*N_TSS_O
                        dd_i=dd_i+1;
                    end
                    d_new(d_i)=d(dd_i);
                    dd_i=dd_i+1;
                end

            else
                for d_i=1:1:d_new_length
                    if dd_i==2*N_TSS_O-1
                        dd_i=dd_i+1;
                    end
                    if dd_i==2*N_TSS_O+1
                        dd_i=dd_i+1;
                    end
                    d_new(d_i)=d(dd_i);
                    dd_i=dd_i+1;
                end
            end

            d_modified=zeros(1,d_new_length-1);
            for jj=1:1:d_new_length-1
                d_modified(jj)=d_new(jj+1)-d_new(jj);
            end
            %%%%%
            d_index_length=length(d_new);
            for i_ddd=1:1:d_index_length
                if ct_train_pos<=d_new(i_ddd)           %finding the index of the TSS no at the perticular distance
                    d_index=i_ddd;
                    break;
                end
            end
            track_TSS_no=fix((d_index)/2); % tss number of the distance
            if N_TSS_O==1
                winding_defination(1)=2;
            else
                winding_defination(1)=1;
            end

            i_def=2;
            for i_ddd=2:1:(d_index_length-1)/2
                %%
                if i_ddd==N_TSS_O   %%for outage_winding seperation
                    condition_odd=mod(i_ddd,2);
                    if condition_odd==0
                        winding_defination(i_def)=2;
                        winding_defination(i_def+1)=1;
                        i_def=i_def+2;
                    else condition_odd==1
                        winding_defination(i_def)=1;
                        winding_defination(i_def+1)=2;
                        i_def=i_def+2;
                    end
                elseif (i_ddd > N_TSS_O)
                    condition_odd=mod(i_ddd,2);
                    if condition_odd==0
                        winding_defination(i_def)=1;
                        winding_defination(i_def+1)=1;
                        i_def=i_def+2;
                    end
                    if condition_odd==1
                        winding_defination(i_def)=2;
                        winding_defination(i_def+1)=2;
                        i_def=i_def+2;
                    end

                else


                    %%
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
            end
            if winding_defination(i_def-1)==1
                winding_defination(i_def)=2;
            else
                winding_defination(i_def)=1;
            end

            check_winding=winding_defination(d_index-1);
            %     disp(d_index-1)
            odd_check=mod((d_index-1),2);
            %cond_int=isinteger((d_index-1)/2);
            if odd_check==0%cond_int==1
                length_tss=ct_train_pos-d_new(d_index-1);
                %         disp("RE")
            else
                length_tss=d_new(d_index)-ct_train_pos;
                %         disp("fr")
            end
            distance_from_Tss=length_tss;
            local_dis_len=length(dTSS_up((y*(d_index-2)+t_i+train_time_space),:));
            d_sum=0;
            for xx_d=1:1:local_dis_len
                d_sum=d_sum+ dTSS_up((y*(d_index-2)+t_i+train_time_space),xx_d);
                if abs(distance_from_Tss-d_sum)<0.00001
                    local_ind=xx_d;
                    break;
                end
            end

            if check_winding==1
                voltage_train(t_i)=Vc_mag_Td_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(Vc_ang_Td_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(Vc_ang_Td_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
                voltage_train_rail(t_i)=VR_mag_Td_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(VR_ang_Td_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(VR_ang_Td_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
            end
            if check_winding==2
                voltage_train(t_i)=Vc_mag_Md_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(Vc_ang_Md_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(Vc_ang_Md_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
                voltage_train_rail(t_i)=VR_mag_Md_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(VR_ang_Md_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(VR_ang_Md_up((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
            end

        end
        voltage_train_abs= transpose(abs(voltage_train));
        voltage_train_rail_abs= transpose(abs(voltage_train_rail));
    end
    % Create a figure handle
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);
    subplot(4,1,1)
    plot(train1_time/60,voltage_train_abs);
    title(['Contact voltage of train no ', int2str(entered_train_number),' vs Time'])
    xlabel('Time (minute)','FontWeight','bold')
    ylabel('Voltage Magnitude (kV)','FontWeight','bold')
    subplot(4,1,2)
    plot(train_distance_from_start/1000,voltage_train_abs);
    title(['Contact voltage of train no ', int2str(entered_train_number),' vs Distance'])
    xlabel('Distance (Km) Mumbai- Sabarmati','FontWeight','bold')
    ylabel('Voltage Magnitude (kV)','FontWeight','bold')
    subplot(4,1,3)
    plot(train1_time/60,voltage_train_rail_abs);
    title(['Rail voltage of train no ', int2str(entered_train_number),' vs Time'])
    xlabel('Time (minute)','FontWeight','bold')
    ylabel('Voltage Magnitude (kV)','FontWeight','bold')
    subplot(4,1,4)
    plot(train_distance_from_start/1000,voltage_train_rail_abs);
    title(['Rail voltage of train no ', int2str(entered_train_number),' vs Distance'])
    xlabel('Distance (Km) Mumbai-Sabarmati','FontWeight','bold')
    ylabel('Voltage Magnitude (kV)','FontWeight','bold')
else %% down track
    if enter_train_type==1 %% each stop down
        train_time_space=enter_train_starting_time*60;
        train1_position=length(each_stop_train_data_down(:,1));
        train_tot_dis=track_length*1000;
        for t_i= 1:1:train1_position-1
            ct_train_pos1=each_stop_train_data_down(t_i,3)*1000;
            train1_time(t_i)=each_stop_train_data_down(t_i,1)+train_time_space;
            train_distance_from_start(t_i)=ct_train_pos1;
            train_distance_from_start1(t_i)=train_tot_dis-each_stop_train_data_down(t_i,3)*1000;
            ct_train_pos=train_distance_from_start1(t_i);
            %%%%
            d_length=length(d);
            d_new_length=d_length-2*length(N_TSS_O);
            dd_i=1;
            if N_TSS_O==1
                for d_i=1:1:d_new_length
                    if dd_i==2*N_TSS_O-1
                        dd_i=dd_i;
                        % continue
                    end
                    if dd_i==2*N_TSS_O
                        dd_i=dd_i+2;
                    end
                    d_new(d_i)=d(dd_i);
                    dd_i=dd_i+1;
                end
            elseif N_TSS_O==N_TSS
                for d_i=1:1:d_new_length
                    if dd_i==2*N_TSS_O-1
                        dd_i=dd_i+2;
                        % continue
                    end
                    if dd_i==2*N_TSS_O
                        dd_i=dd_i+1;
                    end
                    d_new(d_i)=d(dd_i);
                    dd_i=dd_i+1;
                end

            else
                for d_i=1:1:d_new_length
                    if dd_i==2*N_TSS_O-1
                        dd_i=dd_i+1;
                    end
                    if dd_i==2*N_TSS_O+1
                        dd_i=dd_i+1;
                    end
                    d_new(d_i)=d(dd_i);
                    dd_i=dd_i+1;
                end
            end

            d_modified=zeros(1,d_new_length-1);
            for jj=1:1:d_new_length-1
                d_modified(jj)=d_new(jj+1)-d_new(jj);
            end
            %%%%%
            d_index_length=length(d_new);
            for i_ddd=1:1:d_index_length
                if ct_train_pos<=d_new(i_ddd)           %finding the index of the TSS no at the perticular distance
                    d_index=i_ddd;
                    break;
                end
            end
            track_TSS_no=fix((d_index)/2); % tss number of the distance
            if N_TSS_O==1
                winding_defination(1)=2;
            else
                winding_defination(1)=1;
            end

            i_def=2;
            for i_ddd=2:1:(d_index_length-1)/2
                %%
                if i_ddd==N_TSS_O   %%for outage_winding seperation
                    condition_odd=mod(i_ddd,2);
                    if condition_odd==0
                        winding_defination(i_def)=2;
                        winding_defination(i_def+1)=1;
                        i_def=i_def+2;
                    else condition_odd==1
                        winding_defination(i_def)=1;
                        winding_defination(i_def+1)=2;
                        i_def=i_def+2;
                    end
                elseif (i_ddd > N_TSS_O)
                    condition_odd=mod(i_ddd,2);
                    if condition_odd==0
                        winding_defination(i_def)=1;
                        winding_defination(i_def+1)=1;
                        i_def=i_def+2;
                    end
                    if condition_odd==1
                        winding_defination(i_def)=2;
                        winding_defination(i_def+1)=2;
                        i_def=i_def+2;
                    end

                else


                    %%
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
            end
            if winding_defination(i_def-1)==1
                winding_defination(i_def)=2;
            else
                winding_defination(i_def)=1;
            end

            check_winding=winding_defination(d_index-1);
            %     disp(d_index-1)
%             odd_check=mod((d_index-1),2);
            cond_int=isinteger((d_index-1)/2);
            if cond_int==1 %odd_check==0%
%                         length_tss=ct_train_pos-d_new(d_index-1);
                length_tss=d_new(d_index)-ct_train_pos;
            else
%                         length_tss=d_new(d_index)-ct_train_pos;
                length_tss=ct_train_pos-d_new(d_index-1);

            end
            distance_from_Tss=length_tss;
            local_dis_len=length(dTSS_down((y*(d_index-2)+t_i+train_time_space),:));
            d_sum=0;
            for xx_d=1:1:local_dis_len
                d_sum=d_sum+ dTSS_down((y*(d_index-2)+t_i+train_time_space),xx_d);
                if abs(distance_from_Tss-d_sum)<0.00001
                    local_ind=xx_d;
                    break;
                end
            end

            if check_winding==1
                voltage_train(t_i)=Vc_mag_Td_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(Vc_ang_Td_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(Vc_ang_Td_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
                voltage_train_rail(t_i)=VR_mag_Td_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(VR_ang_Td_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(VR_ang_Td_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
            end
            if check_winding==2
                voltage_train(t_i)=Vc_mag_Md_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(Vc_ang_Md_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(Vc_ang_Md_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
                voltage_train_rail(t_i)=VR_mag_Md_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(VR_ang_Md_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(VR_ang_Md_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
            end

        end
        voltage_train_abs= transpose(abs(voltage_train));
        voltage_train_rail_abs= transpose(abs(voltage_train_rail));

    else %% rapid down
        train_time_space=enter_train_starting_time*60;
        train1_position=length(rapid_train_data_down(:,1));
        train_tot_dis=track_length*1000;
        for t_i= 1:1:train1_position-1
            ct_train_pos1=rapid_train_data_down(t_i,3)*1000;
            train1_time(t_i)=rapid_train_data_down(t_i,1)+train_time_space;
            train_distance_from_start(t_i)=ct_train_pos1;
            train_distance_from_start1(t_i)=train_tot_dis-rapid_train_data_down(t_i,3)*1000;
            ct_train_pos=train_distance_from_start1(t_i);
            %%%%
            d_length=length(d);
            d_new_length=d_length-2*length(N_TSS_O);
            dd_i=1;
            if N_TSS_O==1
                for d_i=1:1:d_new_length
                    if dd_i==2*N_TSS_O-1
                        dd_i=dd_i;
                        % continue
                    end
                    if dd_i==2*N_TSS_O
                        dd_i=dd_i+2;
                    end
                    d_new(d_i)=d(dd_i);
                    dd_i=dd_i+1;
                end
            elseif N_TSS_O==N_TSS
                for d_i=1:1:d_new_length
                    if dd_i==2*N_TSS_O-1
                        dd_i=dd_i+2;
                        % continue
                    end
                    if dd_i==2*N_TSS_O
                        dd_i=dd_i+1;
                    end
                    d_new(d_i)=d(dd_i);
                    dd_i=dd_i+1;
                end

            else
                for d_i=1:1:d_new_length
                    if dd_i==2*N_TSS_O-1
                        dd_i=dd_i+1;
                    end
                    if dd_i==2*N_TSS_O+1
                        dd_i=dd_i+1;
                    end
                    d_new(d_i)=d(dd_i);
                    dd_i=dd_i+1;
                end
            end

            d_modified=zeros(1,d_new_length-1);
            for jj=1:1:d_new_length-1
                d_modified(jj)=d_new(jj+1)-d_new(jj);
            end
            %%%%%
            d_index_length=length(d_new);
            for i_ddd=1:1:d_index_length
                if ct_train_pos<=d_new(i_ddd)           %finding the index of the TSS no at the perticular distance
                    d_index=i_ddd;
                    break;
                end
            end
            track_TSS_no=fix((d_index)/2); % tss number of the distance
            if N_TSS_O==1
                winding_defination(1)=2;
            else
                winding_defination(1)=1;
            end

            i_def=2;
            for i_ddd=2:1:(d_index_length-1)/2
                %%
                if i_ddd==N_TSS_O   %%for outage_winding seperation
                    condition_odd=mod(i_ddd,2);
                    if condition_odd==0
                        winding_defination(i_def)=2;
                        winding_defination(i_def+1)=1;
                        i_def=i_def+2;
                    else condition_odd==1
                        winding_defination(i_def)=1;
                        winding_defination(i_def+1)=2;
                        i_def=i_def+2;
                    end
                elseif (i_ddd > N_TSS_O)
                    condition_odd=mod(i_ddd,2);
                    if condition_odd==0
                        winding_defination(i_def)=1;
                        winding_defination(i_def+1)=1;
                        i_def=i_def+2;
                    end
                    if condition_odd==1
                        winding_defination(i_def)=2;
                        winding_defination(i_def+1)=2;
                        i_def=i_def+2;
                    end

                else


                    %%
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
            end
            if winding_defination(i_def-1)==1
                winding_defination(i_def)=2;
            else
                winding_defination(i_def)=1;
            end

            check_winding=winding_defination(d_index-1);
            %     disp(d_index-1)
%             odd_check=mod((d_index-1),2);
            cond_int=isinteger((d_index-1)/2);
            if cond_int==1 %odd_check==0%
                %         length_tss=ct_train_pos-d_new(d_index-1);
                length_tss=d_new(d_index)-ct_train_pos;
            else
                %         length_tss=d_new(d_index)-ct_train_pos;
                length_tss=ct_train_pos-d_new(d_index-1);

            end
            distance_from_Tss=length_tss;
            local_dis_len=length(dTSS_down((y*(d_index-2)+t_i+train_time_space),:));
            d_sum=0;
            for xx_d=1:1:local_dis_len
                d_sum=d_sum+ dTSS_down((y*(d_index-2)+t_i+train_time_space),xx_d);
                if abs(distance_from_Tss-d_sum)<0.00001
                    local_ind=xx_d;
                    break;
                end
            end

            if check_winding==1
                voltage_train(t_i)=Vc_mag_Td_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(Vc_ang_Td_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(Vc_ang_Td_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
                voltage_train_rail(t_i)=VR_mag_Td_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(VR_ang_Td_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(VR_ang_Td_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
            end
            if check_winding==2
                voltage_train(t_i)=Vc_mag_Md_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(Vc_ang_Md_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(Vc_ang_Md_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
                voltage_train_rail(t_i)=VR_mag_Md_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(VR_ang_Md_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(VR_ang_Md_down((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
            end

        end
        voltage_train_abs= transpose(abs(voltage_train));
        voltage_train_rail_abs= transpose(abs(voltage_train_rail));

    end

    % Create a figure handle
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);
    subplot(4,1,1)
    plot(train1_time/60,voltage_train_abs);
    title(['Contact voltage of train no ', int2str(entered_train_number),' vs Time'])
    xlabel('Time (minute)','FontWeight','bold')
    ylabel('Voltage Magnitude (kV)','FontWeight','bold')
    subplot(4,1,2)
    plot(train_distance_from_start/1000,voltage_train_abs);
    title(['Contact voltage of train no ', int2str(entered_train_number),' vs Distance'])
    xlabel('Distance (Km) Sabarmati-Mumbai','FontWeight','bold')
    ylabel('Voltage Magnitude (kV)','FontWeight','bold')
    subplot(4,1,3)
    plot(train1_time/60,voltage_train_rail_abs);
    title(['Rail voltage of train no ', int2str(entered_train_number),' vs Time'])
    xlabel('Time (minute)','FontWeight','bold')
    ylabel('Voltage Magnitude (kV)','FontWeight','bold')
    subplot(4,1,4)
    plot(train_distance_from_start/1000,voltage_train_rail_abs);
    title(['Rail voltage of train no ', int2str(entered_train_number),' vs Distance'])
    xlabel('Distance (Km) Sabarmati-Mumbai','FontWeight','bold')
    ylabel('Voltage Magnitude (kV)','FontWeight','bold')
end

toc