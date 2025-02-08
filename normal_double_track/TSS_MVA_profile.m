function TSS_MVA_profile(TSS_input_no, s_apprant_power_MVA_mag)
   % clc
    % clearvars
    format longG
    tic
    % load("load_flow_mum_to_sab_double_today.mat");
    % s_apprant_power_MVA_mag = load("s_apprant_power_MVA_mag.txt");
    % TSS_input_no=input('Enter the TSS number to see its MVA profile');

    % Create a figure handle
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', [100, 100, 1830, 1500]);

    plot(s_apprant_power_MVA_mag(:,TSS_input_no))
    title(['MVA profile of TSS number ',num2str(TSS_input_no)])
    xlabel('Time (sec)','FontWeight','bold')
    ylabel('MVA','FontWeight','bold')

    desired_filename = '../Plots_normal/TSS_MVA_profile.png';  % Replace 'desired_name' with your file name
    saveas(gcf, desired_filename);

    toc
end

