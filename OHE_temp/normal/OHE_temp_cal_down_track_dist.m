function OHE_temp_cal_down_track_dist(dist) 
    tic
    graphics_toolkit ("gnuplot")
    load("y.mat")
    load("d.mat")
    load('T_c_track_down.mat');
    load('T_r_track_down.mat');
    load('T_f_track_down.mat');
    load('T_c_initial_down.mat');
    load('T_r_initial_down.mat');
    load('T_f_initial_down.mat');

    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', [100, 100, 1830, 1300]);
       % Set the line width to 1.5

    % dist=input('Enter the distance (in km) at which OHE temperature over entire durations of train simualtion needs to be observed: ');
    time=[0,1:y];  % time (seconds)
    figure('Name','OHE temperature at a particular distance for entire durations of train simulation')
    for ii=1:length(d)-1
        if dist>=d(ii)/1000 && dist<d(ii+1)/1000
            plot(time/60,[T_c_initial,T_c_track((ii-1)*y+1:ii*y)'],"Color",'r');
            hold on
            plot(time/60,[T_r_initial,T_r_track((ii-1)*y+1:ii*y)'],"Color",'g');
            hold on
            plot(time/60,[T_f_initial,T_f_track((ii-1)*y+1:ii*y)'],"Color",'b');
            xlabel('Time (minute)')
            ylabel('Temperature (deg cel)')
            % legend('Contact wire','Rail','Feeder wire','Location','best')
            allAxes = findall(gcf, 'Type', 'axes'); % Find all axes in the current figure
            set(allAxes, 'XLim', [0 time(end)/60], 'FontSize', 12, 'FontWeight', 'bold'); % Set font size and weight
            allLines = findall(gcf, 'Type', 'line'); % Find all line objects in the figure
            set(allLines, 'LineWidth', 1.5);          % Set the line width to 1.5
        end
        legend_handle = legend('Contact wire','Rail','Feeder wire','Location','best');
        set(legend_handle, 'FontSize', 8);  % Reduce font size and ensure single column
    end
    desired_filename = '../../Plots_OHE/OHE_temp_cal_down_track_dist.png';
    saveas(gcf, desired_filename);

    toc
end

