% clc
% clearvars
format longG
tic
% load("load_flow_mum_to_sab_double_today.mat");
s_apprant_power_MVA_mag = load("s_apprant_power_MVA_mag.txt");
TSS_input_no=input('Enter the TSS number to see its MVA profile');

% Create a figure handle
figureHandle = figure;

% Get screen size from root object (0)
screenSize = get(0, 'ScreenSize');

% Set the figure to match the screen size
set(figureHandle, 'Position', screenSize);

plot(s_apprant_power_MVA_mag(:,TSS_input_no))
title(['MVA profile of TSS number ',num2str(TSS_input_no)])
xlabel('Time (sec)','FontWeight','bold')
ylabel('MVA','FontWeight','bold')
toc
