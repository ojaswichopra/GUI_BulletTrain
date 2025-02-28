function Induced_voltage_victim_dist(dist)
    tic
    graphics_toolkit ("gnuplot")
    load('Induced_voltage_variables_1_TSS_outage.mat')
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', [100, 100, 1830, 1300]);
    % dist=input('Enter the distance (in km) at which induced voltage over entire durations of train simualtion needs to be observed: ');
    time=1:y;  % time (seconds)

    figure('Name','Induced voltage at a particular distance for entire durations of train simulation')
    for ii=1:length(d_new)-1
        if dist>=d_new(ii)/1000 && dist<d_new(ii+1)/1000
            plot(time/60,V_track((ii-1)*y+1:ii*y));
            xlabel('Time (minute)')
            ylabel('Induced voltage magnitude (kV)')
            allAxes = findall(gcf, 'Type', 'axes'); % Find all axes in the current figure
            set(allAxes, 'XLim', [0 time(end)/60], 'FontSize', 8); % Set font size and weight
            allLines = findall(gcf, 'Type', 'line'); % Find all line objects in the figure
            set(allLines, 'LineWidth', 1.2);          % Set the line width to 1.5
        end
    end
    desired_filename = '../../Plots_IVV/Induced_voltage_victim_dist_oTo.png';
    saveas(gcf, desired_filename);
    toc
end