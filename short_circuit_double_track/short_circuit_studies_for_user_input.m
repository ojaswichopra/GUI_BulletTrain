function short_circuit_studies_for_user_input(TSS, AT, SP, Vp, Vs, Rp, Xp, Rs, Xs, Zn, short_ckt_MVA, lresistance, lreactance, mresistance, mreactance, row, f, n1, Ch, Mh, nFh, nFd, gh, gd, contact_wire_diameter, Resistance_C, messenger_wire_diameter, Resistance_M1, earth_wire_diameter, Resistance_G, feeder_wire_diameter, Resistance_F, rail_diameter, Resistance_R1, time_instant_short, total_distance_from_start_point, fault_type, Z_fault, track_up_down)
    format long 
    tic

    Line_data_bus_data_bus_type_normal;        %% calling for data creaction for whole traction network from TSS1 to TSS11%%
    separate_line_data_up;
    separate_line_data_down;
    % load("varitest.mat");
    % time_instant_short= input('Enter the time instant (sec) for short circuit');
    t_s_i=time_instant_short;
    % track_up_down=input('Enter 1 for UP track short circuit and 2 for Down track short circuit');
    % total_distance_from_start_point= input('Enter the distance from starting point (Mumbai) for voltage profile of entire day in kM');
    total_distance_from_start_point=total_distance_from_start_point*1000;

    d_index_length=length(d);
    for i_ddd=1:1:d_index_length
        if (total_distance_from_start_point<=d(i_ddd))
            d_index=i_ddd;
            break;
        end
    end

    track_TSS_no=fix((d_index)/2);
    d_length=length(d);
    d_modified=zeros(1,d_length-1);
    for jj=1:1:d_length-1
        d_modified(jj)=d(jj+1)-d(jj);
    end
    winding_defination(1)=1;
    i_def=2;
    for i_ddd=2:1:(d_index_length-1)/2
        condition_odd=mod(i_ddd,2);
        if (condition_odd==0)
            winding_defination(i_def)=2;
            winding_defination(i_def+1)=2;
            i_def=i_def+2;
        end
        if (condition_odd==1)
            winding_defination(i_def)=1;
            winding_defination(i_def+1)=1;
            i_def=i_def+2;
        end
    end
    if (winding_defination(i_def-1)==1)
        winding_defination(i_def)=2;
    else
        winding_defination(i_def)=1;
    end
    check_winding=winding_defination(d_index-1);
    faulted_winding_side=check_winding; % 1-teaser winding 2- main winding
    odd_check=mod((d_index-1),2);
    if (odd_check==0) %cond_int==1
        length_tss=total_distance_from_start_point-d(d_index-1);
    else
        length_tss=d(d_index)-total_distance_from_start_point;
    end
    distance_from_TSS=length_tss;
    for n_trac=1:1:N_TSS
        nt=(n_trac-1)*y + t_s_i;
        %     line_data_short_circuit;
        line_data_short_circuit_double_pre;
        
        bus_data_short_circuit_double;
        HSR;                    %%loading of data file%%
        DATA_INPUT;             %%loading and reading of input data%%
        impedance_calulation;    %% calculation of impedance for OHE in ohm/km %%
        MODEL_DESIGN;           %% design model for TSS, OHE, AT, TRAIN LOAD%%
        YBUST;                   %% Design of System bus teaser system%%
        YBUSM;                  %% Design of System bus Main system%%
        Load_flowT;              %%load Flow teaser winding%%
        Load_flowM;              %%load Flow main winding%%
        line_current_calculation;
        output_display;             %%display of result%%
        for_display_upload;
        up_down_sagregation;

    end


    % start of short circuit

    n_tss_fault = track_TSS_no;
    % fault_type = input('Enter the code for the "type of fault" as 1 - CR fault 2 -RF fault 3 - CF fault 4 - CRF fault');
    % Z_fault=input('Enter the fault resistance in ohm');
    n_trac=n_tss_fault;
    nt=(n_trac-1)*y + t_s_i;
    line_data_short_circuit_double_pre;
    bus_data_short_circuit_double;
    HSR;
    DATA_INPUT;
    impedance_calulation;
    MODEL_DESIGN;

    YBUST;
    YBUSM;
    ZbusT=inv(YbusT);
    ZbusM=inv(YbusM);
    type_fault=fault_type;
    fault_wind_side=faulted_winding_side;
    ft_n_no=fault_bus_index;
    fault_addmittance_matrix;
    Load_flowT;              %%load Flow teaser winding%%
    Load_flowM;              %%load Flow main winding%%
    line_current_calculation;
    output_display;             %%display of result%%
    for_display_upload;
    post_fault_calculation;
    short_circuit_line_current_cal;
    voltage_update_for_short_circuit_file;
    up_down_sagregation_post_fault;
    % save result
    variable_text_store_code;
    %Full_track_voltage_profile_instant_t_short_circuit;
end