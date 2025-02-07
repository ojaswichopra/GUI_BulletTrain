folder = '../normal_text_files';
% Check if the folder exists, and if not, create it
if ~exist(folder, 'dir')
    mkdir(folder);
end

fileID = fopen('../normal_text_files/dTSS_up.txt', 'w');
for row = 1:size(dTSS_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(dTSS_up, 2)) '\n'], dTSS_up(row, :));
end
fclose(fileID);
fileID = fopen('../normal_text_files/dTSS_down.txt', 'w');
for row = 1:size(dTSS_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(dTSS_down, 2)) '\n'], dTSS_down(row, :));
end
fclose(fileID);



fileID = fopen('../normal_text_files/dTSS_T_up.txt', 'w');
for row = 1:size(dTSS_T_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(dTSS_T_up, 2)) '\n'], dTSS_T_up(row, :));
end
fclose(fileID);
fileID = fopen('../normal_text_files/dTSS_T_down.txt', 'w');
for row = 1:size(dTSS_T_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(dTSS_T_down, 2)) '\n'], dTSS_T_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/dTSS_M_up.txt', 'w');
for row = 1:size(dTSS_M_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(dTSS_M_up, 2)) '\n'], dTSS_M_up(row, :));
end
fclose(fileID);
fileID = fopen('../normal_text_files/dTSS_M_down.txt', 'w');
for row = 1:size(dTSS_M_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(dTSS_M_down, 2)) '\n'], dTSS_M_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/TSS.txt', 'w');
for row = 1:size(TSS, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(TSS, 2)) '\n'], TSS(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/d.txt', 'w');
for row = 1:size(d, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(d, 2)) '\n'], d(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/y.txt', 'w');
for row = 1:size(y, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(y, 2)) '\n'], y(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vc_mag_Td_down.txt', 'w');
for row = 1:size(Vc_mag_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_mag_Td_down, 2)) '\n'], Vc_mag_Td_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vc_ang_Td_down.txt', 'w');
for row = 1:size(Vc_ang_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_ang_Td_down, 2)) '\n'], Vc_ang_Td_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/VR_mag_Td_down.txt', 'w');
for row = 1:size(VR_mag_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_mag_Td_down, 2)) '\n'], VR_mag_Td_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/VR_ang_Td_down.txt', 'w');
for row = 1:size(VR_ang_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_ang_Td_down, 2)) '\n'], VR_ang_Td_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vf_mag_Td_down.txt', 'w');
for row = 1:size(Vf_mag_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_mag_Td_down, 2)) '\n'], Vf_mag_Td_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vf_ang_Td_down.txt', 'w');
for row = 1:size(Vf_ang_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_ang_Td_down, 2)) '\n'], Vf_ang_Td_down(row, :));
end
fclose(fileID);

%%
fileID = fopen('../normal_text_files/Vc_mag_Td_up.txt', 'w');
for row = 1:size(Vc_mag_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_mag_Td_up, 2)) '\n'], Vc_mag_Td_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vc_ang_Td_up.txt', 'w');
for row = 1:size(Vc_ang_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_ang_Td_up, 2)) '\n'], Vc_ang_Td_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/VR_mag_Td_up.txt', 'w');
for row = 1:size(VR_mag_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_mag_Td_up, 2)) '\n'], VR_mag_Td_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/VR_ang_Td_up.txt', 'w');
for row = 1:size(VR_ang_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_ang_Td_up, 2)) '\n'], VR_ang_Td_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vf_mag_Td_up.txt', 'w');
for row = 1:size(Vf_mag_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_mag_Td_up, 2)) '\n'], Vf_mag_Td_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vf_ang_Td_up.txt', 'w');
for row = 1:size(Vf_ang_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_ang_Td_up, 2)) '\n'], Vf_ang_Td_up(row, :));
end
fclose(fileID);
%%


% fileID = fopen('../normal_text_files/dTSS_T.txt', 'w');
% for row = 1:size(dTSS_T, 1)
%     fprintf(fileID, [repmat('%.16g ', 1, size(dTSS_T, 2)) '\n'], dTSS_T(row, :));
% end
% fclose(fileID);

fileID = fopen('../normal_text_files/Ic_line_mag_Td_up.txt', 'w');
for row = 1:size(Ic_line_mag_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_mag_Td_up, 2)) '\n'], Ic_line_mag_Td_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ic_line_ang_Td_up.txt', 'w');
for row = 1:size(Ic_line_ang_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_ang_Td_up, 2)) '\n'], Ic_line_ang_Td_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ir_line_mag_Td_up.txt', 'w');
for row = 1:size(Ir_line_mag_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_mag_Td_up, 2)) '\n'], Ir_line_mag_Td_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ir_line_ang_Td_up.txt', 'w');
for row = 1:size(Ir_line_ang_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_ang_Td_up, 2)) '\n'], Ir_line_ang_Td_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/If_line_mag_Td_up.txt', 'w');
for row = 1:size(If_line_mag_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_mag_Td_up, 2)) '\n'], If_line_mag_Td_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/If_line_ang_Td_up.txt', 'w');
for row = 1:size(If_line_ang_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_ang_Td_up, 2)) '\n'], If_line_ang_Td_up(row, :));
end
fclose(fileID);

%%
fileID = fopen('../normal_text_files/Ic_line_mag_Td_down.txt', 'w');
for row = 1:size(Ic_line_mag_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_mag_Td_down, 2)) '\n'], Ic_line_mag_Td_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ic_line_ang_Td_down.txt', 'w');
for row = 1:size(Ic_line_ang_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_ang_Td_down, 2)) '\n'], Ic_line_ang_Td_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ir_line_mag_Td_down.txt', 'w');
for row = 1:size(Ir_line_mag_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_mag_Td_down, 2)) '\n'], Ir_line_mag_Td_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ir_line_ang_Td_down.txt', 'w');
for row = 1:size(Ir_line_ang_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_ang_Td_down, 2)) '\n'], Ir_line_ang_Td_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/If_line_mag_Td_down.txt', 'w');
for row = 1:size(If_line_mag_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_mag_Td_down, 2)) '\n'], If_line_mag_Td_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/If_line_ang_Td_down.txt', 'w');
for row = 1:size(If_line_ang_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_ang_Td_down, 2)) '\n'], If_line_ang_Td_down(row, :));
end
fclose(fileID);
%%


% Open the file for writing complex variable z1
fileID = fopen('../normal_text_files/z1.txt', 'w');

% Write real and imaginary parts
for row = 1:size(z1, 1)
    fprintf(fileID, [repmat('%.16g, %.16g ', 1, size(z1, 2)) '\n'], real(z1(row, :)), imag(z1(row, :)));
end

% Close the file
fclose(fileID);

fileID = fopen('../normal_text_files/Vc_mag_Md_up.txt', 'w');
for row = 1:size(Vc_mag_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_mag_Md_up, 2)) '\n'], Vc_mag_Md_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vc_ang_Md_up.txt', 'w');
for row = 1:size(Vc_ang_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_ang_Md_up, 2)) '\n'], Vc_ang_Md_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/VR_mag_Md_up.txt', 'w');
for row = 1:size(VR_mag_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_mag_Md_up, 2)) '\n'], VR_mag_Md_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/VR_ang_Md_up.txt', 'w');
for row = 1:size(VR_ang_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_ang_Md_up, 2)) '\n'], VR_ang_Md_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vf_mag_Md_up.txt', 'w');
for row = 1:size(Vf_mag_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_mag_Md_up, 2)) '\n'], Vf_mag_Md_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vf_ang_Md_up.txt', 'w');
for row = 1:size(Vf_ang_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_ang_Md_up, 2)) '\n'], Vf_ang_Md_up(row, :));
end
fclose(fileID);

%%

fileID = fopen('../normal_text_files/Vc_mag_Md_down.txt', 'w');
for row = 1:size(Vc_mag_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_mag_Md_down, 2)) '\n'], Vc_mag_Md_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vc_ang_Md_down.txt', 'w');
for row = 1:size(Vc_ang_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_ang_Md_down, 2)) '\n'], Vc_ang_Md_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/VR_mag_Md_down.txt', 'w');
for row = 1:size(VR_mag_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_mag_Md_down, 2)) '\n'], VR_mag_Md_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/VR_ang_Md_down.txt', 'w');
for row = 1:size(VR_ang_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_ang_Md_down, 2)) '\n'], VR_ang_Md_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vf_mag_Md_down.txt', 'w');
for row = 1:size(Vf_mag_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_mag_Md_down, 2)) '\n'], Vf_mag_Md_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vf_ang_Md_down.txt', 'w');
for row = 1:size(Vf_ang_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_ang_Md_down, 2)) '\n'], Vf_ang_Md_down(row, :));
end
fclose(fileID);
%%

% fileID = fopen('../normal_text_files/dTSS_M.txt', 'w');
% for row = 1:size(dTSS_M, 1)
%     fprintf(fileID, [repmat('%.16g ', 1, size(dTSS_M, 2)) '\n'], dTSS_M(row, :));
% end
% fclose(fileID);

fileID = fopen('../normal_text_files/Ic_line_mag_Md_up.txt', 'w');
for row = 1:size(Ic_line_mag_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_mag_Md_up, 2)) '\n'], Ic_line_mag_Md_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ic_line_ang_Md_up.txt', 'w');
for row = 1:size(Ic_line_ang_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_ang_Md_up, 2)) '\n'], Ic_line_ang_Md_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ir_line_mag_Md_up.txt', 'w');
for row = 1:size(Ir_line_mag_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_mag_Md_up, 2)) '\n'], Ir_line_mag_Md_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ir_line_ang_Md_up.txt', 'w');
for row = 1:size(Ir_line_ang_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_ang_Md_up, 2)) '\n'], Ir_line_ang_Md_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/If_line_mag_Md_up.txt', 'w');
for row = 1:size(If_line_mag_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_mag_Md_up, 2)) '\n'], If_line_mag_Md_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/If_line_ang_Md_up.txt', 'w');
for row = 1:size(If_line_ang_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_ang_Md_up, 2)) '\n'], If_line_ang_Md_up(row, :));
end
fclose(fileID);

%%
fileID = fopen('../normal_text_files/Ic_line_mag_Md_down.txt', 'w');
for row = 1:size(Ic_line_mag_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_mag_Md_down, 2)) '\n'], Ic_line_mag_Md_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ic_line_ang_Md_down.txt', 'w');
for row = 1:size(Ic_line_ang_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_ang_Md_down, 2)) '\n'], Ic_line_ang_Md_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ir_line_mag_Md_down.txt', 'w');
for row = 1:size(Ir_line_mag_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_mag_Md_down, 2)) '\n'], Ir_line_mag_Md_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ir_line_ang_Md_down.txt', 'w');
for row = 1:size(Ir_line_ang_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_ang_Md_down, 2)) '\n'], Ir_line_ang_Md_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/If_line_mag_Md_down.txt', 'w');
for row = 1:size(If_line_mag_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_mag_Md_down, 2)) '\n'], If_line_mag_Md_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/If_line_ang_Md_down.txt', 'w');
for row = 1:size(If_line_ang_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_ang_Md_down, 2)) '\n'], If_line_ang_Md_down(row, :));
end
fclose(fileID);
%%


% fileID = fopen('../normal_text_files/train_data.txt', 'w');
% for row = 1:size(train_data, 1)
%     fprintf(fileID, [repmat('%.16g ', 1, size(train_data, 2)) '\n'], train_data(row, :));
% end
% fclose(fileID);

fileID = fopen('../normal_text_files/AT_mva_mag_up.txt', 'w');
for row = 1:size(AT_mva_mag_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(AT_mva_mag_up, 2)) '\n'], AT_mva_mag_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/AT_mva_mag_down.txt', 'w');
for row = 1:size(AT_mva_mag_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(AT_mva_mag_down, 2)) '\n'], AT_mva_mag_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/AT.txt', 'w');
for row = 1:size(AT, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(AT, 2)) '\n'], AT(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Unb.txt', 'w');
for row = 1:size(Unb, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Unb, 2)) '\n'], Unb(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/s_apprant_power_MVA_mag.txt', 'w');
for row = 1:size(s_apprant_power_MVA_mag, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(s_apprant_power_MVA_mag, 2)) '\n'], s_apprant_power_MVA_mag(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/train_number.txt', 'w');
for row = 1:size(train_number, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(train_number, 2)) '\n'], train_number(row, :));
end
fclose(fileID);


fileID = fopen('../normal_text_files/track_type.txt', 'w');
for row = 1:size(track_type, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(track_type, 2)) '\n'], track_type(row, :));
end
fclose(fileID);


fileID = fopen('../normal_text_files/train_type.txt', 'w');
for row = 1:size(train_type, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(train_type, 2)) '\n'], train_type(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/start_time.txt', 'w');
for row = 1:size(start_time, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(start_time, 2)) '\n'], start_time(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/each_stop_train_data_up.txt', 'w');
for row = 1:size(each_stop_train_data_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(each_stop_train_data_up, 2)) '\n'], each_stop_train_data_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/rapid_train_data_up.txt', 'w');
for row = 1:size(rapid_train_data_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(rapid_train_data_up, 2)) '\n'], rapid_train_data_up(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/each_stop_train_data_down.txt', 'w');
for row = 1:size(each_stop_train_data_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(each_stop_train_data_down, 2)) '\n'], each_stop_train_data_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/rapid_train_data_down.txt', 'w');
for row = 1:size(rapid_train_data_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(rapid_train_data_down, 2)) '\n'], rapid_train_data_down(row, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/track_length.txt', 'w');
for row = 1:size(track_length, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(track_length, 2)) '\n'], track_length(row, :));
end
fclose(fileID);