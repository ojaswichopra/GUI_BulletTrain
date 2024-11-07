function code_run_outage(TSS, AT, N, N_hr,N_TSS_O,train_time, Vp, Vs, Rp, Xp, Rs, Xs, Zn, short_ckt_MVA, lresistance, lreactance, mresistance, mreactance, row, f, n1, Ch, Mh, nFh, nFd, gh, gd, contact_wire_diameter, Resistance_C, messenger_wire_diameter, Resistance_M1, earth_wire_diameter, Resistance_G, feeder_wire_diameter, Resistance_F, rail_diameter, Resistance_R1)

    format longG
    tic

    % Create a file to store the progress
    progress_file = 'progress_file.txt';

    Line_data_bus_data_bus_type_TSS_outage;        %% calling for data creaction for whole traction network from TSS1 to TSS11%%
    separate_line_data_outage;
    HSR;                    %%loading of data file%%
    impedance_calulation;    %% calculation of impedance for OHE in ohm/km %%
    MODEL_DESIGN;           %% design model for TSS, OHE, AT, TRAIN LOAD%%
    diss=1;
    NT=length(dTSS_T);
    rr=1;
    for nt=1:1:NT
        line_data_Tss1_M;
        bus_data_Tss1;
        DATA_INPUT;             %%loading and reading of input data%%
        YBUST;                   %% Design of System bus teaser system%%
        YBUSM;                  %% Design of System bus Main system%%
        Load_flowT;              %%load Flow teaser winding%%
        Load_flowM;              %%load Flow main winding%%
        line_current_calculation;
        output_display;             %%display of result%%
        for_display_upload;
        percentage_completion= (nt*100)/NT
        if percentage_completion == 100
        break; % Exit the loop when i equals 5
        end 
        fid = fopen(progress_file, 'w');
        fprintf(fid, '%.2f\n', percentage_completion);  % Write progress to file with seven decimal places
        fclose(fid);
    end
    TSS_MVA_voltage_unbalance_source_code_outage;
    variable_text_store_code;
    %save_variable;
    send_email_notification;
    fid = fopen(progress_file, 'w');
    fprintf(fid, '%.2f\n', 100);  % Write progress to file with seven decimal places
    fclose(fid);
    toc

end

