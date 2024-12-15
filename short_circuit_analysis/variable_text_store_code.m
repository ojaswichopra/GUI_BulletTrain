fileID = fopen('../SCA_text_files/dTSS.txt', 'w');
for row = 1:size(dTSS, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(dTSS, 2)) '\n'], dTSS(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/dTSS_T.txt', 'w');
for row = 1:size(dTSS_T, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(dTSS_T, 2)) '\n'], dTSS_T(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/TSS.txt', 'w');
for row = 1:size(TSS, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(TSS, 2)) '\n'], TSS(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/d.txt', 'w');
for row = 1:size(d, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(d, 2)) '\n'], d(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/y.txt', 'w');
for row = 1:size(y, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(y, 2)) '\n'], y(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/Vc_mag_Td.txt', 'w');
for row = 1:size(Vc_mag_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_mag_Td, 2)) '\n'], Vc_mag_Td(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/Vc_ang_Td.txt', 'w');
for row = 1:size(Vc_ang_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_ang_Td, 2)) '\n'], Vc_ang_Td(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/VR_mag_Td.txt', 'w');
for row = 1:size(VR_mag_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_mag_Td, 2)) '\n'], VR_mag_Td(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/VR_ang_Td.txt', 'w');
for row = 1:size(VR_ang_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_ang_Td, 2)) '\n'], VR_ang_Td(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/Vf_mag_Td.txt', 'w');
for row = 1:size(Vf_mag_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_mag_Td, 2)) '\n'], Vf_mag_Td(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/Vf_ang_Td.txt', 'w');
for row = 1:size(Vf_ang_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_ang_Td, 2)) '\n'], Vf_ang_Td(row, :));
end
fclose(fileID);

% fileID = fopen('../SCA_text_files/dTSS_T.txt', 'w');
% for row = 1:size(dTSS_T, 1)
%     fprintf(fileID, [repmat('%.16g ', 1, size(dTSS_T, 2)) '\n'], dTSS_T(row, :));
% end
% fclose(fileID);

fileID = fopen('../SCA_text_files/Ic_line_mag_Td.txt', 'w');
for row = 1:size(Ic_line_mag_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_mag_Td, 2)) '\n'], Ic_line_mag_Td(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/Ic_line_ang_Td.txt', 'w');
for row = 1:size(Ic_line_ang_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_ang_Td, 2)) '\n'], Ic_line_ang_Td(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/Ir_line_mag_Td.txt', 'w');
for row = 1:size(Ir_line_mag_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_mag_Td, 2)) '\n'], Ir_line_mag_Td(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/Ir_line_ang_Td.txt', 'w');
for row = 1:size(Ir_line_ang_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_ang_Td, 2)) '\n'], Ir_line_ang_Td(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/If_line_mag_Td.txt', 'w');
for row = 1:size(If_line_mag_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_mag_Td, 2)) '\n'], If_line_mag_Td(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/If_line_ang_Td.txt', 'w');
for row = 1:size(If_line_ang_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_ang_Td, 2)) '\n'], If_line_ang_Td(row, :));
end
fclose(fileID);

% Open the file for writing complex variable z1
fileID = fopen('../SCA_text_files/z1.txt', 'w');

% Write real and imaginary parts
for row = 1:size(z1, 1)
    fprintf(fileID, [repmat('%.16g, %.16g ', 1, size(z1, 2)) '\n'], real(z1(row, :)), imag(z1(row, :)));
end

% Close the file
fclose(fileID);

fileID = fopen('../SCA_text_files/Vc_mag_Md.txt', 'w');
for row = 1:size(Vc_mag_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_mag_Md, 2)) '\n'], Vc_mag_Md(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/Vc_ang_Md.txt', 'w');
for row = 1:size(Vc_ang_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_ang_Md, 2)) '\n'], Vc_ang_Md(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/VR_mag_Md.txt', 'w');
for row = 1:size(VR_mag_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_mag_Md, 2)) '\n'], VR_mag_Md(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/VR_ang_Md.txt', 'w');
for row = 1:size(VR_ang_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_ang_Md, 2)) '\n'], VR_ang_Md(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/Vf_mag_Md.txt', 'w');
for row = 1:size(Vf_mag_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_mag_Md, 2)) '\n'], Vf_mag_Md(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/Vf_ang_Md.txt', 'w');
for row = 1:size(Vf_ang_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_ang_Md, 2)) '\n'], Vf_ang_Md(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/dTSS_M.txt', 'w');
for row = 1:size(dTSS_M, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(dTSS_M, 2)) '\n'], dTSS_M(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/Ic_line_mag_Md.txt', 'w');
for row = 1:size(Ic_line_mag_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_mag_Md, 2)) '\n'], Ic_line_mag_Md(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/Ic_line_ang_Md.txt', 'w');
for row = 1:size(Ic_line_ang_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_ang_Md, 2)) '\n'], Ic_line_ang_Md(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/Ir_line_mag_Md.txt', 'w');
for row = 1:size(Ir_line_mag_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_mag_Md, 2)) '\n'], Ir_line_mag_Md(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/Ir_line_ang_Md.txt', 'w');
for row = 1:size(Ir_line_ang_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_ang_Md, 2)) '\n'], Ir_line_ang_Md(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/If_line_mag_Md.txt', 'w');
for row = 1:size(If_line_mag_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_mag_Md, 2)) '\n'], If_line_mag_Md(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/If_line_ang_Md.txt', 'w');
for row = 1:size(If_line_ang_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_ang_Md, 2)) '\n'], If_line_ang_Md(row, :));
end
fclose(fileID);

% fileID = fopen('../SCA_text_files/each_stop_train_data.txt', 'w');
% for row = 1:size(each_stop_train_data, 1)
%     fprintf(fileID, [repmat('%.16g ', 1, size(each_stop_train_data, 2)) '\n'], each_stop_train_data(row, :));
% end
% fclose(fileID);

% fileID = fopen('../SCA_text_files/AT_mva_mag.txt', 'w');
% for row = 1:size(AT_mva_mag, 1)
%     fprintf(fileID, [repmat('%.16g ', 1, size(AT_mva_mag, 2)) '\n'], AT_mva_mag(row, :));
% end
% fclose(fileID);

% fileID = fopen('../SCA_text_files/AT.txt', 'w');
% for row = 1:size(AT, 1)
%     fprintf(fileID, [repmat('%.16g ', 1, size(AT, 2)) '\n'], AT(row, :));
% end
% fclose(fileID);

% fileID = fopen('../SCA_text_files/Unb.txt', 'w');
% for row = 1:size(Unb, 1)
%     fprintf(fileID, [repmat('%.16g ', 1, size(Unb, 2)) '\n'], Unb(row, :));
% end
% fclose(fileID);

% fileID = fopen('../SCA_text_files/s_apprant_power_MVA_mag.txt', 'w');
% for row = 1:size(s_apprant_power_MVA_mag, 1)
%     fprintf(fileID, [repmat('%.16g ', 1, size(s_apprant_power_MVA_mag, 2)) '\n'], s_apprant_power_MVA_mag(row, :));
% end
% fclose(fileID);
% fileID = fopen('../SCA_text_files/N_TSS_O.txt', 'w');
% for row = 1:size(N_TSS_O, 1)
%     fprintf(fileID, [repmat('%.16g ', 1, size(N_TSS_O, 2)) '\n'], N_TSS_O(row, :));
% end
% fclose(fileID);
% fileID = fopen('../SCA_text_files/N_TSS.txt', 'w');
% for row = 1:size(N_TSS, 1)
%     fprintf(fileID, [repmat('%.16g ', 1, size(N_TSS, 2)) '\n'], N_TSS(row, :));
% end
% fclose(fileID);
% 
% fileID = fopen('../SCA_text_files/N_hr.txt', 'w');
% for row = 1:size(N_hr, 1)
%     fprintf(fileID, [repmat('%.16g ', 1, size(N_hr, 2)) '\n'], N_hr(row, :));
% end
% fclose(fileID);
% fileID = fopen('../SCA_text_files/N_train_per_hour.txt', 'w');
% for row = 1:size(N_train_per_hour, 1)
%     fprintf(fileID, [repmat('%.16g ', 1, size(N_train_per_hour, 2)) '\n'], N_train_per_hour(row, :));
% end
% fclose(fileID);
% 
% fileID = fopen('../SCA_text_files/Mva_sec_abs.txt', 'w');
% for row = 1:size(Mva_sec_abs, 1)
%     fprintf(fileID, [repmat('%.16g ', 1, size(Mva_sec_abs, 2)) '\n'], Mva_sec_abs(row, :));
% end
% fclose(fileID);
% 
% fileID = fopen('../SCA_text_files/tt_time.txt', 'w');
% for row = 1:size(tt_time, 1)
%     fprintf(fileID, [repmat('%.16g ', 1, size(tt_time, 2)) '\n'], tt_time(row, :));
% end
% fclose(fileID);
fileID = fopen('../SCA_text_files/time_instant_short.txt', 'w');
for row = 1:size(time_instant_short, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(time_instant_short, 2)) '\n'], time_instant_short(row, :));
end
fclose(fileID);


fileID = fopen('../SCA_text_files/n_tss_fault.txt', 'w');
for row = 1:size(n_tss_fault, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(n_tss_fault, 2)) '\n'], n_tss_fault(row, :));
end
fclose(fileID);
fileID = fopen('../SCA_text_files/faulted_winding_side.txt', 'w');
for row = 1:size(faulted_winding_side, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(faulted_winding_side, 2)) '\n'], faulted_winding_side(row, :));
end
fclose(fileID);

fileID = fopen('../SCA_text_files/linedata_dTSS_T.txt', 'w');
for row = 1:size(linedata_dTSS_T, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(linedata_dTSS_T, 2)) '\n'], linedata_dTSS_T(row, :));
end
fclose(fileID);
fileID = fopen('../SCA_text_files/linedata_dTSS_M.txt', 'w');
for row = 1:size(linedata_dTSS_M, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(linedata_dTSS_M, 2)) '\n'], linedata_dTSS_M(row, :));
end
fclose(fileID);