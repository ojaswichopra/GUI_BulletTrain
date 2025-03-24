function Induced_voltage_victim_time(time_instant)
    tic
    graphics_toolkit ("gnuplot")
    load('Induced_voltage_variables_1_TSS_outage.mat')

    % time_instant=input('Enter the time instant (in second) at which induced voltage along the track needs to be observed: ');
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', [100, 100, 1830, 1300]);
    %array initialization
    track_distance=zeros(d_new(end),1);
    track_V=zeros(d_new(end),1);

    for i_e=1:length(d_new)-1
        for i_f=d_new(i_e)+1:d_new(i_e+1)
            track_distance(i_f,1)=i_f;   % distance (m)
            track_V(i_f,1)=V_track((i_e-1)*y+time_instant);  % induced voltage magnitude (kV)
        end
    end

    figure('Name','Induced voltage along the track at a particular time instant')
    plot(track_distance/1000,track_V)
    xlabel('Distance (km)','FontSize', 10, 'FontWeight','bold')
    ylabel('Induced voltage magnitude (kV)','FontSize', 10, 'FontWeight','bold')
    allAxes = findall(gcf, 'Type', 'axes'); % Find all axes in the current figure
    set(allAxes, 'XLim', [0 d_new(end)/1000], 'XTick', d_new/1000, 'FontSize', 8'); % Set font size and weight
    allLines = findall(gcf, 'Type', 'line'); % Find all line objects in the figure
    set(allLines, 'LineWidth', 2);          % Set the line width to 1.5
    desired_filename = '../../Plots_IVV/Induced_voltage_victim_time_oTo.png';
    saveas(gcf, desired_filename);
    toc
end