<<<<<<< HEAD
% clc
% clearvars
format longG
tic
load("variable_load_flow_mum_to_ahm_each_stop.mat");
TSS_input_no=input('Enter the TSS number to see its voltage unbalance profile');
plot(Unb(:,TSS_input_no))
title(['Voltage unbalance profile of TSS number ',num2str(TSS_input_no)])
xlabel('Time (sec)','FontWeight','bold')
ylabel('Voltage unbalance (%)','FontWeight','bold')
=======
% clc
% clearvars
format longG
tic
load("variable_load_flow_mum_to_ahm_each_stop.mat");
TSS_input_no=input('Enter the TSS number to see its voltage unbalance profile');
plot(Unb(:,TSS_input_no))
title(['Voltage unbalance profile of TSS number ',num2str(TSS_input_no)])
xlabel('Time (sec)','FontWeight','bold')
ylabel('Voltage unbalance (%)','FontWeight','bold')
>>>>>>> a6b21b859934a8cd5093e7439821c631fce9c22b
toc