
 
 tic
 load("variable_code_Zshort_Zg_3train_hour.mat");

train1_position=length(each_stop_train_data(:,1));
for t_i= 1:1:train1_position
    ct_train_pos=each_stop_train_data(t_i,3);
    train1_time(t_i)=each_stop_train_data(t_i,1);
    train_distance_from_start(t_i)=each_stop_train_data(t_i,3)/1000;
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
    cond_int=isinteger((d_index-1)/2);
    if cond_int==1
        length_tss=ct_train_pos-d(d_index-1);
    else
        length_tss=d(d_index)-ct_train_pos;
    end
    distance_from_Tss=length_tss;
    local_dis_len=length(dTSS((y*(d_index-2)+t_i),:));
    d_sum=0;
    for xx_d=1:1:local_dis_len
        d_sum=d_sum+ dTSS((y*(d_index-2)+t_i),xx_d);
        if distance_from_Tss== d_sum
            local_ind=xx_d;
            break;
        end
    end
    if check_winding==1
        voltage_train(t_i)=Vc_mag_Td((y*(track_TSS_no-1)+t_i),local_ind)*(cos(Vc_ang_Td((y*(track_TSS_no-1)+t_i),local_ind)*pi/180)+i*sin(Vc_ang_Td((y*(track_TSS_no-1)+t_i),local_ind)*pi/180));
        voltage_train_rail(t_i)=VR_mag_Td((y*(track_TSS_no-1)+t_i),local_ind)*(cos(VR_ang_Td((y*(track_TSS_no-1)+t_i),local_ind)*pi/180)+i*sin(VR_ang_Td((y*(track_TSS_no-1)+t_i),local_ind)*pi/180));
    end
    if check_winding==2
        voltage_train(t_i)=Vc_mag_Md((y*(track_TSS_no-1)+t_i),local_ind)*(cos(Vc_ang_Md((y*(track_TSS_no-1)+t_i),local_ind)*pi/180)+i*sin(Vc_ang_Md((y*(track_TSS_no-1)+t_i),local_ind)*pi/180));
        voltage_train_rail(t_i)=VR_mag_Md((y*(track_TSS_no-1)+t_i),local_ind)*(cos(VR_ang_Md((y*(track_TSS_no-1)+t_i),local_ind)*pi/180)+i*sin(VR_ang_Md((y*(track_TSS_no-1)+t_i),local_ind)*pi/180));
    end

end
voltage_train_abs= transpose(abs(voltage_train));
voltage_train_rail_abs= transpose(abs(voltage_train_rail));
% subplot(2,1,1)
% plot(train1_time,voltage_train_rail_abs);
% subplot(2,1,2)
% plot(train_distance_from_start,voltage_train_rail_abs);
subplot(4,1,1)
plot(train1_time/60,voltage_train_abs);
title(['Contact voltage of train no 1 vs Time'])
xlabel('Time (minute)','FontWeight','bold')
ylabel('Voltage Magnitude (kV)','FontWeight','bold')
subplot(4,1,2)
plot(train_distance_from_start,voltage_train_abs);
title(['Contact voltage of train no 1 vs Distance'])
xlabel('Distance (Km)','FontWeight','bold')
ylabel('Voltage Magnitude (kV)','FontWeight','bold')
subplot(4,1,3)
plot(train1_time/60,voltage_train_rail_abs);
title(['Rail voltage of train no 1 vs Time'])
xlabel('Time (minute)','FontWeight','bold')
ylabel('Voltage Magnitude (kV)','FontWeight','bold')
subplot(4,1,4)
plot(train_distance_from_start,voltage_train_rail_abs);
title(['Rail voltage of train no 1 vs Distance'])
xlabel('Distance (Km)','FontWeight','bold')
ylabel('Voltage Magnitude (kV)','FontWeight','bold')

toc