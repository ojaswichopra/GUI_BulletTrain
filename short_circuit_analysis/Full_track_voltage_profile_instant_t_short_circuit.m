function Full_track_voltage_profile_instant_t_short_circuit(TSS, d, y, Vc_mag_Td, Vc_ang_Td, VR_mag_Td, VR_ang_Td, Vf_mag_Td, Vf_ang_Td, Vc_mag_Md, Vc_ang_Md, VR_mag_Md, VR_ang_Md, Vf_mag_Md, Vf_ang_Md, dTSS_T, dTSS_M, Ic_line_mag_Td, Ic_line_ang_Td, Ir_line_mag_Td, Ir_line_ang_Td, If_line_mag_Td, If_line_ang_Td, Ic_line_mag_Md, Ic_line_ang_Md, Ir_line_mag_Md, Ir_line_ang_Md, If_line_mag_Md, If_line_ang_Md, time_instant_short, n_tss_fault, faulted_winding_side, linedata_dTSS_T, linedata_dTSS_M)
    % 
    tic
    % load("../SCA_text_files/TSS.txt");
    % load("../SCA_text_files/d.txt");
    % load("../SCA_text_files/y.txt");
    % load("../SCA_text_files/Vc_mag_Td.txt");
    % load("../SCA_text_files/Vc_ang_Td.txt");
    % load("../SCA_text_files/VR_mag_Td.txt");
    % load("../SCA_text_files/VR_ang_Td.txt");
    % load("../SCA_text_files/Vf_mag_Td.txt");
    % load("../SCA_text_files/Vf_ang_Td.txt");
    % load("../SCA_text_files/Vc_mag_Md.txt");
    % load("../SCA_text_files/Vc_ang_Md.txt");
    % load("../SCA_text_files/VR_mag_Md.txt");
    % load("../SCA_text_files/VR_ang_Md.txt");
    % load("../SCA_text_files/Vf_mag_Md.txt");
    % load("../SCA_text_files/Vf_ang_Md.txt");
    % load("../SCA_text_files/dTSS_T.txt");
    % load("../SCA_text_files/dTSS_M.txt");
    % load("../SCA_text_files/Ic_line_mag_Td.txt");
    % load("../SCA_text_files/Ic_line_ang_Td.txt");
    % load("../SCA_text_files/Ir_line_mag_Td.txt");
    % load("../SCA_text_files/Ir_line_ang_Td.txt");
    % load("../SCA_text_files/If_line_mag_Td.txt");
    % load("../SCA_text_files/If_line_ang_Td.txt");
    % load("../SCA_text_files/Ic_line_mag_Md.txt");
    % load("../SCA_text_files/Ic_line_ang_Md.txt");
    % load("../SCA_text_files/Ir_line_mag_Md.txt");
    % load("../SCA_text_files/Ir_line_ang_Md.txt");
    % load("../SCA_text_files/If_line_mag_Md.txt");
    % load("../SCA_text_files/If_line_ang_Md.txt");
    % load("../SCA_text_files/time_instant_short.txt");
    % load("../SCA_text_files/n_tss_fault.txt");
    % load("../SCA_text_files/faulted_winding_side.txt");
    % load("../SCA_text_files/linedata_dTSS_T.txt");
    % load("../SCA_text_files/linedata_dTSS_M.txt");
    z1_loaded = load("../SCA_text_files/z1.txt");
        % Determine the number of columns
        num_cols = size(z1_loaded, 2) / 2;  % Total columns divided by 2

        % Separate real and imaginary parts
        real_parts = z1_loaded(:, 1:num_cols);           % First half for real parts
        imag_parts = z1_loaded(:, num_cols+1:end);       % Second half for imaginary parts

        % Combine real and imaginary parts to reconstruct the complex variable z1
        z1 = real_parts + 1i * imag_parts;

    % load("../SCA_text_files/variable_code_Zshort_Zg_3train_hour.mat");
    track_TSS_no_1=length(TSS);
    track_length_file;
    % track_TSS_no=input('Enter the TSS number for which track voltage profile needs to be check');
    track_time_1= time_instant_short;
    % x_reso= input('Enter the distance resolution for voltage profile along the track');
    x_reso=10;
    points_index(1)=0;
    points_index_M(1)=0;
    for n_track=1:1:track_TSS_no_1

        track_time=track_time_1+((n_track-1)*y);
        %%% For Teaser side Voltage profile %%%%%
        V_temp(1)=Vc_mag_Td(track_time,1)*(cos(Vc_ang_Td(track_time,1)*pi/180)+i*sin(Vc_ang_Td(track_time,1)*pi/180));
        V_temp(2)=VR_mag_Td(track_time,1)*(cos(VR_ang_Td(track_time,1)*pi/180)+i*sin(VR_ang_Td(track_time,1)*pi/180));
        V_temp(3)=Vf_mag_Td(track_time,1)*(cos(Vf_ang_Td(track_time,1)*pi/180)+i*sin(Vf_ang_Td(track_time,1)*pi/180));
        V_profile_T(1,:)=V_temp;
        LL=nonzeros(dTSS_T(track_time,:)); %% storing the section length
        ii_x=1;
        LL_x=LL;
        if n_track==n_tss_fault
            if faulted_winding_side==1
                last_point_Train=sum(linedata_dTSS_T(:,4))*1000;
            else
                last_point_Train=sum(LL);
            end
        else
            last_point_Train=sum(LL);
        end
        %     last_point_Train=sum(LL);
        %%needs to be correct as track length is greater than appear%%
        track_line_length= winding_length_T(1,n_track);
        % dis_obt=0;

        I_line_current_track=[Ic_line_mag_Td(track_time,ii_x)*(cos(Ic_line_ang_Td(track_time,ii_x)*pi/180)+i*sin(Ic_line_ang_Td(track_time,ii_x)*pi/180));
            Ir_line_mag_Td(track_time,ii_x)*(cos(Ir_line_ang_Td(track_time,ii_x)*pi/180)+i*sin(Ir_line_ang_Td(track_time,ii_x)*pi/180));
            If_line_mag_Td(track_time,ii_x)*(cos(If_line_ang_Td(track_time,ii_x)*pi/180)+i*sin(If_line_ang_Td(track_time,ii_x)*pi/180))];

        points=track_line_length/x_reso; %%needs to be correct as track length is greater than appear%%
        %points_index(n_track+1)=fix(points)+1;
        points_index(n_track+1)=fix(points);
        distance_points(1)=0;
        for xx_f=1:1:fix(points)
            dis_obt=0;
            for ii_obt=1:1:ii_x
                %%
                if n_track==n_tss_fault
                    if faulted_winding_side==1
                        dis_obt=dis_obt+linedata_dTSS_T(ii_obt,4)*1000;    %% change
                    else
                        dis_obt=dis_obt+LL(ii_obt);
                    end
                else
                    dis_obt=dis_obt+LL(ii_obt);
                end
                %%%
            end

            if xx_f*x_reso>dis_obt & xx_f*x_reso<last_point_Train
                ii_x=ii_x+1;

                I_line_current_track=[Ic_line_mag_Td(track_time,ii_x)*(cos(Ic_line_ang_Td(track_time,ii_x)*pi/180)+i*sin(Ic_line_ang_Td(track_time,ii_x)*pi/180));
                    Ir_line_mag_Td(track_time,ii_x)*(cos(Ir_line_ang_Td(track_time,ii_x)*pi/180)+i*sin(Ir_line_ang_Td(track_time,ii_x)*pi/180));
                    If_line_mag_Td(track_time,ii_x)*(cos(If_line_ang_Td(track_time,ii_x)*pi/180)+i*sin(If_line_ang_Td(track_time,ii_x)*pi/180))];

            end
            if xx_f*x_reso>last_point_Train
                %ii_x=ii_x+1;

                I_line_current_track=[0;0;0]; %included program for introducing I_line_current_track =0 if ii_x> LL(max)
            end


            V_profile_T(xx_f+1,:)=transpose( transpose(V_profile_T(xx_f,:))-((x_reso*z1/1000)*I_line_current_track));
            I_profile_T(xx_f+1,:)=transpose(I_line_current_track);
            distance_points(xx_f+1)=xx_f*x_reso;
        end

        position_T=0;
        for point_sum_ind=1:1:n_track
            position_T=position_T+points_index(point_sum_ind);
        end
        pre_ind_t=1;
        for p_ind_t=position_T+1:1:(points_index(n_track+1)+position_T)
            V_profile_new_T(p_ind_t,:)=V_profile_T(pre_ind_t,:);
            I_profile_new_T(p_ind_t,:)=I_profile_T(pre_ind_t,:);
            distance_points_new_T(p_ind_t)=distance_points(pre_ind_t);
            pre_ind_t=pre_ind_t+1;
        end




        %%%% for main winding side voltage profile

        V_temp(1)=Vc_mag_Md(track_time,1)*(cos(Vc_ang_Md(track_time,1)*pi/180)+i*sin(Vc_ang_Md(track_time,1)*pi/180));
        V_temp(2)=VR_mag_Md(track_time,1)*(cos(VR_ang_Md(track_time,1)*pi/180)+i*sin(VR_ang_Md(track_time,1)*pi/180));
        V_temp(3)=Vf_mag_Md(track_time,1)*(cos(Vf_ang_Md(track_time,1)*pi/180)+i*sin(Vf_ang_Md(track_time,1)*pi/180));
        V_profile_M(1,:)=V_temp;
        LL=nonzeros(dTSS_M(track_time,:));
        ii_x=1;
        if n_track==n_tss_fault
            if faulted_winding_side==2
                last_point_Train=sum(linedata_dTSS_M(:,4))*1000;
            else
                last_point_Train=sum(LL);
            end
        else
            last_point_Train=sum(LL);
        end
        %last_point_Train=sum(LL);

        track_line_length_M= winding_length_M(1,n_track);
        % dis_obt=0;

        I_line_current_track_M=[Ic_line_mag_Md(track_time,ii_x)*(cos(Ic_line_ang_Md(track_time,ii_x)*pi/180)+i*sin(Ic_line_ang_Md(track_time,ii_x)*pi/180));
            Ir_line_mag_Md(track_time,ii_x)*(cos(Ir_line_ang_Md(track_time,ii_x)*pi/180)+i*sin(Ir_line_ang_Md(track_time,ii_x)*pi/180));
            If_line_mag_Md(track_time,ii_x)*(cos(If_line_ang_Md(track_time,ii_x)*pi/180)+i*sin(If_line_ang_Md(track_time,ii_x)*pi/180))];

        points=track_line_length_M/x_reso;
        %points_index_M(n_track+1)=fix(points)+1;
        points_index_M(n_track+1)=fix(points);
        distance_points_M(1)=0;
        for xx_f=1:1:fix(points)
            dis_obt=0;
            for ii_obt=1:1:ii_x
                if n_track==n_tss_fault
                    if faulted_winding_side==2
                        dis_obt=dis_obt+linedata_dTSS_M(ii_obt,4)*1000;    %% change
                    else
                        dis_obt=dis_obt+LL(ii_obt);
                    end
                else
                    dis_obt=dis_obt+LL(ii_obt);
                end
                %dis_obt=dis_obt+LL(ii_obt);
            end

            if xx_f*x_reso>dis_obt & xx_f*x_reso<last_point_Train
                ii_x=ii_x+1;
                I_line_current_track_M=[Ic_line_mag_Md(track_time,ii_x)*(cos(Ic_line_ang_Md(track_time,ii_x)*pi/180)+i*sin(Ic_line_ang_Md(track_time,ii_x)*pi/180));
                    Ir_line_mag_Md(track_time,ii_x)*(cos(Ir_line_ang_Md(track_time,ii_x)*pi/180)+i*sin(Ir_line_ang_Md(track_time,ii_x)*pi/180));
                    If_line_mag_Md(track_time,ii_x)*(cos(If_line_ang_Md(track_time,ii_x)*pi/180)+i*sin(If_line_ang_Md(track_time,ii_x)*pi/180))];

            end

            if xx_f*x_reso>last_point_Train

                I_line_current_track_M=[0;0;0]; %included program for introducing I_line_current_track =0 if ii_x> LL(max)
            end



            V_profile_M(xx_f+1,:)=transpose( transpose(V_profile_M(xx_f,:))-((x_reso*z1/1000)*I_line_current_track_M));
            I_profile_M(xx_f+1,:)=transpose(I_line_current_track_M);
            distance_points_M(xx_f+1)=xx_f*x_reso;

        end
        pre_ind=1;
        position_M=0;
        for point_sum_ind=1:1:n_track
            position_M=position_M+points_index_M(point_sum_ind);
        end


        for p_ind=(position_M+1):1:(points_index_M(n_track+1)+position_M)
            V_profile_new_M(p_ind,:)=V_profile_M(pre_ind,:);
            I_profile_new_M(p_ind,:)=I_profile_M(pre_ind,:);
            distance_points_new_M(p_ind)=distance_points_M(pre_ind);
            pre_ind=pre_ind+1;
        end
    end

    Voltage_distance_matrix_T(:,1)=distance_points_new_T;
    Voltage_distance_matrix_T(:,2)=V_profile_new_T(:,1);
    Voltage_distance_matrix_T(:,3)=V_profile_new_T(:,2);
    Voltage_distance_matrix_T(:,4)=V_profile_new_T(:,3);
    current_distance_matrix_T(:,1)=distance_points_new_T;
    current_distance_matrix_T(:,2)=I_profile_new_T(:,1);
    current_distance_matrix_T(:,3)=I_profile_new_T(:,2);
    current_distance_matrix_T(:,4)=I_profile_new_T(:,3);

    Voltage_distance_matrix_M(:,1)=distance_points_new_M;
    Voltage_distance_matrix_M(:,2)=V_profile_new_M(:,1);
    Voltage_distance_matrix_M(:,3)=V_profile_new_M(:,2);
    Voltage_distance_matrix_M(:,4)=V_profile_new_M(:,3);
    current_distance_matrix_M(:,1)=distance_points_new_M;
    current_distance_matrix_M(:,2)=I_profile_new_M(:,1);
    current_distance_matrix_M(:,3)=I_profile_new_M(:,2);
    current_distance_matrix_M(:,4)=I_profile_new_M(:,3);

    voltage_profile_design;
    current_profile_design;
    toc

    % plot(distance_points,abs(V_profile_T))
    % hold on
    % plot(distance_points_new_M,abs(V_profile_new_M))
    % subplot(3,1,1)
    % plot(distance_points_new_M,abs(V_profile_new_M(:,1)));
    % subplot(3,1,2)
    % plot(distance_points_new_M,abs(V_profile_new_M(:,2)));
    % subplot(3,1,3)
    % plot(distance_points_new_M,abs(V_profile_new_M(:,3)));
end
