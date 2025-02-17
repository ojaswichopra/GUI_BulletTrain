function AT_maximum_MVA_outage(AT_mva_mag_up, AT_mva_mag_down, AT)
    % clc
    % clearvars
    format longG
    tic
    graphics_toolkit ("gnuplot")
    %load("variable_load_flow_mum_to_ahm_each_stop.mat");
    % AT_mva_mag_up = load("AT_mva_mag_up.txt");
    % AT_mva_mag_down = load("AT_mva_mag_down.txt");
    % AT = load("AT.txt");
    maximum_mva_AT_up=max(AT_mva_mag_up);
    maximum_mva_AT_down=max(AT_mva_mag_down);
    % Create a figure handle
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', [100, 100, 1830, 1500]);

    bar(maximum_mva_AT_up)
    xticks(1:1:length(AT))
    xlabel('AT Number','FontWeight','bold')
    ylabel('MAximum MVA','FontWeight','bold')
    title('Maximum MVA for Up track ATs', 'FontWeight', 'bold');

    % Create a figure handle
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', [100, 100, 1830, 1500]);

    bar(maximum_mva_AT_down)
    xticks(1:1:length(AT))
    xlabel('AT Number','FontWeight','bold')
    ylabel('MAximum MVA','FontWeight','bold')
    title('Maximum MVA for Down track ATs', 'FontWeight', 'bold');
    
    desired_filename = '../Plots_oTo_double/AT_maximum_MVA_outage.png';  % Replace 'desired_name' with your file name
    saveas(gcf, desired_filename);

end