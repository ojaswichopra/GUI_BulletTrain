tic
close all
clear all
format long
Line_data_bus_data_bus_type_2_adjacent_TSS_outage;        %% calling for data creaction for whole traction network from TSS1 to TSS11%%
separate_line_data_adjecent_outage;
HSR; %%loading of data file%%
impedance_calulation;    %% calculation of impedance for OHE in ohm/km %%
MODEL_DESIGN;           %% design model for TSS, OHE, AT, TRAIN LOAD%%
NT=length(dTSS_T);

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
end
TSS_MVA_voltage_unbalance_source_code_outage;
variable_text_store_code;
save_variable;
toc
