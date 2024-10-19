fileID = fopen('HS_train_A_F_data.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(HS_train_A_F_data, 1)
    fprintf(fileID, [repmat('%f ', 1, size(HS_train_A_F_data, 2)) '\n'], HS_train_A_F_data(row, :));
end
% Close the file
fclose(fileID);
%%%
fileID = fopen('d.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(d, 1)
    fprintf(fileID, [repmat('%f ', 1, size(d, 2)) '\n'], d(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('line_data_M_emp.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(line_data_M_emp, 1)
    fprintf(fileID, [repmat('%f ', 1, size(line_data_M_emp, 2)) '\n'], line_data_M_emp(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('dTSS.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(dTSS, 1)
    fprintf(fileID, [repmat('%f ', 1, size(dTSS, 2)) '\n'], dTSS(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('y_whole.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(y_whole, 1)
    fprintf(fileID, [repmat('%f ', 1, size(y_whole, 2)) '\n'], y_whole(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('y.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(y, 1)
    fprintf(fileID, [repmat('%f ', 1, size(y, 2)) '\n'], y(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('Vc_mag_Td.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Vc_mag_Td, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Vc_mag_Td, 2)) '\n'], Vc_mag_Td(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('Vc_ang_Td.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Vc_ang_Td, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Vc_ang_Td, 2)) '\n'], Vc_ang_Td(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('VR_mag_Td.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(VR_mag_Td, 1)
    fprintf(fileID, [repmat('%f ', 1, size(VR_mag_Td, 2)) '\n'], VR_mag_Td(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('VR_ang_Td.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(VR_ang_Td, 1)
    fprintf(fileID, [repmat('%f ', 1, size(VR_ang_Td, 2)) '\n'], VR_ang_Td(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('pTSS_T.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(pTSS_T, 1)
    fprintf(fileID, [repmat('%f ', 1, size(pTSS_T, 2)) '\n'], pTSS_T(row, :));
end
% Close the file
fclose(fileID);
%%%
if (line_data_M_emp~=1)
    %%%
    fileID = fopen('Vc_mag_Md.txt', 'w');

    %Write data to the file (row-wise)
    for row = 1:size(Vc_mag_Md, 1)
        fprintf(fileID, [repmat('%f ', 1, size(Vc_mag_Md, 2)) '\n'], Vc_mag_Md(row, :));
    end
    % Close the file
    fclose(fileID);
    %%%
    %%%
    fileID = fopen('Vc_ang_Md.txt', 'w');

    %Write data to the file (row-wise)
    for row = 1:size(Vc_ang_Md, 1)
        fprintf(fileID, [repmat('%f ', 1, size(Vc_ang_Md, 2)) '\n'], Vc_ang_Md(row, :));
    end
    % Close the file
    fclose(fileID);
    %%%
    %%%
    fileID = fopen('VR_mag_Md.txt', 'w');

    %Write data to the file (row-wise)
    for row = 1:size(VR_mag_Md, 1)
        fprintf(fileID, [repmat('%f ', 1, size(VR_mag_Md, 2)) '\n'], VR_mag_Md(row, :));
    end
    % Close the file
    fclose(fileID);
    %%%
    %%%
    fileID = fopen('VR_ang_Md.txt', 'w');

    %Write data to the file (row-wise)
    for row = 1:size(VR_ang_Md, 1)
        fprintf(fileID, [repmat('%f ', 1, size(VR_ang_Md, 2)) '\n'], VR_ang_Md(row, :));
    end
    % Close the file
    fclose(fileID);
    %%%
end
%%%
fileID = fopen('Vf_mag_Td.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Vf_mag_Td, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Vf_mag_Td, 2)) '\n'], Vf_mag_Td(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('sub_station_catenary_current.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(sub_station_catenary_current, 1)
    fprintf(fileID, [repmat('%f ', 1, size(sub_station_catenary_current, 2)) '\n'], sub_station_catenary_current(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('sub_station_feeder_current.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(sub_station_feeder_current, 1)
    fprintf(fileID, [repmat('%f ', 1, size(sub_station_feeder_current, 2)) '\n'], sub_station_feeder_current(row, :));
end
% Close the file
fclose(fileID);
%%%