function code_run_outage(N_TSS_O, TSS, AT, SP, Vp, Vs, Rp, Xp, Rs, Xs, Zn, short_ckt_MVA, lresistance, lreactance, mresistance, mreactance, row, f, n1, Ch, Mh, nFh, nFd, gh, gd, contact_wire_diameter, Resistance_C, messenger_wire_diameter, Resistance_M1, earth_wire_diameter, Resistance_G, feeder_wire_diameter, Resistance_F, rail_diameter, Resistance_R1)
    progress_file = 'progress_file.txt';
    format longG
    tic
    Line_data_bus_data_bus_type_one_TSS_outage;        %% calling for data creaction for whole traction network from TSS1 to TSS11%%
    separate_line_data_outage_up;
    separate_line_data_outage_down;
    HSR;                    %%loading of data file%%
    impedance_calulation;    %% calculation of impedance for OHE in ohm/km %%
    MODEL_DESIGN;           %% design model for TSS, OHE, AT, TRAIN LOAD%%

    NT=length(dTSS_T_up);

    for nt=1:1:NT
        %     line_data_Tss1_M;
        line_data_Tss_double;
        %     bus_data_Tss1;
        bus_data_Tss_double;
        DATA_INPUT;             %%loading and reading of input data%%
        YBUST;                   %% Design of System bus teaser system%%
        YBUSM;                  %% Design of System bus Main system%%
        Load_flowT;              %%load Flow teaser winding%%
        Load_flowM;              %%load Flow main winding%%
        line_current_calculation;
        output_display;             %%display of result%%
        for_display_upload;
        up_down_segregation;
        load_flow_completion_percentage= (nt*100)/NT
        if load_flow_completion_percentage == 100
        break; % Exit the loop when i equals 5
        end 
        fid = fopen(progress_file, 'w');
        fprintf(fid, '%.2f\n', load_flow_completion_percentage);  % Write progress to file with seven decimal places
        fclose(fid);
    end
    TSS_MVA_voltage_unbalance_source_code_outage;
    AT_MVA_source_code_up;
    AT_MVA_source_code_down;
    % save_variable;
    variable_text_store_code;
    send_email_notification;
    fid = fopen(progress_file, 'w');
    fprintf(fid, '%.2f\n', 100);  % Write progress to file with seven decimal places
    fclose(fid);
    toc
end