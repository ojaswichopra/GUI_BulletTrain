function timetable_plot(HS_train_A_F_data,HS_train_F_A_data,FR_train_A_F_data,SUB_train_A_F_data)
    %clc; close all; clearvars;
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

    % ##fid=fopen('HS_Train_F_to_A_with_coasting_timetable.txt','r');  % train 102 & 104
    % ##% header=fscanf(fid,'%s %s %s %s',[4 1]);
    % ##train_102_104_HS_data_1=fscanf(fid,'%f %f %f %f %f %f',[6 1921]);
    % ##train_102_104_HS_data=train_102_104_HS_data_1';
    % ##fclose(fid);
    %train_102_104_HS_data=load('HS_Train_F_to_A_with_coasting_timetable.txt');
    train_102_104_HS_data=HS_train_F_A_data;

    % ##fid=fopen('FR_Train_A_to_F_with_coasting_timetable.txt','r');  % train 301
    % ##% header=fscanf(fid,'%s %s %s %s',[4 1]);
    % ##train_301_FR_data_1=fscanf(fid,'%f %f %f %f %f %f',[6 3721]);
    % ##train_301_FR_data=train_301_FR_data_1';
    % ##fclose(fid);
    %train_301_FR_data=load('FR_Train_A_to_F_with_coasting_timetable.txt');
    train_301_FR_data=FR_train_A_F_data;

    % ##fid=fopen('SUB_Train_A_to_F_timetable.txt','r');  % train 201
    % ##% header=fscanf(fid,'%s %s %s %s',[4 1]);
    % ##train_201_SUB_data_1=fscanf(fid,'%f %f %f %f %f %f',[6 4207]);
    % ##train_201_SUB_data=train_201_SUB_data_1';
    % ##fclose(fid);
    %train_201_SUB_data=load('SUB_Train_A_to_F_timetable.txt');
    train_201_SUB_data=SUB_train_A_F_data;

    % time=train_101_HS_data(:,1);  % time (sec) of train 101
    time=train_101_103_HS_data(:,1)/60;  % time (min) of train 101
    speed=train_101_103_HS_data(:,2);  % speed (km/hr) of train 101
    distance=train_101_103_HS_data(:,3);  % distance (km) of train 101
    power=train_101_103_HS_data(:,4);   % power (MW) of train 101
    acceleration=train_101_103_HS_data(:,5);  % acceleration (m/sec^2) of train 101
    tractive_effort=train_101_103_HS_data(:,6);  % tractive effort/braking force (kN) of train 101

    % time_103=time+30*60;  % time (sec) of train 103
    time_103=time+30;  % time (min) of train 103
    distance_103=distance;  % distance (km) of train 103

    time_102=10+(train_102_104_HS_data(:,1)/60); % time (min) of train 102
    distance_102=100-train_102_104_HS_data(:,3);  % distance (km) of train 102 measured from station A
    time_104=time_102+30;  % time (min) of train 104
    distance_104=distance_102;  % distance (km) of train 104 measured from station A

    time_201=(train_201_SUB_data(:,1)/60)+5;  % time (min) of train 201
    distance_201=train_201_SUB_data(:,3);   % distance (km) of train 201 measured from station A

    time_301=(train_301_FR_data(:,1)/60)+35;  % time (min) of train 301
    distance_301=train_301_FR_data(:,3);   % distance (km) of train 301 measured from station A

    % Create a figure handle
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);

    plot(distance,time,'LineWidth',1)          % timetable plot of train 101
    set(gca, 'YDir','reverse')
    hold on
    plot(distance_102,time_102,'LineWidth',1)  % timetable plot of train 102
    set(gca, 'YDir','reverse')
    hold on
    plot(distance_103,time_103,'LineWidth',1)  % timetable plot of train 103
    set(gca, 'YDir','reverse')
    hold on
    plot(distance_104,time_104,'LineWidth',1)  % timetable plot of train 104
    set(gca, 'YDir','reverse')
    hold on
    plot(distance_201,time_201,'LineWidth',1)  % timetable plot of train 201
    set(gca, 'YDir','reverse')
    hold on
    plot(distance_301,time_301,'LineWidth',1)  % timetable plot of train 301
    set(gca, 'YDir','reverse')
    xlim([0 100.02])
    legend('Train 101','Train 102','Train 103','Train 104','Train 201','Train 301','FontWeight','bold','NumColumns',2,'Location','southwest')
    xlabel('Distance (km)','FontWeight','bold')
    ylabel('Time (minute)','FontWeight','bold')
    grid on
    set(gca, 'FontSize', 16);
    desired_filename = '../Plots/timetable_plot.png';
    saveas(gcf, desired_filename);
end