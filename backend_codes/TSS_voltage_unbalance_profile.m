function TSS_voltage_unbalance_profile(TSS_input_no, Unb)
    % 
    % clearvars
    format longG
    tic
    graphics_toolkit ("gnuplot")
    % load("variable_load_flow_mum_to_ahm_each_stop.mat");
    % TSS_input_no=input('Enter the TSS number to see its voltage unbalance profile');
    % Create a figure
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);

    % Plot the voltage unbalance profile
    plot(Unb(:, TSS_input_no), 'LineWidth', 2, 'Color', [0 0.4470 0.7410]); % Blue line for clarity

    % Add title with enhanced styling
    title(['Voltage Unbalance Profile of TSS Number ', num2str(TSS_input_no)], ...
        'FontWeight', 'bold', 'FontSize', 14);

    % Add axis labels with improved formatting
    xlabel('Time (sec)', 'FontWeight', 'bold', 'FontSize', 12);
    ylabel('Voltage Unbalance (%)', 'FontWeight', 'bold', 'FontSize', 12);

    % Customize axis properties for clean appearance
    set(gca, 'FontSize', 10, 'LineWidth', 1.2, 'Box', 'on');

    % Turn off the grid for a minimalistic look
    grid off;

    % Set the figure's background color to white
    set(gcf, 'Color', 'w');


    desired_filename = '../Plots/TSS_voltage_unbalance_profile.png';
    saveas(gcf, desired_filename);
    toc
end