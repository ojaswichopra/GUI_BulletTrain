% clc
% clearvars
format longG
tic
% load("load_flow_mum_to_sab_double_today.mat");
AT_mva_mag_up = load("AT_mva_mag_up.txt");
AT_mva_mag_down = load("AT_mva_mag_down.txt");
AT_UP_down=input('Enter 1 for UP track AT MVA profile and 2 for Down track AT MVA profile');
AT_input_no=input('Enter the AT number to see its MVA profile');
if AT_UP_down==1
    % Create a figure handle
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);

    plot(AT_mva_mag_up(:,AT_input_no))
    title(['MVA profile of UP AT number ',num2str(AT_input_no)])
    xlabel('Time (sec)','FontWeight','bold')
    ylabel('MVA','FontWeight','bold')
else
    % Create a figure handle
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);

    plot(AT_mva_mag_down(:,AT_input_no))
    title(['MVA profile of down AT number ',num2str(AT_input_no)])
    xlabel('Time (sec)','FontWeight','bold')
    ylabel('MVA','FontWeight','bold')
end

toc
