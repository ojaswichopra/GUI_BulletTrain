tic
clc; close all; clearvars; format longG
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
end
TSS_MVA_voltage_unbalance_source_code;

AT_MVA_source_code_down;
AT_MVA_source_code_up;
% save('load_flow_mum_to_sab_double_modified.mat');  
variable_storing_as_text;
% saving the workspace variables generated after executing the load flow of Mumbai to Ahmedabad track 
% with each-stop trains running on the track
toc
