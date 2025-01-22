function train_voltage_profile_with_train_number_outage_load_txt(train_number, N_train_per_hour, each_stop_train_data, d, N_TSS_O, N_TSS, Vc_mag_Td, VR_mag_Td, Vf_mag_Td, Vc_ang_Td, VR_ang_Td, Vf_ang_Td, Vc_mag_Md, VR_mag_Md, Vf_mag_Md, Vc_ang_Md, VR_ang_Md, Vf_ang_Md, dTSS, y)
    tic
    graphics_toolkit ("gnuplot")
    % load("N_train_per_hour.txt");
    % load("each_stop_train_data.txt");
    % load("d.txt");
    % load("N_TSS_O.txt");
    % load("N_TSS.txt");
    % load("Vc_mag_Td.txt");
    % load("VR_mag_Td.txt");
    % load("Vf_mag_Td.txt");
    % load("Vc_ang_Td.txt");
    % load("VR_ang_Td.txt");
    % load("Vf_ang_Td.txt");
    % load("Vc_mag_Md.txt");
    % load("VR_mag_Md.txt");
    % load("Vf_mag_Md.txt");
    % load("Vc_ang_Md.txt");
    % load("VR_ang_Md.txt");
    % load("Vf_ang_Md.txt");
    % load("dTSS.txt");
    % load("y.txt");

    no_of_train=N_train_per_hour;
    % train_number=input('enter the trains number or name = ');
    train_intervals=60*60/no_of_train;
    train_time_space=(train_number-1)*train_intervals;
    train1_position=length(each_stop_train_data(:,1));
    for t_i= 1:1:train1_position
        ct_train_pos=each_stop_train_data(t_i,3);
        train1_time(t_i)=each_stop_train_data(t_i,1)+train_time_space;
        train_distance_from_start(t_i)=each_stop_train_data(t_i,3)/1000;
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
        local_dis_len=length(dTSS((y*(d_index-2)+t_i+train_time_space),:));
        d_sum=0;
        for xx_d=1:1:local_dis_len
            d_sum=d_sum+ dTSS((y*(d_index-2)+t_i+train_time_space),xx_d);
            if distance_from_Tss== d_sum
                local_ind=xx_d;
                break;
            end
        end
        if check_winding==1
            voltage_train(t_i)=Vc_mag_Td((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(Vc_ang_Td((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(Vc_ang_Td((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
            voltage_train_rail(t_i)=VR_mag_Td((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(VR_ang_Td((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(VR_ang_Td((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
        end
        if check_winding==2
            voltage_train(t_i)=Vc_mag_Md((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(Vc_ang_Md((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(Vc_ang_Md((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
            voltage_train_rail(t_i)=VR_mag_Md((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*(cos(VR_ang_Md((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180)+i*sin(VR_ang_Md((y*(track_TSS_no-1)+t_i+train_time_space),local_ind)*pi/180));
        end

    end
    voltage_train_abs= transpose(abs(voltage_train));
    voltage_train_rail_abs= transpose(abs(voltage_train_rail));
    %train1_time.Format=;
    % subplot(2,1,1)
    % plot(train1_time,voltage_train_rail_abs);
    % subplot(2,1,2)
    % plot(train_distance_from_start,voltage_train_rail_abs);
    % Create a figure
    figureHandle = figure;

    % Set the figure position and size
    set(figureHandle, 'Position', [100, 100, 1830, 1600]);

    % First subplot: Contact voltage vs Time
    subplot(4, 1, 1);
    plot(train1_time / 60, voltage_train_abs, 'LineWidth', 2, 'Color', [0 0.4470 0.7410]); % Blue line
    title(['Contact Voltage of Train No ', int2str(train_number), ' vs Time'], ...
        'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Time (minute)', 'FontWeight', 'bold', 'FontSize', 12);
    ylabel('Voltage Magnitude (kV)', 'FontWeight', 'bold', 'FontSize', 12);
    set(gca, 'FontSize', 10, 'LineWidth', 1.2, 'Box', 'on');
    grid off;

    % Second subplot: Contact voltage vs Distance
    subplot(4, 1, 2);
    plot(train_distance_from_start, voltage_train_abs, 'LineWidth', 2, 'Color', [0.8500 0.3250 0.0980]); % Red line
    title(['Contact Voltage of Train No ', int2str(train_number), ' vs Distance'], ...
        'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Distance (Km)', 'FontWeight', 'bold', 'FontSize', 12);
    ylabel('Voltage Magnitude (kV)', 'FontWeight', 'bold', 'FontSize', 12);
    set(gca, 'FontSize', 10, 'LineWidth', 1.2, 'Box', 'on');
    grid off;

    % Third subplot: Rail voltage vs Time
    subplot(4, 1, 3);
    plot(train1_time / 60, voltage_train_rail_abs, 'LineWidth', 2, 'Color', [0.9290 0.6940 0.1250]); % Yellow line
    title(['Rail Voltage of Train No ', int2str(train_number), ' vs Time'], ...
        'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Time (minute)', 'FontWeight', 'bold', 'FontSize', 12);
    ylabel('Voltage Magnitude (kV)', 'FontWeight', 'bold', 'FontSize', 12);
    set(gca, 'FontSize', 10, 'LineWidth', 1.2, 'Box', 'on');
    grid off;

    % Fourth subplot: Rail voltage vs Distance
    subplot(4, 1, 4);
    plot(train_distance_from_start, voltage_train_rail_abs, 'LineWidth', 2, 'Color', [0.4940 0.1840 0.5560]); % Purple line
    title(['Rail Voltage of Train No ', int2str(train_number), ' vs Distance'], ...
        'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Distance (Km)', 'FontWeight', 'bold', 'FontSize', 12);
    ylabel('Voltage Magnitude (kV)', 'FontWeight', 'bold', 'FontSize', 12);
    set(gca, 'FontSize', 10, 'LineWidth', 1.2, 'Box', 'on');
    grid off;

    % Set the figure's background color to white for a cleaner look
    set(gcf, 'Color', 'w');


    desired_filename = '../Plots_oTo/oTo_train_voltage_profile.png';
    saveas(gcf, desired_filename);
    toc
end
