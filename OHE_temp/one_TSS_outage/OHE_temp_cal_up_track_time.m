function OHE_temp_cal_up_track_time(time_instant)
    tic

    load('OHE_temp_up_track_variables_1_TSS_outage.mat')

    % time_instant=input('Enter the time instant (in second) at which OHE temperature along the track needs to be observed: ');

    %array initialization
    track_distance=zeros(d_new(end),1);
    track_temp_c=zeros(d_new(end),1);
    track_temp_r=zeros(d_new(end),1);
    track_temp_f=zeros(d_new(end),1);

    for i_e=1:length(d_new)-1
        % for i_f=(d(i_e)/1000)+1:d(i_e+1)/1000   % for distance in Km
        for i_f=d_new(i_e)+1:d_new(i_e+1)   % for distance in m
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
    xlabel('Distance (km)','FontSize', 10, 'FontWeight','bold')
    ylabel('Contact wire temp (deg cel)','FontSize', 10, 'FontWeight','bold')
    subplot(3,1,2)
    plot(track_distance/1000,track_temp_r,"color",'g')
    xlabel('Distance (km)','FontSize', 10, 'FontWeight','bold')
    ylabel('Rail temp (deg cel)','FontSize', 10, 'FontWeight','bold')
    subplot(3,1,3)
    plot(track_distance/1000,track_temp_f,"color",'b')
    xlabel('Distance (km)','FontSize', 10, 'FontWeight','bold')
    ylabel('Feeder wire temp (deg cel)','FontSize', 10, 'FontWeight','bold')

    allAxes = findall(gcf, 'Type', 'axes'); % Find all axes in the current figure
    set(allAxes, 'XLim', [0 d_new(end)/1000], 'XTick', d_new/1000, 'FontSize',7); % Set font size and weight
    allLines = findall(gcf, 'Type', 'line'); % Find all line objects in the figure
    set(allLines, 'LineWidth', 1.8);            % Set the line width to 1.5
    desired_filename = '../../Plots_OHE/OHE_temp_cal_oTo_up_track_time.png';
    saveas(gcf, desired_filename);
    toc
end