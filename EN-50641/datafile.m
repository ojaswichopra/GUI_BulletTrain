
%distance in km of all the TSSs measured from station A
TSS = [0];
% TSS = [5 55];

%distance in km of all the ATs measured from station A
AT = [20 40 60];
% AT = [3 13 23 33 43	53 63 73];

% fid=fopen('HS_Train_A_to_F_no_coasting_timetable.txt','r'); % Train 101 & 103
% % header=fscanf(fid,'%s %s %s %s',[4 1]);
% HS_train_A_F_data_1=fscanf(fid,'%f %f %f %f %f %f',[6 1921]);
% HS_train_A_F_data=HS_train_A_F_data_1';
% fclose(fid);
%HS_train_A_F_data=readmatrix("HS_Train_A_to_F_no_coasting_timetable.txt");
HS_train_A_F_data=load("HS_Train_A_to_F_no_coasting_timetable.txt");

% fid=fopen('HS_Train_F_to_A_with_coasting_timetable.txt','r'); % Train 102 & 104
% % header=fscanf(fid,'%s %s %s %s',[4 1]);
% HS_train_F_A_data_1=fscanf(fid,'%f %f %f %f %f %f',[6 1921]);
% HS_train_F_A_data=HS_train_F_A_data_1';
% fclose(fid);
%HS_train_F_A_data=readmatrix("HS_Train_F_to_A_with_coasting_timetable.txt");
HS_train_F_A_data=load("HS_Train_F_to_A_with_coasting_timetable.txt");

% fid=fopen('SUB_Train_A_to_F_timetable.txt','r'); % Train 201
% % header=fscanf(fid,'%s %s %s %s',[4 1]);
% SUB_train_A_F_data_1=fscanf(fid,'%f %f %f %f %f %f',[6 4207]);
% SUB_train_A_F_data=SUB_train_A_F_data_1';
% fclose(fid);
%SUB_train_A_F_data=readmatrix("SUB_Train_A_to_F_timetable.txt");
SUB_train_A_F_data=load("SUB_Train_A_to_F_timetable.txt");

% fid=fopen('FR_Train_A_to_F_with_coasting_timetable.txt','r'); % Train 301
% % header=fscanf(fid,'%s %s %s %s',[4 1]);
% FR_train_A_F_data_1=fscanf(fid,'%f %f %f %f %f %f',[6 3721]);
% FR_train_A_F_data=FR_train_A_F_data_1';
% fclose(fid);
%FR_train_A_F_data=readmatrix("FR_Train_A_to_F_with_coasting_timetable.txt");
FR_train_A_F_data=load("FR_Train_A_to_F_with_coasting_timetable.txt");
