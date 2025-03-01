function OHE_temp_cal_up_track_time(time_instant)
% clc;
% clearvars;
    tic

    load('OHE_temp_up_track_variables.mat')

    % time_instant=input('Enter the time instant (in second) at which OHE temperature along the track needs to be observed: ');
    % time_instant=10000;

    %array initialization
    track_distance=zeros(d(end),1);
    track_temp_c=zeros(d(end),1);
    track_temp_r=zeros(d(end),1);
    track_temp_f=zeros(d(end),1);

    for i_e=1:length(d)-1
        % for i_f=(d(i_e)/1000)+1:d(i_e+1)/1000   % for distance in Km
        for i_f=d(i_e)+1:d(i_e+1)   % for distance in m
            track_distance(i_f,1)=i_f;
            track_temp_c(i_f,1)=T_c_track_up((i_e-1)*y+time_instant);
            track_temp_r(i_f,1)=T_r_track_up((i_e-1)*y+time_instant);
            track_temp_f(i_f,1)=T_f_track_up((i_e-1)*y+time_instant);
        end
    end
    
    graphics_toolkit ("gnuplot")
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', [100, 100, 1830, 1300]);
    figure('Name','OHE Temperature Along the Track at a Particular Time Instant')
    subplot(3,1,1)
    plot(track_distance/1000,track_temp_c,"color",'r')
    xlabel('Distance (km)')
    ylabel('Contact wire temp (deg cel)')
    subplot(3,1,2)
    plot(track_distance/1000,track_temp_r,"color",'g')
    xlabel('Distance (km)')
    ylabel('Rail temp (deg cel)')
    subplot(3,1,3)
    plot(track_distance/1000,track_temp_f,"color",'b')
    xlabel('Distance (km)')
    ylabel('Feeder wire temp (deg cel)')

    allAxes = findall(gcf, 'Type', 'axes'); % Find all axes in the current figure
    set(allAxes, 'XLim', [0 d(end)/1000], 'XTick', d/1000, 'FontSize', 12, 'FontWeight', 'bold'); % Set font size and weight
    allLines = findall(gcf, 'Type', 'line'); % Find all line objects in the figure
    set(allLines, 'LineWidth', 1.5);          % Set the line width to 1.5
    desired_filename = '../../Plots_OHE/OHE_temp_cal_oTo_up_track_time.png';
    saveas(gcf, desired_filename);
    toc
end