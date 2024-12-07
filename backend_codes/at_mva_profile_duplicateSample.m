% 
% clearvars
format longG
tic
graphics_toolkit ("gnuplot")
%load("variable_load_flow_mum_to_ahm_each_stop.mat");
%AT_input_no=input('Enter the AT number to see its MVA profile');
% AT_input_no=AT_no;
plot(AT_mva_mag(:,AT_input_no))
title(['MVA profile of AT number ',num2str(AT_input_no)])
xlabel('Time (sec)','FontWeight','bold')
ylabel('MVA','FontWeight','bold')


desired_filename = '../Plots/AT_MVA_profile.png';
saveas(gcf, desired_filename);

toc
% whos
