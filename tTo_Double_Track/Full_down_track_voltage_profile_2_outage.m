function Full_down_track_voltage_profile_2_outage(N_TSS_O, N_TSS, track_time_1,x_reso,d, TSS, AT, y, Vc_mag_Td_up, Vc_ang_Td_up, VR_mag_Td_up, VR_ang_Td_up, Vf_mag_Td_up, Vf_ang_Td_up, dTSS_T_up, Ic_line_mag_Td_up, Ic_line_ang_Td_up, Ir_line_mag_Td_up, Ir_line_ang_Td_up, If_line_mag_Td_up, If_line_ang_Td_up, z1_loaded, Vc_mag_Md_up, Vc_ang_Md_up, VR_mag_Md_up, VR_ang_Md_up, Vf_mag_Md_up, Vf_ang_Md_up, dTSS_M_up, Ic_line_mag_Md_up, Ic_line_ang_Md_up, Ir_line_mag_Md_up, Ir_line_ang_Md_up, If_line_mag_Md_up, If_line_ang_Md_up)
    tic
    % N_TSS_O=load("N_TSS_O.txt");
    % N_TSS=load("N_TSS.txt");
    % d = load("d.txt");
    % TSS = load("TSS.txt");
    % AT = load("AT.txt");
    % y = load("y.txt");
    % Vc_mag_Td_down = load("Vc_mag_Td_down.txt");
    % Vc_ang_Td_down = load("Vc_ang_Td_down.txt");
    % VR_mag_Td_down = load("VR_mag_Td_down.txt");
    % VR_ang_Td_down = load("VR_ang_Td_down.txt");
    % Vf_mag_Td_down = load("Vf_mag_Td_down.txt");
    % Vf_ang_Td_down = load("Vf_ang_Td_down.txt");
    % dTSS_T_down = load("dTSS_T_down.txt");
    % Ic_line_mag_Td_down = load("Ic_line_mag_Td_down.txt");
    % Ic_line_ang_Td_down = load("Ic_line_ang_Td_down.txt");
    % Ir_line_mag_Td_down = load("Ir_line_mag_Td_down.txt");
    % Ir_line_ang_Td_down = load("Ir_line_ang_Td_down.txt");
    % If_line_mag_Td_down = load("If_line_mag_Td_down.txt");
    % If_line_ang_Td_down = load("If_line_ang_Td_down.txt");

    %loading back the complex variable z1 from its text file
    z1_loaded = load("../tTo_double_text_files/z1.txt");
    % Determine the number of columns
    num_cols = size(z1_loaded, 2) / 2;  % Total columns divided by 2

    % Separate real and imaginary parts
    real_parts = z1_loaded(:, 1:num_cols);           % First half for real parts
    imag_parts = z1_loaded(:, num_cols+1:end);       % Second half for imaginary parts

    % Combine real and imaginary parts to reconstruct the complex variable z1
    z1 = real_parts + 1i * imag_parts;

    % Vc_mag_Md_down = load("Vc_mag_Md_down.txt");
    % Vc_ang_Md_down = load("Vc_ang_Md_down.txt");
    % VR_mag_Md_down = load("VR_mag_Md_down.txt");
    % VR_ang_Md_down = load("VR_ang_Md_down.txt");
    % Vf_mag_Md_down = load("Vf_mag_Md_down.txt");
    % Vf_ang_Md_down = load("Vf_ang_Md_down.txt");
    % dTSS_M_down = load("dTSS_M_down.txt");
    % Ic_line_mag_Md_down = load("Ic_line_mag_Md_down.txt");
    % Ic_line_ang_Md_down = load("Ic_line_ang_Md_down.txt");
    % Ir_line_mag_Md_down = load("Ir_line_mag_Md_down.txt");
    % Ir_line_ang_Md_down = load("Ir_line_ang_Md_down.txt");
    % If_line_mag_Md_down = load("If_line_mag_Md_down.txt");
    % If_line_ang_Md_down = load("If_line_ang_Md_down.txt");
    track_TSS_no=length(TSS)-length(N_TSS_O);
    track_length_file_adjacent_outage;
    % track_time_1= input('Enter the time instant (in sec) at which the voltage profile of the UP track needs to be investigated');
    % x_reso= input('Enter the distance resolution for voltage profile along the track');
    points_index(1)=0;
    points_index_M(1)=0;
    for n_track=1:1:track_TSS_no
        track_time=track_time_1+((n_track-1)*y);
        %%% For Teaser side Voltage profile %%%%%
        V_temp(1)=Vc_mag_Td_down(track_time,1)*(cos(Vc_ang_Td_down(track_time,1)*pi/180)+i*sin(Vc_ang_Td_down(track_time,1)*pi/180));
        V_temp(2)=VR_mag_Td_down(track_time,1)*(cos(VR_ang_Td_down(track_time,1)*pi/180)+i*sin(VR_ang_Td_down(track_time,1)*pi/180));
        V_temp(3)=Vf_mag_Td_down(track_time,1)*(cos(Vf_ang_Td_down(track_time,1)*pi/180)+i*sin(Vf_ang_Td_down(track_time,1)*pi/180));
        V_profile_T(1,:)=V_temp;
        LL=nonzeros(dTSS_T_down(track_time,:)); %% storing the section length
        ii_x=1;
        LL_x=LL;
        last_point_Train=sum(LL);
        %track_line_length= sum(LL); %%needs to be correct as track length is greater than appear%%
        track_line_length= winding_length_T(1,n_track);
        I_line_current_track=[Ic_line_mag_Td_down(track_time,ii_x)*(cos(Ic_line_ang_Td_down(track_time,ii_x)*pi/180)+i*sin(Ic_line_ang_Td_down(track_time,ii_x)*pi/180));
            Ir_line_mag_Td_down(track_time,ii_x)*(cos(Ir_line_ang_Td_down(track_time,ii_x)*pi/180)+i*sin(Ir_line_ang_Td_down(track_time,ii_x)*pi/180));
            If_line_mag_Td_down(track_time,ii_x)*(cos(If_line_ang_Td_down(track_time,ii_x)*pi/180)+i*sin(If_line_ang_Td_down(track_time,ii_x)*pi/180))];

        points=track_line_length/x_reso; %%needs to be correct as track length is greater than appear%%
        points_index(n_track+1)=fix(points);
        distance_points(1)=0;
        for xx_f=1:1:fix(points)
            dis_obt=0;
            for ii_obt=1:1:ii_x
                dis_obt=dis_obt+LL(ii_obt);
            end
            if xx_f*x_reso>dis_obt & xx_f*x_reso<last_point_Train
                ii_x=ii_x+1;

                I_line_current_track=[Ic_line_mag_Td_down(track_time,ii_x)*(cos(Ic_line_ang_Td_down(track_time,ii_x)*pi/180)+i*sin(Ic_line_ang_Td_down(track_time,ii_x)*pi/180));
                    Ir_line_mag_Td_down(track_time,ii_x)*(cos(Ir_line_ang_Td_down(track_time,ii_x)*pi/180)+i*sin(Ir_line_ang_Td_down(track_time,ii_x)*pi/180));
                    If_line_mag_Td_down(track_time,ii_x)*(cos(If_line_ang_Td_down(track_time,ii_x)*pi/180)+i*sin(If_line_ang_Td_down(track_time,ii_x)*pi/180))];
            end
            if xx_f*x_reso>last_point_Train
                I_line_current_track=[0;0;0]; %included program for introducing I_line_current_track =0 if ii_x> LL(max)

            end
            V_profile_T(xx_f+1,:)=transpose( transpose(V_profile_T(xx_f,:))-((x_reso*z1/1000)*I_line_current_track));
            distance_points(xx_f+1)=xx_f*x_reso;
        end

        position_T=0;
        for point_sum_ind=1:1:n_track
            position_T=position_T+points_index(point_sum_ind);
        end
        pre_ind_t=1;
        for p_ind_t=position_T+1:1:(points_index(n_track+1)+position_T)
            V_profile_new_T(p_ind_t,:)=V_profile_T(pre_ind_t,:);
            distance_points_new_T(p_ind_t)=distance_points(pre_ind_t);
            pre_ind_t=pre_ind_t+1;
        end
        %%%% for main winding side voltage profile

        V_temp(1)=Vc_mag_Md_down(track_time,1)*(cos(Vc_ang_Md_down(track_time,1)*pi/180)+i*sin(Vc_ang_Md_down(track_time,1)*pi/180));
        V_temp(2)=VR_mag_Md_down(track_time,1)*(cos(VR_ang_Md_down(track_time,1)*pi/180)+i*sin(VR_ang_Md_down(track_time,1)*pi/180));
        V_temp(3)=Vf_mag_Md_down(track_time,1)*(cos(Vf_ang_Md_down(track_time,1)*pi/180)+i*sin(Vf_ang_Md_down(track_time,1)*pi/180));
        V_profile_M(1,:)=V_temp;
        LL=nonzeros(dTSS_M_down(track_time,:));
        ii_x=1;
        last_point_Train=sum(LL);
        track_line_length_M= winding_length_M(1,n_track);
        I_line_current_track_M=[Ic_line_mag_Md_down(track_time,ii_x)*(cos(Ic_line_ang_Md_down(track_time,ii_x)*pi/180)+i*sin(Ic_line_ang_Md_down(track_time,ii_x)*pi/180));
            Ir_line_mag_Md_down(track_time,ii_x)*(cos(Ir_line_ang_Md_down(track_time,ii_x)*pi/180)+i*sin(Ir_line_ang_Md_down(track_time,ii_x)*pi/180));
            If_line_mag_Md_down(track_time,ii_x)*(cos(If_line_ang_Md_down(track_time,ii_x)*pi/180)+i*sin(If_line_ang_Md_down(track_time,ii_x)*pi/180))];

        points=track_line_length_M/x_reso;
        points_index_M(n_track+1)=fix(points);
        distance_points_M(1)=0;
        for xx_f=1:1:fix(points)
            dis_obt=0;
            for ii_obt=1:1:ii_x
                dis_obt=dis_obt+LL(ii_obt);
            end
            if xx_f*x_reso>dis_obt & xx_f*x_reso<last_point_Train
                ii_x=ii_x+1;
                I_line_current_track_M=[Ic_line_mag_Md_down(track_time,ii_x)*(cos(Ic_line_ang_Md_down(track_time,ii_x)*pi/180)+i*sin(Ic_line_ang_Md_down(track_time,ii_x)*pi/180));
                    Ir_line_mag_Md_down(track_time,ii_x)*(cos(Ir_line_ang_Md_down(track_time,ii_x)*pi/180)+i*sin(Ir_line_ang_Md_down(track_time,ii_x)*pi/180));
                    If_line_mag_Md_down(track_time,ii_x)*(cos(If_line_ang_Md_down(track_time,ii_x)*pi/180)+i*sin(If_line_ang_Md_down(track_time,ii_x)*pi/180))];
            end
            if xx_f*x_reso>last_point_Train

                I_line_current_track_M=[0;0;0]; %included program for introducing I_line_current_track =0 if ii_x> LL(max)
            end
            V_profile_M(xx_f+1,:)=transpose( transpose(V_profile_M(xx_f,:))-((x_reso*z1/1000)*I_line_current_track_M));
            distance_points_M(xx_f+1)=xx_f*x_reso;
        end
        pre_ind=1;
        position_M=0;
        for point_sum_ind=1:1:n_track
            position_M=position_M+points_index_M(point_sum_ind);
        end
        for p_ind=(position_M+1):1:(points_index_M(n_track+1)+position_M)
            V_profile_new_M(p_ind,:)=V_profile_M(pre_ind,:);
            distance_points_new_M(p_ind)=distance_points_M(pre_ind);
            pre_ind=pre_ind+1;
        end
    end

    Voltage_distance_matrix_T(:,1)=distance_points_new_T;
    Voltage_distance_matrix_T(:,2)=V_profile_new_T(:,1);
    Voltage_distance_matrix_T(:,3)=V_profile_new_T(:,2);
    Voltage_distance_matrix_T(:,4)=V_profile_new_T(:,3);

    Voltage_distance_matrix_M(:,1)=distance_points_new_M;
    Voltage_distance_matrix_M(:,2)=V_profile_new_M(:,1);
    Voltage_distance_matrix_M(:,3)=V_profile_new_M(:,2);
    Voltage_distance_matrix_M(:,4)=V_profile_new_M(:,3);

    voltage_profile_design_adjecent_outage_down;
    toc
end