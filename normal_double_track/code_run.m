function code_run(TSS, AT, SP, Vp, Vs, Rp, Xp, Rs, Xs, Zn, short_ckt_MVA, lresistance, lreactance, mresistance, mreactance, row, f, n1, Ch, Mh, nFh, nFd, gh, gd, contact_wire_diameter, Resistance_C, messenger_wire_diameter, Resistance_M1, earth_wire_diameter, Resistance_G, feeder_wire_diameter, Resistance_F, rail_diameter, Resistance_R1)
  
    format longG

     % Create a file to store the progress
    progress_file = 'progress_file.txt';
    Line_data_bus_data_bus_type_normal;        %% calling for data creaction for whole traction network from TSS1 to TSS11%%
    separate_line_data_up;
    separate_line_data_down;
    HSR;                    %%loading of data file%%
    impedance_calulation;    %% calculation of impedance for OHE in ohm/km %%
    MODEL_DESIGN;           %% design model for TSS, OHE, AT, TRAIN LOAD%%
    NT=length(dTSS_T_up);
    for nt=1:1:NT
        line_data_Tss_double;
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
        percentage_completion_load_flow=(nt*100)/NT   %percentage of total computation completed
        if percentage_completion_load_flow == 100
        break; % Exit the loop when i equals 5
        end 
        fid = fopen(progress_file, 'w');
        fprintf(fid, '%.2f\n', percentage_completion_load_flow);  % Write progress to file with seven decimal places
        fclose(fid);
    end
    TSS_MVA_voltage_unbalance_source_code;

    AT_MVA_source_code_down;
    AT_MVA_source_code_up;
    % save('load_flow_mum_to_sab_double_modified.mat');  
    variable_storing_as_text;
    send_email_notification;
    % saving the workspace variables generated after executing the load flow of Mumbai to Ahmedabad track 
    % with each-stop trains running on the track
    fid = fopen(progress_file, 'w');
    fprintf(fid, '%.2f\n', 100);  % Write progress to file with seven decimal places
    fclose(fid);
    toc

end