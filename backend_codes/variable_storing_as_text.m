tic

folderPath = '../variable_text_files';

% Check if the directory exists; if not, create it
if ~exist(folderPath, 'dir')
    mkdir(folderPath);
end

fileID = fopen('../variable_text_files/dTSS.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(dTSS, 1)
    fprintf(fileID, [repmat('%f ', 1, size(dTSS, 2)) '\n'], dTSS(row, :));
end
% Close the file
fclose(fileID);
%%%
fileID = fopen('../variable_text_files/TSS.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(TSS, 1)
    fprintf(fileID, [repmat('%f ', 1, size(TSS, 2)) '\n'], TSS(row, :));
end
% Close the file
fclose(fileID);
%%%%
fileID = fopen('../variable_text_files/d.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(d, 1)
    fprintf(fileID, [repmat('%f ', 1, size(d, 2)) '\n'], d(row, :));
end
% Close the file
fclose(fileID);
%%%%
fileID = fopen('../variable_text_files/y.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(y, 1)
    fprintf(fileID, [repmat('%f ', 1, size(y, 2)) '\n'], y(row, :));
end
% Close the file
fclose(fileID);
%%%%
fileID = fopen('../variable_text_files/Vc_mag_Td.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Vc_mag_Td, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Vc_mag_Td, 2)) '\n'], Vc_mag_Td(row, :));
end
% Close the file
fclose(fileID);
%%%%
fileID = fopen('../variable_text_files/Vc_ang_Td.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Vc_ang_Td, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Vc_ang_Td, 2)) '\n'], Vc_ang_Td(row, :));
end
% Close the file
fclose(fileID);
%%%%
fileID = fopen('../variable_text_files/VR_mag_Td.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(VR_mag_Td, 1)
    fprintf(fileID, [repmat('%f ', 1, size(VR_mag_Td, 2)) '\n'], VR_mag_Td(row, :));
end
% Close the file
fclose(fileID);
%%%%
fileID = fopen('../variable_text_files/VR_ang_Td.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(VR_ang_Td, 1)
    fprintf(fileID, [repmat('%f ', 1, size(VR_ang_Td, 2)) '\n'], VR_ang_Td(row, :));
end
% Close the file
fclose(fileID);
%%%%
fileID = fopen('../variable_text_files/Vf_mag_Td.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Vf_mag_Td, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Vf_mag_Td, 2)) '\n'], Vf_mag_Td(row, :));
end
% Close the file
fclose(fileID);
%%%%
fileID = fopen('../variable_text_files/Vf_ang_Td.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Vf_ang_Td, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Vf_ang_Td, 2)) '\n'], Vf_ang_Td(row, :));
end
% Close the file
fclose(fileID);
%%%%
fileID = fopen('../variable_text_files/dTSS_T.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(dTSS_T, 1)
    fprintf(fileID, [repmat('%f ', 1, size(dTSS_T, 2)) '\n'], dTSS_T(row, :));
end
% Close the file
fclose(fileID);
%%%
fileID = fopen('../variable_text_files/Ic_line_mag_Td.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Ic_line_mag_Td, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Ic_line_mag_Td, 2)) '\n'], Ic_line_mag_Td(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('../variable_text_files/Ic_line_ang_Td.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Ic_line_ang_Td, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Ic_line_ang_Td, 2)) '\n'], Ic_line_ang_Td(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('../variable_text_files/Ir_line_mag_Td.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Ir_line_mag_Td, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Ir_line_mag_Td, 2)) '\n'], Ir_line_mag_Td(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('../variable_text_files/Ir_line_ang_Td.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Ir_line_ang_Td, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Ir_line_ang_Td, 2)) '\n'], Ir_line_ang_Td(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('../variable_text_files/If_line_mag_Td.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(If_line_mag_Td, 1)
    fprintf(fileID, [repmat('%f ', 1, size(If_line_mag_Td, 2)) '\n'], If_line_mag_Td(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('../variable_text_files/If_line_ang_Td.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(If_line_ang_Td, 1)
    fprintf(fileID, [repmat('%f ', 1, size(If_line_ang_Td, 2)) '\n'], If_line_ang_Td(row, :));
end
% Close the file
fclose(fileID);
%%%
fileID = fopen('../variable_text_files/z1.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(z1, 1)
    fprintf(fileID, [repmat('%f ', 1, size(z1, 2)) '\n'], z1(row, :));
end
% Close the file
fclose(fileID);
%%%

%%%
fileID = fopen('../variable_text_files/Vc_mag_Md.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Vc_mag_Md, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Vc_mag_Md, 2)) '\n'], Vc_mag_Md(row, :));
end
% Close the file
fclose(fileID);
%%%
fileID = fopen('../variable_text_files/Vc_ang_Md.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Vc_ang_Md, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Vc_ang_Md, 2)) '\n'], Vc_ang_Md(row, :));
end
% Close the file
fclose(fileID);
%%%
fileID = fopen('../variable_text_files/VR_mag_Md.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(VR_mag_Md, 1)
    fprintf(fileID, [repmat('%f ', 1, size(VR_mag_Md, 2)) '\n'], VR_mag_Md(row, :));
end
% Close the file
fclose(fileID);
%%%
fileID = fopen('../variable_text_files/VR_ang_Md.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(VR_ang_Md, 1)
    fprintf(fileID, [repmat('%f ', 1, size(VR_ang_Md, 2)) '\n'], VR_ang_Md(row, :));
end
% Close the file
fclose(fileID);
%%%
fileID = fopen('../variable_text_files/Vf_mag_Md.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Vf_mag_Md, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Vf_mag_Md, 2)) '\n'], Vf_mag_Md(row, :));
end
% Close the file
fclose(fileID);
%%%
fileID = fopen('../variable_text_files/Vf_ang_Md.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Vf_ang_Md, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Vf_ang_Md, 2)) '\n'], Vf_ang_Md(row, :));
end
% Close the file
fclose(fileID);
%%%
fileID = fopen('../variable_text_files/dTSS_M.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(dTSS_M, 1)
    fprintf(fileID, [repmat('%f ', 1, size(dTSS_M, 2)) '\n'], dTSS_M(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('../variable_text_files/Ic_line_mag_Md.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Ic_line_mag_Md, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Ic_line_mag_Md, 2)) '\n'], Ic_line_mag_Md(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('../variable_text_files/Ic_line_ang_Md.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Ic_line_ang_Md, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Ic_line_ang_Md, 2)) '\n'], Ic_line_ang_Md(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('../variable_text_files/Ir_line_mag_Md.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Ir_line_mag_Md, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Ir_line_mag_Md, 2)) '\n'], Ir_line_mag_Md(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('../variable_text_files/Ir_line_ang_Md.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Ir_line_ang_Md, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Ir_line_ang_Md, 2)) '\n'], Ir_line_ang_Md(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('../variable_text_files/If_line_mag_Md.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(If_line_mag_Md, 1)
    fprintf(fileID, [repmat('%f ', 1, size(If_line_mag_Md, 2)) '\n'], If_line_mag_Md(row, :));
end
% Close the file
fclose(fileID);
%%%
%%%
fileID = fopen('../variable_text_files/If_line_ang_Md.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(If_line_ang_Md, 1)
    fprintf(fileID, [repmat('%f ', 1, size(If_line_ang_Md, 2)) '\n'], If_line_ang_Md(row, :));
end
% Close the file
fclose(fileID);

   fileID = fopen('../variable_text_files/train_data.txt', 'w');

   %Write data to the file (row-wise)
   for row = 1:size(train_data, 1)
       fprintf(fileID, [repmat('%f ', 1, size(train_data, 2)) '\n'], train_data(row, :));
   end
   % Close the file
   fclose(fileID);

 fileID = fopen('../variable_text_files/AT_mva_mag.txt', 'w');

 %Write data to the file (row-wise)
 for row = 1:size(AT_mva_mag, 1)
     fprintf(fileID, [repmat('%f ', 1, size(AT_mva_mag, 2)) '\n'], AT_mva_mag(row, :));
 end
 % Close the file
 fclose(fileID);
%
fileID = fopen('../variable_text_files/AT.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(AT, 1)
    fprintf(fileID, [repmat('%f ', 1, size(AT, 2)) '\n'], AT(row, :));
end
% Close the file
fclose(fileID);
%%%%
fileID = fopen('../variable_text_files/Unb.txt', 'w');

%Write data to the file (row-wise)
for row = 1:size(Unb, 1)
    fprintf(fileID, [repmat('%f ', 1, size(Unb, 2)) '\n'], Unb(row, :));
end
% Close the file
fclose(fileID);
%%%
 %%%%
 fileID = fopen('../variable_text_files/S_apprant_power_MVA_mag.txt', 'w');

 %Write data to the file (row-wise)
 for row = 1:size(S_apprant_power_MVA_mag, 1)
     fprintf(fileID, [repmat('%f ', 1, size(s_apprant_power_MVA_mag, 2)) '\n'], S_apprant_power_MVA_mag(row, :));
 end
 % Close the file
 fclose(fileID);
 %%%%%
toc












