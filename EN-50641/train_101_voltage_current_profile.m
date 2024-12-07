function train_101_voltage_current_profile(HS_train_A_F_data,d,line_data_M_emp,dTSS,y_whole,Vc_mag_Td,y,Vc_ang_Td,VR_mag_Td,VR_ang_Td,pTSS_T)
    % ##
    % ##
    tic
    % load('required_variable_load_flow_standard.mat')
    graphics_toolkit ("gnuplot")
    train1_position=length(HS_train_A_F_data(:,1))-1;
    for t_i= 1:1:train1_position
        ct_train_pos=HS_train_A_F_data(t_i+1,3);%*1000;
        train1_time(t_i)=HS_train_A_F_data(t_i+1,1);
        train_distance_from_start(t_i)=HS_train_A_F_data(t_i+1,3);%/1000;
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
    if line_data_M_emp~=1
        check_winding=winding_defination(d_index-1);
        cond_int=isinteger((d_index-1)/2);
        if cond_int==1
            length_tss=ct_train_pos-d(d_index-1);
        else
            length_tss=d(d_index)-ct_train_pos;
        end
    else
        length_tss=ct_train_pos;
        d_index=2;
        check_winding=1;
    end
        distance_from_Tss=length_tss;

        local_dis_len=length(dTSS((y_whole*(d_index-2)+t_i),:));
        d_sum=0;
        for xx_d=1:1:local_dis_len
            d_sum=d_sum+ dTSS((y_whole*(d_index-2)+t_i),xx_d);
            if (abs(distance_from_Tss-d_sum)<1e-6)
                local_ind=xx_d;
                break;
            end
        end
        local_ind=local_ind+1;
        if check_winding==1
            voltage_train(t_i)=Vc_mag_Td((y*(track_TSS_no-1)+t_i),local_ind)*(cos(Vc_ang_Td((y*(track_TSS_no-1)+t_i),local_ind)*pi/180)+i*sin(Vc_ang_Td((y*(track_TSS_no-1)+t_i),local_ind)*pi/180));
            voltage_train_rail(t_i)=VR_mag_Td((y*(track_TSS_no-1)+t_i),local_ind)*(cos(VR_ang_Td((y*(track_TSS_no-1)+t_i),local_ind)*pi/180)+i*sin(VR_ang_Td((y*(track_TSS_no-1)+t_i),local_ind)*pi/180));
            zz_ptss=pTSS_T((y*(track_TSS_no-1)+t_i),local_ind);

            train_current(t_i)=zz_ptss/(voltage_train(t_i)-voltage_train_rail(t_i));
            train_current(t_i)=train_current(t_i)*1000;
            train_angle(t_i)=angle(train_current(t_i))*180/pi;
            if train_angle(t_i)>90
                train_current_abs(t_i)=-abs(train_current(t_i));
            else
                train_current_abs(t_i)=abs(train_current(t_i));
            end
        end
        if check_winding==2
            voltage_train(t_i)=Vc_mag_Md((y*(track_TSS_no-1)+t_i),local_ind)*(cos(Vc_ang_Md((y*(track_TSS_no-1)+t_i),local_ind)*pi/180)+i*sin(Vc_ang_Md((y*(track_TSS_no-1)+t_i),local_ind)*pi/180));
            voltage_train_rail(t_i)=VR_mag_Md((y*(track_TSS_no-1)+t_i),local_ind)*(cos(VR_ang_Md((y*(track_TSS_no-1)+t_i),local_ind)*pi/180)+i*sin(VR_ang_Md((y*(track_TSS_no-1)+t_i),local_ind)*pi/180));
        end

    end
    voltage_train_abs= transpose(abs(voltage_train));
    voltage_train_rail_abs= transpose(abs(voltage_train_rail));
    train_current_abs=transpose(train_current_abs);
    train_current_ang=transpose(angle(train_current)*180/pi);
    % subplot(2,1,1)
    % plot(train1_time,voltage_train_rail_abs);
    % subplot(2,1,2)
    % plot(train_distance_from_start,voltage_train_rail_abs);

    % Create a figure handle
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);

    subplot(2,1,1)
    plot(train_distance_from_start,train_current_abs);
    ylim([-300 400])
    xlabel('Distance (km)','FontWeight','bold')
    ylabel('Train Current (Amp)','FontWeight','bold')
    set(gca, 'FontSize', 16);
    subplot(2,1,2)
    plot(train_distance_from_start,voltage_train_abs);
    xlabel('Distance (km)','FontWeight','bold')
    ylabel('Train Voltage (kV)','FontWeight','bold')
    set(gca, 'FontSize', 16);
    % plot(train_distance_from_start,train_current_ang);


    desired_filename = '../Plots/voltage_current_profile.png';
    saveas(gcf, desired_filename);
    toc
end