% clc
% clearvars
format longG
tic
%load("variable_load_flow_mum_to_ahm_each_stop.mat");
Unb = load("Unb.txt");
TSS_input_no=input('Enter the TSS number to see its voltage unbalance profile');

% Create a figure handle
figureHandle = figure;

% Get screen size from root object (0)
screenSize = get(0, 'ScreenSize');

% Set the figure to match the screen size
set(figureHandle, 'Position', screenSize);

plot(Unb(:,TSS_input_no))
title(['Voltage unbalance profile of TSS number ',num2str(TSS_input_no)])
xlabel('Time (sec)','FontWeight','bold')
ylabel('Voltage unbalance (%)','FontWeight','bold')
toc
