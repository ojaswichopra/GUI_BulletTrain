function Down_line_voltage_variation_over_day (total_distance_from_start_point, d, dTSS_T_down, Ic_line_mag_Td_down, Ic_line_ang_Td_down, Ir_line_mag_Td_down, Ir_line_ang_Td_down, If_line_mag_Td_down, If_line_ang_Td_down, Vc_mag_Td_down, Vc_ang_Td_down, VR_mag_Td_down, VR_ang_Td_down, Vf_mag_Td_down, Vf_ang_Td_down, y, dTSS_M_down, Ic_line_mag_Md_down, Ic_line_ang_Md_down, Ir_line_mag_Md_down, Ir_line_ang_Md_down, If_line_mag_Md_down, If_line_ang_Md_down, Vc_mag_Md_down, Vc_ang_Md_down, VR_mag_Md_down, VR_ang_Md_down, Vf_mag_Md_down, Vf_ang_Md_down)
    graphics_toolkit ("gnuplot")
    format longG
    tic
    % load("required_variable_load_flow_mum_to_ahm_each_stop.mat");
    % d = load("d.txt");
    % dTSS_T_down = load("dTSS_T_down.txt");
    % Ic_line_mag_Td_down = load("Ic_line_mag_Td_down.txt");
    % Ic_line_ang_Td_down = load("Ic_line_ang_Td_down.txt");
    % Ir_line_mag_Td_down = load("Ir_line_mag_Td_down.txt");
    % Ir_line_ang_Td_down = load("Ir_line_ang_Td_down.txt");
    % If_line_mag_Td_down = load("If_line_mag_Td_down.txt");
    % If_line_ang_Td_down = load("If_line_ang_Td_down.txt");
    % Vc_mag_Td_down = load("Vc_mag_Td_down.txt");
    % Vc_ang_Td_down = load("Vc_ang_Td_down.txt");
    % VR_mag_Td_down = load("VR_mag_Td_down.txt");
    % VR_ang_Td_down = load("VR_ang_Td_down.txt");
    % Vf_mag_Td_down = load("Vf_mag_Td_down.txt");
    % Vf_ang_Td_down = load("Vf_ang_Td_down.txt");

    %loading back the complex variable z1 from its text file
    z1_loaded = load("../normal_text_files/z1.txt");
    % Determine the number of columns
    num_cols = size(z1_loaded, 2) / 2;  % Total columns divided by 2

    % Separate real and imaginary parts
    real_parts = z1_loaded(:, 1:num_cols);           % First half for real parts
    imag_parts = z1_loaded(:, num_cols+1:end);       % Second half for imaginary parts

    % Combine real and imaginary parts to reconstruct the complex variable z1
    z1 = real_parts + 1i * imag_parts;

    % y = load("y.txt");
    % dTSS_M_down = load("dTSS_M_down.txt");
    % Ic_line_mag_Md_down = load("Ic_line_mag_Md_down.txt");
    % Ic_line_ang_Md_down = load("Ic_line_ang_Md_down.txt");
    % Ir_line_mag_Md_down = load("Ir_line_mag_Md_down.txt");
    % Ir_line_ang_Md_down = load("Ir_line_ang_Md_down.txt");
    % If_line_mag_Md_down = load("If_line_mag_Md_down.txt");
    % If_line_ang_Md_down = load("If_line_ang_Md_down.txt");
    % Vc_mag_Md_down = load("Vc_mag_Md_down.txt");
    % Vc_ang_Md_down = load("Vc_ang_Md_down.txt");
    % VR_mag_Md_down = load("VR_mag_Md_down.txt");
    % VR_ang_Md_down = load("VR_ang_Md_down.txt");
    % Vf_mag_Md_down = load("Vf_mag_Md_down.txt");
    % Vf_ang_Md_down = load("Vf_ang_Md_down.txt");

    % total_distance_from_start_point= input(['Enter the distance (in Km) from starting point ' ...
    % 'at which the voltage profile over entire durations of train scheduling needs to be investigated']);
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
        ntt=length(dTSS_T_down(:,1));
        point_i=1;
        for ii_ntt=((track_TSS_no-1)*y+1):1:track_TSS_no*y
            LL=nonzeros(dTSS_T_down(ii_ntt,:));
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
                I_line_current_track=[Ic_line_mag_Td_down(ii_ntt,section)*(cos(Ic_line_ang_Td_down(ii_ntt,section)*pi/180)+i*sin(Ic_line_ang_Td_down(ii_ntt,section)*pi/180));
                    Ir_line_mag_Td_down(ii_ntt,section)*(cos(Ir_line_ang_Td_down(ii_ntt,section)*pi/180)+i*sin(Ir_line_ang_Td_down(ii_ntt,section)*pi/180));
                    If_line_mag_Td_down(ii_ntt,section)*(cos(If_line_ang_Td_down(ii_ntt,section)*pi/180)+i*sin(If_line_ang_Td_down(ii_ntt,section)*pi/180))];

                V_section_bus=[Vc_mag_Td_down(ii_ntt,section)*(cos(Vc_ang_Td_down(ii_ntt,section)*pi/180)+i*sin(Vc_ang_Td_down(ii_ntt,section)*pi/180));
                    VR_mag_Td_down(ii_ntt,section)*(cos(VR_ang_Td_down(ii_ntt,section)*pi/180)+i*sin(VR_ang_Td_down(ii_ntt,section)*pi/180));
                    Vf_mag_Td_down(ii_ntt,section)*(cos(Vf_ang_Td_down(ii_ntt,section)*pi/180)+i*sin(Vf_ang_Td_down(ii_ntt,section)*pi/180));];
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
                V_section_bus=[Vc_mag_Td_down(ii_ntt,section_end)*(cos(Vc_ang_Td_down(ii_ntt,section_end)*pi/180)+i*sin(Vc_ang_Td_down(ii_ntt,section_end)*pi/180));
                    VR_mag_Td_down(ii_ntt,section_end)*(cos(VR_ang_Td_down(ii_ntt,section_end)*pi/180)+i*sin(VR_ang_Td_down(ii_ntt,section_end)*pi/180));
                    Vf_mag_Td_down(ii_ntt,section_end)*(cos(Vf_ang_Td_down(ii_ntt,section_end)*pi/180)+i*sin(Vf_ang_Td_down(ii_ntt,section_end)*pi/180));];
                I_line_current_track=[0;0;0];
                len=distance_over_day-LL_xxx(section_end);
                Voltage_distance(point_i,:)=transpose(V_section_bus-(z1*len/1000)*I_line_current_track);
            end


            time_points(point_i)=point_i;
            point_i=point_i+1;
        end
        %plot(time_points,abs(Voltage_distance));
        figureHandle = figure;

        % Get screen size from root object (0)
        screenSize = get(0, 'ScreenSize');

        % Set the figure to match the screen size
        set(figureHandle, 'Position', [100, 100, 1830, 1300]);

        % Define line properties for better visibility
        lineWidth = 2;

        % Subplot 1: Contact Voltage Magnitude
        subplot(3, 1, 1);
        plot(time_points, abs(Voltage_distance(:, 1)), 'LineWidth', lineWidth, 'Color', [0.8500 0.3250 0.0980]); % Red line
        xlabel('Time (sec)', 'FontWeight', 'bold', 'FontSize', 12);
        ylabel('Contact voltage magnitude (kV)', 'FontWeight', 'bold', 'FontSize', 12);
        title('Contact Voltage Over Time', 'FontWeight', 'bold', 'FontSize', 14);
        % grid on; % Add grid for better readability

        % Subplot 2: Rail Voltage Magnitude
        subplot(3, 1, 2);
        plot(time_points, abs(Voltage_distance(:, 2)), 'LineWidth', lineWidth, 'Color', [0.4660 0.6740 0.1880]); % Green line
        xlabel('Time (sec)', 'FontWeight', 'bold', 'FontSize', 12);
        ylabel('Rail voltage magnitude (kV)', 'FontWeight', 'bold', 'FontSize', 12);
        title('Rail Voltage Over Time', 'FontWeight', 'bold', 'FontSize', 14);
        % grid on;

        % Subplot 3: Feeder Voltage Magnitude
        subplot(3, 1, 3);
        plot(time_points, abs(Voltage_distance(:, 3)), 'LineWidth', lineWidth, 'Color', [0.3010 0.7450 0.9330]); % Blue line
        xlabel('Time (sec)', 'FontWeight', 'bold', 'FontSize', 12);
        ylabel('Feeder voltage magnitude (kV)', 'FontWeight', 'bold', 'FontSize', 12);
        title('Feeder Voltage Over Time', 'FontWeight', 'bold', 'FontSize', 14);
        % grid on;

        % Set consistent figure background and formatting
        set(gcf, 'Color', 'w'); % White background
        for i = 1:3
            subplot(3, 1, i);
            set(gca, 'FontSize', 12, 'LineWidth', 1.2); % Uniform axis properties
        end


    else %%%% Main Winding side %%%%
        ntt=length(dTSS_M_down(:,1));
        point_i=1;
        for ii_ntt=((track_TSS_no-1)*y+1):1:track_TSS_no*y
            LL=nonzeros(dTSS_M_down(ii_ntt,:));
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
                I_line_current_track_M=[Ic_line_mag_Md_down(ii_ntt,section)*(cos(Ic_line_ang_Md_down(ii_ntt,section)*pi/180)+i*sin(Ic_line_ang_Md_down(ii_ntt,section)*pi/180));
                    Ir_line_mag_Md_down(ii_ntt,section)*(cos(Ir_line_ang_Md_down(ii_ntt,section)*pi/180)+i*sin(Ir_line_ang_Md_down(ii_ntt,section)*pi/180));
                    If_line_mag_Md_down(ii_ntt,section)*(cos(If_line_ang_Md_down(ii_ntt,section)*pi/180)+i*sin(If_line_ang_Md_down(ii_ntt,section)*pi/180))];

                V_section_bus_M=[Vc_mag_Md_down(ii_ntt,section)*(cos(Vc_ang_Md_down(ii_ntt,section)*pi/180)+i*sin(Vc_ang_Md_down(ii_ntt,section)*pi/180));
                    VR_mag_Md_down(ii_ntt,section)*(cos(VR_ang_Md_down(ii_ntt,section)*pi/180)+i*sin(VR_ang_Md_down(ii_ntt,section)*pi/180));
                    Vf_mag_Md_down(ii_ntt,section)*(cos(Vf_ang_Md_down(ii_ntt,section)*pi/180)+i*sin(Vf_ang_Md_down(ii_ntt,section)*pi/180));];

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

                V_section_bus_M=[Vc_mag_Md_down(ii_ntt,section_end)*(cos(Vc_ang_Md_down(ii_ntt,section_end)*pi/180)+i*sin(Vc_ang_Md_down(ii_ntt,section_end)*pi/180));
                    VR_mag_Md_down(ii_ntt,section_end)*(cos(VR_ang_Md_down(ii_ntt,section_end)*pi/180)+i*sin(VR_ang_Md_down(ii_ntt,section_end)*pi/180));
                    Vf_mag_Md_down(ii_ntt,section_end)*(cos(Vf_ang_Md_down(ii_ntt,section_end)*pi/180)+i*sin(Vf_ang_Md_down(ii_ntt,section_end)*pi/180));];
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
        set(figureHandle, 'Position', [100, 100, 1830, 1300]);

        % Line properties for better visualization
        lineWidth = 2;

        % Subplot 1: Contact Voltage Magnitude
        subplot(3, 1, 1);
        plot(time_points, abs(Voltage_distance_M(:, 1)), 'LineWidth', lineWidth, 'Color', [0.8500 0.3250 0.0980]); % Red line
        xlabel('Time (sec)', 'FontWeight', 'bold', 'FontSize', 12);
        ylabel('Contact Voltage Magnitude (kV)', 'FontWeight', 'bold', 'FontSize', 12);
        title('Contact Voltage Over Time', 'FontWeight', 'bold', 'FontSize', 14);
        % grid on; % Add grid for better readability

        % Subplot 2: Rail Voltage Magnitude
        subplot(3, 1, 2);
        plot(time_points, abs(Voltage_distance_M(:, 2)), 'LineWidth', lineWidth, 'Color', [0.4660 0.6740 0.1880]); % Green line
        xlabel('Time (sec)', 'FontWeight', 'bold', 'FontSize', 12);
        ylabel('Rail Voltage Magnitude (kV)', 'FontWeight', 'bold', 'FontSize', 12);
        title('Rail Voltage Over Time', 'FontWeight', 'bold', 'FontSize', 14);
        % grid on;

        % Subplot 3: Feeder Voltage Magnitude
        subplot(3, 1, 3);
        plot(time_points, abs(Voltage_distance_M(:, 3)), 'LineWidth', lineWidth, 'Color', [0.3010 0.7450 0.9330]); % Blue line
        xlabel('Time (sec)', 'FontWeight', 'bold', 'FontSize', 12);
        ylabel('Feeder Voltage Magnitude (kV)', 'FontWeight', 'bold', 'FontSize', 12);
        title('Feeder Voltage Over Time', 'FontWeight', 'bold', 'FontSize', 14);
        % grid on;

        % Set consistent figure background and formatting
        set(gcf, 'Color', 'w'); % White background
        for i = 1:3
            subplot(3, 1, i);
            set(gca, 'FontSize', 12, 'LineWidth', 1.2); % Uniform axis properties
        end

            end

            desired_filename = '../Plots_normal/Down_line_voltage_variation_over_day.png';
            saveas(gcf, desired_filename);
            toc

end
