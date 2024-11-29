function train_voltage_profile_train_number_adjacent_outage_load_file(train_number, N_train_per_hour, each_stop_train_data, d, N_TSS_O, N_TSS, Vc_mag_Td, VR_mag_Td, Vf_mag_Td, Vc_ang_Td, VR_ang_Td, Vf_ang_Td, Vc_mag_Md, VR_mag_Md, Vf_mag_Md, Vc_ang_Md, VR_ang_Md, Vf_ang_Md, dTSS, y)
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
    % no_of_train=input('enter the no. of trains running per hour = ');
    % train_number=input('enter the trains number or name = ');
    train_intervals=60*60/no_of_train;
    train_time_space=(train_number-1)*train_intervals;
    train1_position=length(each_stop_train_data(:,1));
    for t_i= 1:1:train1_position
        ct_train_pos=each_stop_train_data(t_i,3);
        train1_time(t_i)=each_stop_train_data(t_i,1)+train_time_space;
        train_distance_from_start(t_i)=each_stop_train_data(t_i,3)/1000;
        d_index_length=length(d);
        
        ii=1;
        for jj=1:1:d_index_length
            if N_TSS_O(1)==1
                if (jj==2*(N_TSS_O(1)-1)+2)||(jj==2*(N_TSS_O(1)-1)+3)||(jj==2*(N_TSS_O(2)))||(jj==2*(N_TSS_O(2))+1)

                else
                    d1(ii)=d(jj);
                    ii=ii+1;
                end
            elseif N_TSS_O(2)==N_TSS
                if (jj==2*(N_TSS_O(1)-1)+1)||(jj==2*(N_TSS_O(1)-1)+2)||(jj==2*(N_TSS_O(2))-1)||(jj==2*(N_TSS_O(2)))

                else
                    d1(ii)=d(jj);
                    ii=ii+1;
                end

            else
                if (jj==2*(N_TSS_O(1)-1)+1)||(jj==2*(N_TSS_O(1)-1)+2)||(jj==2*(N_TSS_O(2)))||(jj==2*(N_TSS_O(2))+1)

                else
                    d1(ii)=d(jj);
                    ii=ii+1;
                end
            end
        end
        d_index_length=length(d1);
        for i_ddd=1:1:d_index_length
            if ct_train_pos<=d1(i_ddd)
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
    %     cond_int=isinteger((d_index-1)/2);
        if odd_check==0%cond_int==1
            length_tss=ct_train_pos-d1(d_index-1);
            
        else
            length_tss=d1(d_index)-ct_train_pos;
        end
        distance_from_Tss=length_tss;
        local_dis_len=length(dTSS((y*(d_index-2)+t_i+train_time_space),:));
        d_sum=0;
        for xx_d=1:1:local_dis_len
    %         d_sum=d_sum+ dTSS((y*(d_index-2)+t_i-1+train_time_space),xx_d);
            d_sum=d_sum+ dTSS((y*(d_index-2)+t_i+train_time_space),xx_d);
    %         if distance_from_Tss== d_sum
            if (abs(distance_from_Tss-d_sum)<1e-6)
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
    set(figureHandle, 'Position',  [100, 100, 2500, 2000]);
   
    subplot(4,1,1)
    plot(train1_time/60,voltage_train_abs);
    title(['Contact voltage of train no ', int2str(train_number),' vs Time'])
    xlabel('Time (minute)','FontWeight','bold')
    ylabel('Voltage Magnitude (kV)','FontWeight','bold')
    subplot(4,1,2)
    plot(train_distance_from_start,voltage_train_abs);
    title(['Contact voltage of train no ', int2str(train_number),' vs Distance'])
    xlabel('Distance (Km)','FontWeight','bold')
    ylabel('Voltage Magnitude (kV)','FontWeight','bold')
    subplot(4,1,3)
    plot(train1_time/60,voltage_train_rail_abs);
    title(['Rail voltage of train no ', int2str(train_number),' vs Time'])
    xlabel('Time (minute)','FontWeight','bold')
    ylabel('Voltage Magnitude (kV)','FontWeight','bold')
    subplot(4,1,4)
    plot(train_distance_from_start,voltage_train_rail_abs);
    title(['Rail voltage of train no ', int2str(train_number),' vs Distance'])
    xlabel('Distance (Km)','FontWeight','bold')
    ylabel('Voltage Magnitude (kV)','FontWeight','bold')
    
    desired_filename = '../Plots_tTo/tTo_train_voltage.png';  % Replace 'desired_name' with your file name
    saveas(gcf, desired_filename);
    toc
end