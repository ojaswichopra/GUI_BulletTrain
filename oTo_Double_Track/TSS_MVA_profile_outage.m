% clc
% clearvars
format longG
tic
% load("load_flow_mum_to_sab_double_today.mat");
TSS=load("TSS.txt");
N_TSS_O=load("N_TSS_O.txt");
dTSS_T_up=load("dTSS_T_up.txt");

Unb=load("Unb.txt");
tt_time=load("tt_time.txt");
s_apprant_power_MVA_mag = load("s_apprant_power_MVA_mag.txt");
TSS_input_no=input('Enter the TSS number to see its MVA profile');
track_TSS_no=length(TSS)-length(N_TSS_O);           %% total no of TSS in track

if TSS_input_no<N_TSS_O
    nn_track_name=TSS_input_no;
%     plot(tt_time/60,s_apprant_power_MVA_mag(:,TSS_input_no))
elseif TSS_input_no==N_TSS_O
    outage_TSS_condition=zeros(length(s_apprant_power_MVA_mag(:,1)),1);
    nn_track_name=TSS_input_no;
%     plot(tt_time/60,outage_TSS_condition(:,1));
else
    TSS_input_no=TSS_input_no-1;
    nn_track_name=TSS_input_no+1;
%     plot(tt_time/60,s_apprant_power_MVA_mag(:,TSS_input_no))
end


% Create a figure handle
figureHandle = figure;

% Get screen size from root object (0)
screenSize = get(0, 'ScreenSize');

% Set the figure to match the screen size
set(figureHandle, 'Position', screenSize);

plot(tt_time/60,s_apprant_power_MVA_mag(:,TSS_input_no))
title(['MVA profile of TSS number ',num2str(nn_track_name)])
xlabel('Time (min)','FontWeight','bold')
ylabel('MVA','FontWeight','bold')
toc