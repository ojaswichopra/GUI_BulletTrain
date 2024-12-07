function speed_TE_plot(HS_train_A_F_data)
    %; close all; clearvars;
    format longG;
    graphics_toolkit ("gnuplot")
    % load('required_variable_load_flow_standard.mat')

    % ##fid=fopen('HS_Train_A_to_F_no_coasting_timetable.txt','r'); % train 101 & 103
    % ##% header=fscanf(fid,'%s %s %s %s',[4 1]);
    % ##train_101_103_HS_data_1=fscanf(fid,'%f %f %f %f %f %f',[6 1921]);
    % ##train_101_103_HS_data=train_101_103_HS_data_1';
    % ##fclose(fid);
    %train_101_103_HS_data=load('HS_Train_A_to_F_no_coasting_timetable.txt');
    train_101_103_HS_data=HS_train_A_F_data;

    speed=train_101_103_HS_data(:,2);  % speed (km/hr) of train 101
    distance=train_101_103_HS_data(:,3);  % distance (km) of train 101
    tractive_effort=train_101_103_HS_data(:,6);  % tractive effort/braking force (kN) of train 101

    % Create a figure handle
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);

    plot(distance,speed,'Color','b','LineWidth',1)
    hold on
    plot(distance,tractive_effort,'Color','k','LineWidth',1)
    xlabel('Distance (km)','FontWeight','bold')
    ylabel('Speed and Tractive Effort','FontWeight','bold')
    % xlim([0 100.5])
    ylim([-300 300])
    legend('Speed (km/h)','Tractive effort electric (kN)','FontWeight','bold')
    set(gca, 'FontSize', 16);
    desired_filename = '../Plots/speed_te_plot.png';
    saveas(gcf, desired_filename);
end