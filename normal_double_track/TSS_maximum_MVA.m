% clc
% clearvars
format longG
tic
%load("variable_load_flow_mum_to_ahm_each_stop.mat");
s_apprant_power_MVA_mag = load("s_apprant_power_MVA_mag.txt");
maximum_mva_TSS=max(s_apprant_power_MVA_mag)
