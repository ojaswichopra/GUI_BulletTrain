function AT_maximum_MVA(AT_mva_mag_up, AT_mva_mag_down, AT)
    % clc
    % clearvars
    format longG
    graphics_toolkit ("gnuplot")
    tic
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
    
    subplot(2,1,1)
    bar(maximum_mva_AT_up)
    xticks(1:1:length(AT))
    xlabel('AT Number','FontWeight','bold')
    ylabel('MAximum MVA','FontWeight','bold')
    title('Maximum MVA for Up track ATs', 'FontWeight', 'bold');
    allAxes = findall(gcf, 'Type', 'axes'); % Find all axes in the current figure
    set(allAxes, 'XLim', [0 length(AT)+1],'FontSize', 16, 'FontWeight', 'bold'); % Set font size and weight
    allLines = findall(gcf, 'Type', 'line'); % Find all line objects in the figure
    set(allLines, 'LineWidth', 2);          % Set the line width to 1.5
    subplot(2,1,2)
    bar(maximum_mva_AT_down)
    xticks(1:1:length(AT))
    xlabel('AT Number','FontWeight','bold')
    ylabel('MAximum MVA','FontWeight','bold')
    title('Maximum MVA for Down track ATs', 'FontWeight', 'bold');
    allAxes = findall(gcf, 'Type', 'axes'); % Find all axes in the current figure
    set(allAxes, 'XLim', [0 length(AT)+1], 'FontSize', 16, 'FontWeight', 'bold'); % Set font size and weight
    allLines = findall(gcf, 'Type', 'line'); % Find all line objects in the figure
    set(allLines, 'LineWidth', 2);          % Set the line width to 1.5
    
    desired_filename = '../Plots_normal/AT_maximum_MVA.png';  % Replace 'desired_name' with your file name
    saveas(gcf, desired_filename);
end