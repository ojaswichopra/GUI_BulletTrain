fileID = fopen('dTSS.txt', 'w');
for row = 1:size(dTSS, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(dTSS, 2)) '\n'], dTSS(row, :));
end
fclose(fileID);

fileID = fopen('TSS.txt', 'w');
for row = 1:size(TSS, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(TSS, 2)) '\n'], TSS(row, :));
end
fclose(fileID);

fileID = fopen('d.txt', 'w');
for row = 1:size(d, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(d, 2)) '\n'], d(row, :));
end
fclose(fileID);

fileID = fopen('y.txt', 'w');
for row = 1:size(y, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(y, 2)) '\n'], y(row, :));
end
fclose(fileID);

fileID = fopen('Vc_mag_Td.txt', 'w');
for row = 1:size(Vc_mag_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_mag_Td, 2)) '\n'], Vc_mag_Td(row, :));
end
fclose(fileID);

fileID = fopen('Vc_ang_Td.txt', 'w');
for row = 1:size(Vc_ang_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_ang_Td, 2)) '\n'], Vc_ang_Td(row, :));
end
fclose(fileID);

fileID = fopen('VR_mag_Td.txt', 'w');
for row = 1:size(VR_mag_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_mag_Td, 2)) '\n'], VR_mag_Td(row, :));
end
fclose(fileID);

fileID = fopen('VR_ang_Td.txt', 'w');
for row = 1:size(VR_ang_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_ang_Td, 2)) '\n'], VR_ang_Td(row, :));
end
fclose(fileID);

fileID = fopen('Vf_mag_Td.txt', 'w');
for row = 1:size(Vf_mag_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_mag_Td, 2)) '\n'], Vf_mag_Td(row, :));
end
fclose(fileID);

fileID = fopen('Vf_ang_Td.txt', 'w');
for row = 1:size(Vf_ang_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_ang_Td, 2)) '\n'], Vf_ang_Td(row, :));
end
fclose(fileID);

fileID = fopen('dTSS_T.txt', 'w');
for row = 1:size(dTSS_T, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(dTSS_T, 2)) '\n'], dTSS_T(row, :));
end
fclose(fileID);

fileID = fopen('Ic_line_mag_Td.txt', 'w');
for row = 1:size(Ic_line_mag_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_mag_Td, 2)) '\n'], Ic_line_mag_Td(row, :));
end
fclose(fileID);

fileID = fopen('Ic_line_ang_Td.txt', 'w');
for row = 1:size(Ic_line_ang_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_ang_Td, 2)) '\n'], Ic_line_ang_Td(row, :));
end
fclose(fileID);

fileID = fopen('Ir_line_mag_Td.txt', 'w');
for row = 1:size(Ir_line_mag_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_mag_Td, 2)) '\n'], Ir_line_mag_Td(row, :));
end
fclose(fileID);

fileID = fopen('Ir_line_ang_Td.txt', 'w');
for row = 1:size(Ir_line_ang_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_ang_Td, 2)) '\n'], Ir_line_ang_Td(row, :));
end
fclose(fileID);

fileID = fopen('If_line_mag_Td.txt', 'w');
for row = 1:size(If_line_mag_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_mag_Td, 2)) '\n'], If_line_mag_Td(row, :));
end
fclose(fileID);

fileID = fopen('If_line_ang_Td.txt', 'w');
for row = 1:size(If_line_ang_Td, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_ang_Td, 2)) '\n'], If_line_ang_Td(row, :));
end
fclose(fileID);

% Open the file for writing complex variable z1
fileID = fopen('z1.txt', 'w');

% Write real and imaginary parts
for row = 1:size(z1, 1)
    fprintf(fileID, [repmat('%.16g, %.16g ', 1, size(z1, 2)) '\n'], real(z1(row, :)), imag(z1(row, :)));
end

% Close the file
fclose(fileID);

fileID = fopen('Vc_mag_Md.txt', 'w');
for row = 1:size(Vc_mag_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_mag_Md, 2)) '\n'], Vc_mag_Md(row, :));
end
fclose(fileID);

fileID = fopen('Vc_ang_Md.txt', 'w');
for row = 1:size(Vc_ang_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vc_ang_Md, 2)) '\n'], Vc_ang_Md(row, :));
end
fclose(fileID);

fileID = fopen('VR_mag_Md.txt', 'w');
for row = 1:size(VR_mag_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_mag_Md, 2)) '\n'], VR_mag_Md(row, :));
end
fclose(fileID);

fileID = fopen('VR_ang_Md.txt', 'w');
for row = 1:size(VR_ang_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(VR_ang_Md, 2)) '\n'], VR_ang_Md(row, :));
end
fclose(fileID);

fileID = fopen('Vf_mag_Md.txt', 'w');
for row = 1:size(Vf_mag_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_mag_Md, 2)) '\n'], Vf_mag_Md(row, :));
end
fclose(fileID);

fileID = fopen('Vf_ang_Md.txt', 'w');
for row = 1:size(Vf_ang_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Vf_ang_Md, 2)) '\n'], Vf_ang_Md(row, :));
end
fclose(fileID);

fileID = fopen('dTSS_M.txt', 'w');
for row = 1:size(dTSS_M, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(dTSS_M, 2)) '\n'], dTSS_M(row, :));
end
fclose(fileID);

fileID = fopen('Ic_line_mag_Md.txt', 'w');
for row = 1:size(Ic_line_mag_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_mag_Md, 2)) '\n'], Ic_line_mag_Md(row, :));
end
fclose(fileID);

fileID = fopen('Ic_line_ang_Md.txt', 'w');
for row = 1:size(Ic_line_ang_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ic_line_ang_Md, 2)) '\n'], Ic_line_ang_Md(row, :));
end
fclose(fileID);

fileID = fopen('Ir_line_mag_Md.txt', 'w');
for row = 1:size(Ir_line_mag_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_mag_Md, 2)) '\n'], Ir_line_mag_Md(row, :));
end
fclose(fileID);

fileID = fopen('Ir_line_ang_Md.txt', 'w');
for row = 1:size(Ir_line_ang_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Ir_line_ang_Md, 2)) '\n'], Ir_line_ang_Md(row, :));
end
fclose(fileID);

fileID = fopen('If_line_mag_Md.txt', 'w');
for row = 1:size(If_line_mag_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_mag_Md, 2)) '\n'], If_line_mag_Md(row, :));
end
fclose(fileID);

fileID = fopen('If_line_ang_Md.txt', 'w');
for row = 1:size(If_line_ang_Md, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(If_line_ang_Md, 2)) '\n'], If_line_ang_Md(row, :));
end
fclose(fileID);

fileID = fopen('train_data.txt', 'w');
for row = 1:size(train_data, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(train_data, 2)) '\n'], train_data(row, :));
end
fclose(fileID);

fileID = fopen('AT_mva_mag.txt', 'w');
for row = 1:size(AT_mva_mag, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(AT_mva_mag, 2)) '\n'], AT_mva_mag(row, :));
end
fclose(fileID);

fileID = fopen('AT.txt', 'w');
for row = 1:size(AT, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(AT, 2)) '\n'], AT(row, :));
end
fclose(fileID);

fileID = fopen('Unb.txt', 'w');
for row = 1:size(Unb, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(Unb, 2)) '\n'], Unb(row, :));
end
fclose(fileID);

fileID = fopen('s_apprant_power_MVA_mag.txt', 'w');
for row = 1:size(s_apprant_power_MVA_mag, 1)
    fprintf(fileID, [repmat('%.16g ', 1, size(s_apprant_power_MVA_mag, 2)) '\n'], s_apprant_power_MVA_mag(row, :));
end
fclose(fileID);
