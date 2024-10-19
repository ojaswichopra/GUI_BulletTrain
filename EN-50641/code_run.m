tic
clc; close all; clearvars; format longG
Line_data_bus_data_bus_type_normal;        %% calling for data creation for whole traction network %%
separate_line_data;
separate_line_data_line2;
HSR;                    %%loading of data file%%
impedance_calulation;    %% calculation of impedance for OHE in ohm/km %%
MODEL_DESIGN;           %% design model for TSS, OHE, AT, TRAIN LOAD%%
diss=1;
NT=length(dTSS_T);
rr=1;
for nt=1:1:NT
    line_data_Tss1_M_double;
    bus_data_Tss1_double;
    DATA_INPUT;             %%loading and reading of input data%%
    % Design of System bus teaser system
    % Design of System bus Main system
    if (line_data_T_emp~=1)
        YBUST;
        Load_flowT;              %%load Flow teaser winding%%
    end
    if (line_data_M_emp~=1)
        YBUSM;
        Load_flowM;              %%load Flow main winding%%
    end
    line_current_calculation;
    output_display;             %%display of result%%
    for_display_upload;
    sub_station_current_1;
    percentage_completion= nt*100/NT
end
% saving the required workspace variables generated after executing the load flow of EN-50641 standard track
save('required_variable_load_flow_standard.mat','HS_train_A_F_data','HS_train_F_A_data','FR_train_A_F_data','SUB_train_A_F_data','d','line_data_M_emp','dTSS','y_whole','y','Vc_mag_Td','Vc_ang_Td','VR_mag_Td','VR_ang_Td','pTSS_T','Vf_mag_Td','sub_station_catenary_current','sub_station_feeder_current');
% variable_store_std;
toc
