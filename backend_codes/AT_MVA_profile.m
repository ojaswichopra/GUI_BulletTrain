<<<<<<< HEAD
% clc
% clearvars
format longG
tic
% load("variable_load_flow_mum_to_ahm_each_stop.mat");
AT_input_no=input('Enter the AT number to see its MVA profile');
plot(AT_mva_mag(:,AT_input_no))
title(['MVA profile of AT number ',num2str(AT_input_no)])
xlabel('Time (sec)','FontWeight','bold')
ylabel('MVA','FontWeight','bold')
=======
% clc
% clearvars
format longG
tic
load("variable_load_flow_mum_to_ahm_each_stop.mat");
AT_input_no=input('Enter the AT number to see its MVA profile');
plot(AT_mva_mag(:,AT_input_no))
title(['MVA profile of AT number ',num2str(AT_input_no)])
xlabel('Time (sec)','FontWeight','bold')
ylabel('MVA','FontWeight','bold')
>>>>>>> a6b21b859934a8cd5093e7439821c631fce9c22b
toc