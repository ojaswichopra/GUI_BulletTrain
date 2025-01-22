function AT_MVA_profile(AT_input_no, AT_mva_mag)
    % 
    % clearvars
    format longG
    tic
    graphics_toolkit ("gnuplot")
    %load("variable_load_flow_mum_to_ahm_each_stop.mat");
    %AT_input_no=input('Enter the AT number to see its MVA profile');
    % AT_input_no=AT_no;

     % Create a figure
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure size to match the screen
    set(figureHandle, 'Position', screenSize);

    % Plot the MVA profile for the selected TSS
    plot(AT_mva_mag(:, AT_input_no), 'LineWidth', 2, 'Color', [0 0.4470 0.7410]); % Blue line

    % Add title and labels with enhanced styling
    title(['MVA profile of AT number ', num2str(AT_input_no)], 'FontWeight', 'bold', 'FontSize', 14);
    xlabel('Time (sec)', 'FontWeight', 'bold', 'FontSize', 12);
    ylabel('MVA', 'FontWeight', 'bold', 'FontSize', 12);

    % Customize axis properties for a clean appearance
    set(gca, 'FontSize', 10, 'LineWidth', 1.2, 'Box', 'on');

    % Set figure background color to white
    set(gcf, 'Color', 'w');

    desired_filename = '../Plots/AT_MVA_profile.png';
    saveas(gcf, desired_filename);

    toc
    % whos
end

