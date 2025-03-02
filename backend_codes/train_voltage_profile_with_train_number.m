function train_voltage_profile_with_train_number(no_of_train,train_number,train_data, d, dTSS, y, Vc_mag_Td, Vc_ang_Td, VR_mag_Td, VR_ang_Td, Vc_mag_Md, Vc_ang_Md, VR_mag_Md, VR_ang_Md)
    % 
    % clearvars
    format longG
    tic
    graphics_toolkit ("gnuplot")
    train_data


    train_intervals=60*60/no_of_train;
    train_time_space=(train_number-1)*train_intervals;
    train1_position=length(train_data(:,1));
    for t_i= 1:1:train1_position
        ct_train_pos=train_data(t_i,3);
        train1_time(t_i)=train_data(t_i,1)+train_time_space;
        train_distance_from_start(t_i)=train_data(t_i,3)/1000;
        d_index_length=length(d);
        for i_ddd=1:1:d_index_length
            if ct_train_pos<=d(i_ddd)
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
        odd_check=mod((d_index-1),2);
        % cond_int=isinteger((d_index-1)/2);
        if odd_check==0 %cond_int==1
            length_tss=ct_train_pos-d(d_index-1);
        else
            length_tss=d(d_index)-ct_train_pos;
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
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', [100, 100, 2000, 1500]);
    
    % Create a 4-row subplot layout
% figure;

% Define line properties
lineWidth = 2;

% Subplot 1: Contact Voltage vs. Time
subplot(4, 1, 1);
plot(train1_time / 60, voltage_train_abs, 'LineWidth', lineWidth, 'Color', [0.8500 0.3250 0.0980]); % Red line
title(['Contact Voltage of Train Number ', int2str(train_number), ' vs Time'], 'FontWeight', 'bold', 'FontSize', 12);
xlabel('Time (minutes)', 'FontWeight', 'bold', 'FontSize', 11);
ylabel('Voltage Magnitude (kV)', 'FontWeight', 'bold', 'FontSize', 11);

% Subplot 2: Contact Voltage vs. Distance
subplot(4, 1, 2);
plot(train_distance_from_start, voltage_train_abs, 'LineWidth', lineWidth, 'Color', [0.4660 0.6740 0.1880]); % Green line
title(['Contact Voltage of Train Number ', int2str(train_number), ' vs Distance'], 'FontWeight', 'bold', 'FontSize', 12);
xlabel('Distance (km)', 'FontWeight', 'bold', 'FontSize', 11);
ylabel('Voltage Magnitude (kV)', 'FontWeight', 'bold', 'FontSize', 11);

% Subplot 3: Rail Voltage vs. Time
subplot(4, 1, 3);
plot(train1_time / 60, voltage_train_rail_abs, 'LineWidth', lineWidth, 'Color', [0.3010 0.7450 0.9330]); % Blue line
title(['Rail Voltage of Train Number ', int2str(train_number), ' vs Time'], 'FontWeight', 'bold', 'FontSize', 12);
xlabel('Time (minutes)', 'FontWeight', 'bold', 'FontSize', 11);
ylabel('Voltage Magnitude (kV)', 'FontWeight', 'bold', 'FontSize', 11);

% Subplot 4: Rail Voltage vs. Distance
subplot(4, 1, 4);
plot(train_distance_from_start, voltage_train_rail_abs, 'LineWidth', lineWidth, 'Color', [0.9290 0.6940 0.1250]); % Yellow line
title(['Rail Voltage of Train Number ', int2str(train_number), ' vs Distance'], 'FontWeight', 'bold', 'FontSize', 12);
xlabel('Distance (km)', 'FontWeight', 'bold', 'FontSize', 11);
ylabel('Voltage Magnitude (kV)', 'FontWeight', 'bold', 'FontSize', 11);

% Set figure properties for a polished look
set(gcf, 'Color', 'w'); % Set background to white
for i = 1:4
    subplot(4, 1, i);
    set(gca, 'FontSize', 10, 'LineWidth', 1.2); % Consistent axis styling
end


    desired_filename = '../Plots/Voltage_Profile_Train.png';
    saveas(gcf, desired_filename);

    toc
end