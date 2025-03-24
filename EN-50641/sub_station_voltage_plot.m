function sub_station_voltage_plot(Vc_mag_Td,Vf_mag_Td)
    % ##
    % ##
    tic
    % load('required_variable_load_flow_standard.mat')
    graphics_toolkit("gnuplot");

    % Create a figure handle
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);

    % Plot data with enhanced line styles and colors
    plot(Vc_mag_Td(:,1), 'LineWidth', 2, 'Color', [0 0.4470 0.7410]); % Blue
    hold on;
    plot(Vf_mag_Td(:,1), 'LineWidth', 2, 'Color', [0.8500 0.3250 0.0980]); % Red

    % Set Y-axis limits
    ylim([27, 28]);

    % Add labels with bold text
    xlabel('Time (sec)', 'FontWeight', 'bold', 'FontSize', 16);
    ylabel('Voltage Magnitude (kV)', 'FontWeight', 'bold', 'FontSize', 16);

    % Add legend with bold font
    legend({'Contact line bus bar voltage', 'Negative feeder bus bar voltage'}, ...
        'FontWeight', 'bold', 'FontSize', 14, 'Location', 'best');

    % Enable grid for better readability
    grid on;

    % Set axis font size and line width
    set(gca, 'FontSize', 16, 'LineWidth', 2);

    % Save the plot with high resolution
    desired_filename = '../Plots/sub_station_voltage.png';
    saveas(gcf, desired_filename);


    toc
end