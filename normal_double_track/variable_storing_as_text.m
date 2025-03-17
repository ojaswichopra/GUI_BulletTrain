folder = '../normal_text_files';
% Check if the folder exists, and if not, create it
if ~exist(folder, 'dir')
    mkdir(folder);
end

fileID = fopen('../normal_text_files/dTSS_up.txt', 'w');
for row1 = 1:size(dTSS_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(dTSS_up, 2)) '\n'], dTSS_up(row1, :));
end
fclose(fileID);
fileID = fopen('../normal_text_files/dTSS_down.txt', 'w');
for row1 = 1:size(dTSS_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(dTSS_down, 2)) '\n'], dTSS_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/dTSS_T_up.txt', 'w');
for row1 = 1:size(dTSS_T_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(dTSS_T_up, 2)) '\n'], dTSS_T_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/dTSS_T_down.txt', 'w');
for row1 = 1:size(dTSS_T_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(dTSS_T_down, 2)) '\n'], dTSS_T_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/dTSS_M_up.txt', 'w');
for row1 = 1:size(dTSS_M_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(dTSS_M_up, 2)) '\n'], dTSS_M_up(row1, :));
end
fclose(fileID);
fileID = fopen('../normal_text_files/dTSS_M_down.txt', 'w');
for row1 = 1:size(dTSS_M_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(dTSS_M_down, 2)) '\n'], dTSS_M_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/TSS.txt', 'w');
for row1 = 1:size(TSS, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(TSS, 2)) '\n'], TSS(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/d.txt', 'w');
for row1 = 1:size(d, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(d, 2)) '\n'], d(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/y.txt', 'w');
for row1 = 1:size(y, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(y, 2)) '\n'], y(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vc_mag_Td_down.txt', 'w');
for row1 = 1:size(Vc_mag_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_mag_Td_down, 2)) '\n'], Vc_mag_Td_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vc_ang_Td_down.txt', 'w');
for row1 = 1:size(Vc_ang_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_ang_Td_down, 2)) '\n'], Vc_ang_Td_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/VR_mag_Td_down.txt', 'w');
for row1 = 1:size(VR_mag_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_mag_Td_down, 2)) '\n'], VR_mag_Td_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/VR_ang_Td_down.txt', 'w');
for row1 = 1:size(VR_ang_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_ang_Td_down, 2)) '\n'], VR_ang_Td_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vf_mag_Td_down.txt', 'w');
for row1 = 1:size(Vf_mag_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_mag_Td_down, 2)) '\n'], Vf_mag_Td_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vf_ang_Td_down.txt', 'w');
for row1 = 1:size(Vf_ang_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_ang_Td_down, 2)) '\n'], Vf_ang_Td_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vc_mag_Td_up.txt', 'w');
for row1 = 1:size(Vc_mag_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_mag_Td_up, 2)) '\n'], Vc_mag_Td_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vc_ang_Td_up.txt', 'w');
for row1 = 1:size(Vc_ang_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_ang_Td_up, 2)) '\n'], Vc_ang_Td_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/VR_mag_Td_up.txt', 'w');
for row1 = 1:size(VR_mag_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_mag_Td_up, 2)) '\n'], VR_mag_Td_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/VR_ang_Td_up.txt', 'w');
for row1 = 1:size(VR_ang_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_ang_Td_up, 2)) '\n'], VR_ang_Td_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vf_mag_Td_up.txt', 'w');
for row1 = 1:size(Vf_mag_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_mag_Td_up, 2)) '\n'], Vf_mag_Td_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vf_ang_Td_up.txt', 'w');
for row1 = 1:size(Vf_ang_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_ang_Td_up, 2)) '\n'], Vf_ang_Td_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ic_line_mag_Td_up.txt', 'w');
for row1 = 1:size(Ic_line_mag_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_mag_Td_up, 2)) '\n'], Ic_line_mag_Td_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ic_line_ang_Td_up.txt', 'w');
for row1 = 1:size(Ic_line_ang_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_ang_Td_up, 2)) '\n'], Ic_line_ang_Td_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ir_line_mag_Td_up.txt', 'w');
for row1 = 1:size(Ir_line_mag_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_mag_Td_up, 2)) '\n'], Ir_line_mag_Td_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ir_line_ang_Td_up.txt', 'w');
for row1 = 1:size(Ir_line_ang_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_ang_Td_up, 2)) '\n'], Ir_line_ang_Td_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/If_line_mag_Td_up.txt', 'w');
for row1 = 1:size(If_line_mag_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_mag_Td_up, 2)) '\n'], If_line_mag_Td_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/If_line_ang_Td_up.txt', 'w');
for row1 = 1:size(If_line_ang_Td_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_ang_Td_up, 2)) '\n'], If_line_ang_Td_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ic_line_mag_Td_down.txt', 'w');
for row1 = 1:size(Ic_line_mag_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_mag_Td_down, 2)) '\n'], Ic_line_mag_Td_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ic_line_ang_Td_down.txt', 'w');
for row1 = 1:size(Ic_line_ang_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_ang_Td_down, 2)) '\n'], Ic_line_ang_Td_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ir_line_mag_Td_down.txt', 'w');
for row1 = 1:size(Ir_line_mag_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_mag_Td_down, 2)) '\n'], Ir_line_mag_Td_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ir_line_ang_Td_down.txt', 'w');
for row1 = 1:size(Ir_line_ang_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_ang_Td_down, 2)) '\n'], Ir_line_ang_Td_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/If_line_mag_Td_down.txt', 'w');
for row1 = 1:size(If_line_mag_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_mag_Td_down, 2)) '\n'], If_line_mag_Td_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/If_line_ang_Td_down.txt', 'w');
for row1 = 1:size(If_line_ang_Td_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_ang_Td_down, 2)) '\n'], If_line_ang_Td_down(row1, :));
end
fclose(fileID);

% Open the file for writing complex variable z1
fileID = fopen('../normal_text_files/z1.txt', 'w');

% Write real and imaginary parts
for row1 = 1:size(z1, 1)
    fprintf(fileID, [repmat('%.16g, %.16g ', 1, size(z1, 2)) '\n'], real(z1(row1, :)), imag(z1(row1, :)));
end

% Close the file
fclose(fileID);

fileID = fopen('../normal_text_files/Vc_mag_Md_up.txt', 'w');
for row1 = 1:size(Vc_mag_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_mag_Md_up, 2)) '\n'], Vc_mag_Md_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vc_ang_Md_up.txt', 'w');
for row1 = 1:size(Vc_ang_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_ang_Md_up, 2)) '\n'], Vc_ang_Md_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/VR_mag_Md_up.txt', 'w');
for row1 = 1:size(VR_mag_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_mag_Md_up, 2)) '\n'], VR_mag_Md_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/VR_ang_Md_up.txt', 'w');
for row1 = 1:size(VR_ang_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_ang_Md_up, 2)) '\n'], VR_ang_Md_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vf_mag_Md_up.txt', 'w');
for row1 = 1:size(Vf_mag_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_mag_Md_up, 2)) '\n'], Vf_mag_Md_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vf_ang_Md_up.txt', 'w');
for row1 = 1:size(Vf_ang_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_ang_Md_up, 2)) '\n'], Vf_ang_Md_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vc_mag_Md_down.txt', 'w');
for row1 = 1:size(Vc_mag_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_mag_Md_down, 2)) '\n'], Vc_mag_Md_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vc_ang_Md_down.txt', 'w');
for row1 = 1:size(Vc_ang_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_ang_Md_down, 2)) '\n'], Vc_ang_Md_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/VR_mag_Md_down.txt', 'w');
for row1 = 1:size(VR_mag_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_mag_Md_down, 2)) '\n'], VR_mag_Md_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/VR_ang_Md_down.txt', 'w');
for row1 = 1:size(VR_ang_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_ang_Md_down, 2)) '\n'], VR_ang_Md_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vf_mag_Md_down.txt', 'w');
for row1 = 1:size(Vf_mag_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_mag_Md_down, 2)) '\n'], Vf_mag_Md_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vf_ang_Md_down.txt', 'w');
for row1 = 1:size(Vf_ang_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_ang_Md_down, 2)) '\n'], Vf_ang_Md_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ic_line_mag_Md_up.txt', 'w');
for row1 = 1:size(Ic_line_mag_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_mag_Md_up, 2)) '\n'], Ic_line_mag_Md_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ic_line_ang_Md_up.txt', 'w');
for row1 = 1:size(Ic_line_ang_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_ang_Md_up, 2)) '\n'], Ic_line_ang_Md_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ir_line_mag_Md_up.txt', 'w');
for row1 = 1:size(Ir_line_mag_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_mag_Md_up, 2)) '\n'], Ir_line_mag_Md_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ir_line_ang_Md_up.txt', 'w');
for row1 = 1:size(Ir_line_ang_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_ang_Md_up, 2)) '\n'], Ir_line_ang_Md_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/If_line_mag_Md_up.txt', 'w');
for row1 = 1:size(If_line_mag_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_mag_Md_up, 2)) '\n'], If_line_mag_Md_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/If_line_ang_Md_up.txt', 'w');
for row1 = 1:size(If_line_ang_Md_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_ang_Md_up, 2)) '\n'], If_line_ang_Md_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ic_line_mag_Md_down.txt', 'w');
for row1 = 1:size(Ic_line_mag_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_mag_Md_down, 2)) '\n'], Ic_line_mag_Md_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ic_line_ang_Md_down.txt', 'w');
for row1 = 1:size(Ic_line_ang_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_ang_Md_down, 2)) '\n'], Ic_line_ang_Md_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ir_line_mag_Md_down.txt', 'w');
for row1 = 1:size(Ir_line_mag_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_mag_Md_down, 2)) '\n'], Ir_line_mag_Md_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ir_line_ang_Md_down.txt', 'w');
for row1 = 1:size(Ir_line_ang_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_ang_Md_down, 2)) '\n'], Ir_line_ang_Md_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/If_line_mag_Md_down.txt', 'w');
for row1 = 1:size(If_line_mag_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_mag_Md_down, 2)) '\n'], If_line_mag_Md_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/If_line_ang_Md_down.txt', 'w');
for row1 = 1:size(If_line_ang_Md_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_ang_Md_down, 2)) '\n'], If_line_ang_Md_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/AT_mva_mag_up.txt', 'w');
for row1 = 1:size(AT_mva_mag_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(AT_mva_mag_up, 2)) '\n'], AT_mva_mag_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/AT_mva_mag_down.txt', 'w');
for row1 = 1:size(AT_mva_mag_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(AT_mva_mag_down, 2)) '\n'], AT_mva_mag_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/AT.txt', 'w');
for row1 = 1:size(AT, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(AT, 2)) '\n'], AT(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Unb.txt', 'w');
for row1 = 1:size(Unb, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Unb, 2)) '\n'], Unb(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/s_apprant_power_MVA_mag.txt', 'w');
for row1 = 1:size(s_apprant_power_MVA_mag, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(s_apprant_power_MVA_mag, 2)) '\n'], s_apprant_power_MVA_mag(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/train_number.txt', 'w');
for row1 = 1:size(train_number, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(train_number, 2)) '\n'], train_number(row1, :));
end
fclose(fileID);


fileID = fopen('../normal_text_files/track_type.txt', 'w');
for row1 = 1:size(track_type, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(track_type, 2)) '\n'], track_type(row1, :));
end
fclose(fileID);


fileID = fopen('../normal_text_files/train_type.txt', 'w');
for row1 = 1:size(train_type, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(train_type, 2)) '\n'], train_type(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/start_time.txt', 'w');
for row1 = 1:size(start_time, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(start_time, 2)) '\n'], start_time(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/each_stop_train_data_up.txt', 'w');
for row1 = 1:size(each_stop_train_data_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(each_stop_train_data_up, 2)) '\n'], each_stop_train_data_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/rapid_train_data_up.txt', 'w');
for row1 = 1:size(rapid_train_data_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(rapid_train_data_up, 2)) '\n'], rapid_train_data_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/each_stop_train_data_down.txt', 'w');
for row1 = 1:size(each_stop_train_data_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(each_stop_train_data_down, 2)) '\n'], each_stop_train_data_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/rapid_train_data_down.txt', 'w');
for row1 = 1:size(rapid_train_data_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(rapid_train_data_down, 2)) '\n'], rapid_train_data_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/track_length.txt', 'w');
for row1 = 1:size(track_length, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(track_length, 2)) '\n'], track_length(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/N_TSS.txt', 'w');
for row1 = 1:size(N_TSS, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(N_TSS, 2)) '\n'], N_TSS(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/rad_C.txt', 'w');
for row1 = 1:size(rad_C, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(rad_C, 2)) '\n'], rad_C(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/rad_R1.txt', 'w');
for row1 = 1:size(rad_R1, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(rad_R1, 2)) '\n'], rad_R1(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/rad_F.txt', 'w');
for row1 = 1:size(rad_F, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(rad_F, 2)) '\n'], rad_F(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/rad_M1.txt', 'w');
for row1 = 1:size(rad_M1, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(rad_M1, 2)) '\n'], rad_M1(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/rad_G.txt', 'w');
for row1 = 1:size(rad_G, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(rad_G, 2)) '\n'], rad_G(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Resistance_C.txt', 'w');
for row1 = 1:size(Resistance_C, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Resistance_C, 2)) '\n'], Resistance_C(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Resistance_R1.txt', 'w');
for row1 = 1:size(Resistance_R1, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Resistance_R1, 2)) '\n'], Resistance_R1(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Resistance_F.txt', 'w');
for row1 = 1:size(Resistance_F, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Resistance_F, 2)) '\n'], Resistance_F(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Resistance_M1.txt', 'w');
for row1 = 1:size(Resistance_M1, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Resistance_M1, 2)) '\n'], Resistance_M1(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Resistance_G.txt', 'w');
for row1 = 1:size(Resistance_G, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Resistance_G, 2)) '\n'], Resistance_G(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Ch.txt', 'w');
for row1 = 1:size(Ch, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ch, 2)) '\n'], Ch(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/nFd.txt', 'w');
for row1 = 1:size(nFd, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(nFd, 2)) '\n'], nFd(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/nFh.txt', 'w');
for row1 = 1:size(nFh, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(nFh, 2)) '\n'], nFh(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Mh.txt', 'w');
for row1 = 1:size(Mh, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Mh, 2)) '\n'], Mh(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/gd.txt', 'w');
for row1 = 1:size(gd, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(gd, 2)) '\n'], gd(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/gh.txt', 'w');
for row1 = 1:size(gh, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(gh, 2)) '\n'], gh(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/freq.txt', 'w');
for row1 = 1:size(freq, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(freq, 2)) '\n'], freq(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/row.txt', 'w');
for row1 = 1:size(row, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(row, 2)) '\n'], row(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/pTSS_T_up.txt', 'w');
for row1 = 1:size(pTSS_T_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(pTSS_T_up, 2)) '\n'], pTSS_T_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/pTSS_M_up.txt', 'w');
for row1 = 1:size(pTSS_M_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(pTSS_M_up, 2)) '\n'], pTSS_M_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/pTSS_T_down.txt', 'w');
for row1 = 1:size(pTSS_T_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(pTSS_T_down, 2)) '\n'], pTSS_T_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/pTSS_M_down.txt', 'w');
for row1 = 1:size(pTSS_M_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(pTSS_M_down, 2)) '\n'], pTSS_M_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/tTSS_T_up.txt', 'w');
for row1 = 1:size(tTSS_T_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(tTSS_T_up, 2)) '\n'], tTSS_T_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/tTSS_M_up.txt', 'w');
for row1 = 1:size(tTSS_M_up, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(tTSS_M_up, 2)) '\n'], tTSS_M_up(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/tTSS_T_down.txt', 'w');
for row1 = 1:size(tTSS_T_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(tTSS_T_down, 2)) '\n'], tTSS_T_down(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/tTSS_M_down.txt', 'w');
for row1 = 1:size(tTSS_M_down, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(tTSS_M_down, 2)) '\n'], tTSS_M_down(row1, :));
end
fclose(fileID);

% Open the file for writing complex variable YcrfT
fileID = fopen('../normal_text_files/YcrfT.txt', 'w');

% Write real and imaginary parts
for row1 = 1:size(YcrfT, 1)
    fprintf(fileID, [repmat('%.16g, %.16g ', 1, size(YcrfT, 2)) '\n'], real(YcrfT(row1, :)), imag(YcrfT(row1, :)));
end

% Close the file
fclose(fileID);

% Open the file for writing complex variable YcrfM
fileID = fopen('../normal_text_files/YcrfM.txt', 'w');

% Write real and imaginary parts
for row1 = 1:size(YcrfM, 1)
    fprintf(fileID, [repmat('%.16g, %.16g ', 1, size(YcrfM, 2)) '\n'], real(YcrfM(row1, :)), imag(YcrfM(row1, :)));
end

% Close the file
fclose(fileID);

% Open the file for writing complex variable YcrfT
fileID = fopen('../normal_text_files/Yat.txt', 'w');

% Write real and imaginary parts
for row1 = 1:size(Yat, 1)
    fprintf(fileID, [repmat('%.16g, %.16g ', 1, size(Yat, 2)) '\n'], real(Yat(row1, :)), imag(Yat(row1, :)));
end

% Close the file
fclose(fileID);

fileID = fopen('../normal_text_files/Vc_mag_Td.txt', 'w');
for row1 = 1:size(Vc_mag_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_mag_Td, 2)) '\n'], Vc_mag_Td(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vc_ang_Td.txt', 'w');
for row1 = 1:size(Vc_ang_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_ang_Td, 2)) '\n'], Vc_ang_Td(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vc_mag_Md.txt', 'w');
for row1 = 1:size(Vc_mag_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_mag_Md, 2)) '\n'], Vc_mag_Md(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vc_ang_Md.txt', 'w');
for row1 = 1:size(Vc_ang_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_ang_Md, 2)) '\n'], Vc_ang_Md(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/VR_mag_Td.txt', 'w');
for row1 = 1:size(VR_mag_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_mag_Td, 2)) '\n'], VR_mag_Td(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vf_mag_Td.txt', 'w');
for row1 = 1:size(Vf_mag_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_mag_Td, 2)) '\n'], Vf_mag_Td(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/VR_mag_Md.txt', 'w');
for row1 = 1:size(VR_mag_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_mag_Md, 2)) '\n'], VR_mag_Md(row1, :));
end
fclose(fileID);

fileID = fopen('../normal_text_files/Vf_mag_Md.txt', 'w');
for row1 = 1:size(Vf_mag_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_mag_Md, 2)) '\n'], Vf_mag_Md(row1, :));
end
fclose(fileID);