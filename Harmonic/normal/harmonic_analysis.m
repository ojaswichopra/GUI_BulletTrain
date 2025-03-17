function harmonic_analysis(dTSS_T_up, dTSS_M_up, dTSS_T_down, dTSS_M_down, pTSS_T_up, pTSS_M_up, pTSS_T_down, pTSS_M_down, tTSS_T_up, tTSS_M_up, tTSS_T_down, tTSS_M_down, Vc_mag_Td, Vc_mag_Md, Vc_ang_Td, Vc_ang_Md, VR_mag_Td, Vf_mag_Td, VR_mag_Md, Vf_mag_Md, N_TSS, y)
    tic

    % This is to be taken from the user. Ask the user to "Upload harmonic current spectrum data (.txt file)"
    % Open the file for reading
    fileID = fopen('../Harmonic_current_spectrum.txt', 'r');   % The text file containing harmonic spectrum data

    % Initialize an empty cell array for numeric data rows
    dataRows = {};

    % Read each line and detect numeric data
    while ~feof(fileID)
        line = fgetl(fileID);  % Read a line as a string

        % Try converting the line to numeric data
        numericData = sscanf(line, '%f').';

        % If the line contains numeric data, store it as a row in dataRows
        if ~isempty(numericData)
            dataRows{end+1, 1} = numericData;  % Append the row to dataRows
        end
    end

    % Close the file
    fclose(fileID);

    % Convert the cell array to a 2D numeric array
    harmonic_spectrum = cell2mat(dataRows);   % Harmonic current spectrum

    H=harmonic_spectrum(end,1);  % Maximum harmonic order

    % These text files are generated after executing the load flow under normal condition
    % dTSS_T_up=load("dTSS_T_up.txt");
    % dTSS_M_up=load("dTSS_M_up.txt");
    % dTSS_T_down=load("dTSS_T_down.txt");
    % dTSS_M_down=load("dTSS_M_down.txt");
    % pTSS_T_up=load("pTSS_T_up.txt");
    % pTSS_M_up=load("pTSS_M_up.txt");
    % pTSS_T_down=load("pTSS_T_down.txt");
    % pTSS_M_down=load("pTSS_M_down.txt");
    % tTSS_T_up=load("tTSS_T_up.txt");
    % tTSS_M_up=load("tTSS_M_up.txt");
    % tTSS_T_down=load("tTSS_T_down.txt");
    % tTSS_M_down=load("tTSS_M_down.txt");
    % Vc_mag_Td=load("Vc_mag_Td.txt");
    % Vc_mag_Md=load("Vc_mag_Md.txt");
    % Vc_ang_Td=load("Vc_ang_Td.txt");
    % Vc_ang_Md=load("Vc_ang_Md.txt");
    % VR_mag_Td=load("VR_mag_Td.txt");
    % Vf_mag_Td=load("Vf_mag_Td.txt");
    % VR_mag_Md=load("VR_mag_Md.txt");
    % Vf_mag_Md=load("Vf_mag_Md.txt");
    % N_TSS=load("N_TSS.txt");
    % y=load("y.txt");

    %loading back the complex variable z1 from its text file
    z1_loaded = load("../../normal_text_files/z1.txt");
    % Determine the number of columns
    num_cols = size(z1_loaded, 2) / 2;  % Total columns divided by 2
    % Separate real and imaginary parts
    real_parts = z1_loaded(:, 1:num_cols);           % First half for real parts
    imag_parts = z1_loaded(:, num_cols+1:end);       % Second half for imaginary parts
    % Combine real and imaginary parts to reconstruct the complex variable z1
    z1 = real_parts + 1i * imag_parts;

    %loading back the complex variable YcrfT from its text file
    YcrfT_loaded = load("../../normal_text_files/YcrfT.txt");
    % Determine the number of columns
    num_cols = size(YcrfT_loaded, 2) / 2;  % Total columns divided by 2
    % Separate real and imaginary parts
    real_parts = YcrfT_loaded(:, 1:num_cols);           % First half for real parts
    imag_parts = YcrfT_loaded(:, num_cols+1:end);       % Second half for imaginary parts
    % Combine real and imaginary parts to reconstruct the complex variable YcrfT
    YcrfT = real_parts + 1i * imag_parts;

    %loading back the complex variable YcrfM from its text file
    YcrfM_loaded = load("../../normal_text_files/YcrfM.txt");
    % Determine the number of columns
    num_cols = size(YcrfM_loaded, 2) / 2;  % Total columns divided by 2
    % Separate real and imaginary parts
    real_parts = YcrfM_loaded(:, 1:num_cols);           % First half for real parts
    imag_parts = YcrfM_loaded(:, num_cols+1:end);       % Second half for imaginary parts
    % Combine real and imaginary parts to reconstruct the complex variable YcrfM
    YcrfM = real_parts + 1i * imag_parts;

    %loading back the complex variable Yat from its text file
    Yat_loaded = load("../../normal_text_files/Yat.txt");
    % Determine the number of columns
    num_cols = size(Yat_loaded, 2) / 2;  % Total columns divided by 2
    % Separate real and imaginary parts
    real_parts = Yat_loaded(:, 1:num_cols);           % First half for real parts
    imag_parts = Yat_loaded(:, num_cols+1:end);       % Second half for imaginary parts
    % Combine real and imaginary parts to reconstruct the complex variable Yat
    Yat = real_parts + 1i * imag_parts;

    %Array initialization
    THD_C_T=-10*ones(N_TSS*y,15);   %Contact wire THD (percentage) of all Teaser windings for entire time instant of operation
    THD_R_T=-10*ones(N_TSS*y,15);   %Rail THD (percentage) of all Teaser windings for entire time instant of operation
    THD_F_T=-10*ones(N_TSS*y,15);   %Feeder wire THD (percentage) of all Teaser windings for entire time instant of operation
    THD_C_M=-10*ones(N_TSS*y,15);   %Contact wire THD (percentage) of all Main windings for entire time instant of operation
    THD_R_M=-10*ones(N_TSS*y,15);   %Rail THD (percentage) of all Main windings for entire time instant of operation
    THD_F_M=-10*ones(N_TSS*y,15);   %Feeder wire THD (percentage) of all Main windings for entire time instant of operation
    THD_C_T_up=-10*ones(N_TSS*y,15);%Up-track contact wire THD (percentage) of all Teaser windings for entire time instant of operation
    THD_C_T_down=-10*ones(N_TSS*y,15);%Down-track contact wire THD (percentage) of all Teaser windings for entire time instant of operation
    THD_C_M_up=-10*ones(N_TSS*y,15);%Up-track contact wire THD (percentage) of all Main windings for entire time instant of operation
    THD_C_M_down=-10*ones(N_TSS*y,15);%Down-track contact wire THD (percentage) of all Main windings for entire time instant of operation

    NT=length(dTSS_T_up);
    for nt=1:NT
        line_data_Tss_double
        bus_data_Tss_double
        DATA_INPUT
        YBUST
        YBUSM
        harmonic_voltage   % calculation of harmonic voltages and THD
        percentage_completion = (nt*100)/NT
    end

    % Saving the required workspace variables
    save("harmonic_analysis_variables.mat","THD_C_T_up","THD_C_M_up","THD_C_T_down","THD_C_M_down") 
    toc
end

