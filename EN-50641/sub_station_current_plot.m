function sub_station_current_plot(sub_station_catenary_current,sub_station_feeder_current)    
    % ##
    % ##
    tic
    % load('required_variable_load_flow_standard.mat')
    %pkg uninstall matgeom
    %pkg install -forge matgeom
    graphics_toolkit ("gnuplot")
    pkg load mapping

    li_len=length(sub_station_catenary_current);
    for li=1:1:li_len
        sub_station_current_catenary_ang(li)=angle(sub_station_catenary_current(li))*180/pi;
        cat_current_angle(li)=wrapTo360(sub_station_current_catenary_ang(li));
        if cat_current_angle(li)>90 && cat_current_angle(li)<270
            sub_station_catenary_current_abs(li)=-abs(sub_station_catenary_current(li))*1000;
        else
            sub_station_catenary_current_abs(li)=abs(sub_station_catenary_current(li))*1000;
        end
        sub_station_current_feeder_ang(li)=angle(sub_station_feeder_current(li))*180/pi;
        fed_current_angle(li)=wrapTo360(sub_station_current_feeder_ang(li));
        if fed_current_angle(li)>90 && fed_current_angle(li)<270
            sub_station_feeder_current_abs(li)=abs(sub_station_feeder_current(li))*1000;
        else
            sub_station_feeder_current_abs(li)=-abs(sub_station_feeder_current(li))*1000;
        end

    end

    % Create a figure handle
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);

    % Plot data with thicker lines and distinguishable colors
    plot(sub_station_catenary_current_abs, 'LineWidth', 2, 'Color', [0 0.4470 0.7410]); % Blue
    hold on;
    plot(sub_station_feeder_current_abs, 'LineWidth', 2, 'Color', [0.8500 0.3250 0.0980]); % Red

    % Add labels with bold text
    xlabel('Time (sec)', 'FontWeight', 'bold', 'FontSize', 16);
    ylabel('Current Magnitude (Amp)', 'FontWeight', 'bold', 'FontSize', 16);

    % Add legend with bold font
    legend({'Contact line total current', 'Negative feeder total current'}, ...
        'FontWeight', 'bold', 'FontSize', 14, 'Location', 'best');

    % Improve grid visibility
    grid on;

    % Set axis font size and line width
    set(gca, 'FontSize', 16, 'LineWidth', 1.5);

    % Set tight axis limits for better visualization
    axis tight;

    % Save the plot with high resolution
    desired_filename = '../Plots/sub_station_current.png';
    saveas(gcf, desired_filename);

    toc
end