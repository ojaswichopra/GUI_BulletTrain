% clc
% clearvars
format longG
tic
load("variable_load_flow_mum_to_ahm_each_stop.mat");
TSS_input_no=input('Enter the TSS number to see its MVA profile');
plot(s_apprant_power_MVA_mag(:,TSS_input_no))
title(['MVA profile of TSS number ',num2str(TSS_input_no)])
xlabel('Time (sec)','FontWeight','bold')
ylabel('MVA','FontWeight','bold')
toc