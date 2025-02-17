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
track_TSS_no=length(TSS)-length(N_TSS_O);           %% total no of TSS in track

ntt=length(dTSS_T_up(:,1));            %% total time interval of whole day operation
nt_track=1;
for n_track=1:1:track_TSS_no+2
    if n_track<N_TSS_O(1)
        %         maximum_mva(n_track)=max(s_apprant_power_MVA_mag(:,nt_track));
        maximum_unbalance(n_track)=max(Unb(:,nt_track));
        nt_track=nt_track+1;

    elseif n_track==N_TSS_O(1)|| n_track==N_TSS_O(2)
        %         maximum_mva(n_track)=0;
        maximum_unbalance(n_track)=0;
    else
        %         maximum_mva(n_track)=max(s_apprant_power_MVA_mag(:,nt_track));
        maximum_unbalance(n_track)=max(Unb(:,nt_track));
        nt_track=nt_track+1;
    end
end
% Create a figure handle
figureHandle = figure;

% Get screen size from root object (0)
screenSize = get(0, 'ScreenSize');

% Set the figure to match the screen size
set(figureHandle, 'Position', screenSize);

bar(maximum_unbalance)
xticks(1:1:length(TSS))
xlabel('TSS Number','FontWeight','bold')
ylabel('Percentage Voltage unbalance','FontWeight','bold')
title('Maximum Voltage Unbalnce for all TSS', 'FontWeight', 'bold');
toc