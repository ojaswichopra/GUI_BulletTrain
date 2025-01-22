% compiling the Mubai Ahmedabad all stop schedule

% close all
% clear all
% clc

% formatspec = '%g %g %g %g %g %g';
% sizeA = [6 Inf];


% fid1 = fopen('output_Mumbai_thane.txt','r');
% fid2 = fopen('output_Thane_Virar.txt','r');
% fid3 = fopen('output_Virar_Boisar.txt','r');
% fid4 = fopen('output_Boisar_Vapi.txt','r');
% fid5 = fopen('output_Vapi_Bilimora.txt','r');
% fid6 = fopen('output_Bilimora_Surat.txt','r');
% fid7 = fopen('output_Surat_Bharuch.txt','r');
% fid8 = fopen('output_Bharuch_Vadodara.txt','r');
% fid9 = fopen('output_Vadodara_Anand.txt','r');
% fid10 = fopen('output_Anand_Ahmedabad.txt','r');
% fid11 = fopen('output_Ahmedabad_Sabarmati.txt','r');

% arr_1 = fscanf(fid1,formatspec,sizeA);
% Mumbai_Thane = arr_1';
% arr_2 = fscanf(fid2,formatspec,sizeA);
% Thane_Virar = arr_2';
% arr_3 = fscanf(fid3,formatspec,sizeA);
% Virar_Boisar = arr_3';
% arr_4 = fscanf(fid4,formatspec,sizeA);
% Boisar_Vapi = arr_4';
% arr_5 = fscanf(fid5,formatspec,sizeA);
% Vapi_Bilimora = arr_5';
% arr_6 = fscanf(fid6,formatspec,sizeA);
% Bilimora_Surat = arr_6';
% arr_7 = fscanf(fid7,formatspec,sizeA);
% Surat_Bharuch = arr_7';
% arr_8 = fscanf(fid8,formatspec,sizeA);
% Bharuch_Vadodara = arr_8';
% arr_9 = fscanf(fid9,formatspec,sizeA);
% Vadodara_Anand = arr_9';
% arr_10 = fscanf(fid10,formatspec,sizeA);
% Anand_Ahmedabad = arr_10';
% arr_11 = fscanf(fid11,formatspec,sizeA);
% Ahmedabad_Sabarmati = arr_11';

% Mum_Sabar_all_stop = Mumbai_Thane;
% s1 = size(Mum_Sabar_all_stop,1);
% x1 = Mum_Sabar_all_stop(s1,1);

% s2 = size(Thane_Virar,1);
% for kk = 2:s2
%     Mum_Sabar_all_stop(s1+kk-1,1) = x1 + Thane_Virar(kk,1);
%     Mum_Sabar_all_stop(s1+kk-1,2:6) = Thane_Virar(kk,2:6);
% end
% s1 = size(Mum_Sabar_all_stop,1);
% x1 = Mum_Sabar_all_stop(s1,1);

% s2 = size(Virar_Boisar,1);
% for kk = 2:s2
%     Mum_Sabar_all_stop(s1+kk-1,1) = x1 + Virar_Boisar(kk,1);
%     Mum_Sabar_all_stop(s1+kk-1,2:6) = Virar_Boisar(kk,2:6);
% end
% s1 = size(Mum_Sabar_all_stop,1);
% x1 = Mum_Sabar_all_stop(s1,1);

% s2 = size(Boisar_Vapi,1);
% for kk = 2:s2
%     Mum_Sabar_all_stop(s1+kk-1,1) = x1 + Boisar_Vapi(kk,1);
%     Mum_Sabar_all_stop(s1+kk-1,2:6) = Boisar_Vapi(kk,2:6);
% end
% s1 = size(Mum_Sabar_all_stop,1);
% x1 = Mum_Sabar_all_stop(s1,1);

% s2 = size(Vapi_Bilimora,1);
% for kk = 2:s2
%     Mum_Sabar_all_stop(s1+kk-1,1) = x1 + Vapi_Bilimora(kk,1);
%     Mum_Sabar_all_stop(s1+kk-1,2:6) = Vapi_Bilimora(kk,2:6);
% end
% s1 = size(Mum_Sabar_all_stop,1);
% x1 = Mum_Sabar_all_stop(s1,1);

% s2 = size(Bilimora_Surat,1);
% for kk = 2:s2
%     Mum_Sabar_all_stop(s1+kk-1,1) = x1 + Bilimora_Surat(kk,1);
%     Mum_Sabar_all_stop(s1+kk-1,2:6) = Bilimora_Surat(kk,2:6);
% end
% s1 = size(Mum_Sabar_all_stop,1);
% x1 = Mum_Sabar_all_stop(s1,1);

% s2 = size(Surat_Bharuch,1);
% for kk = 2:s2
%     Mum_Sabar_all_stop(s1+kk-1,1) = x1 + Surat_Bharuch(kk,1);
%     Mum_Sabar_all_stop(s1+kk-1,2:6) = Surat_Bharuch(kk,2:6);
% end
% s1 = size(Mum_Sabar_all_stop,1);
% x1 = Mum_Sabar_all_stop(s1,1);

% s2 = size(Bharuch_Vadodara,1);
% for kk = 2:s2
%     Mum_Sabar_all_stop(s1+kk-1,1) = x1 + Bharuch_Vadodara(kk,1);
%     Mum_Sabar_all_stop(s1+kk-1,2:6) = Bharuch_Vadodara(kk,2:6);
% end
% s1 = size(Mum_Sabar_all_stop,1);
% x1 = Mum_Sabar_all_stop(s1,1);

% s2 = size(Vadodara_Anand,1);
% for kk = 2:s2
%     Mum_Sabar_all_stop(s1+kk-1,1) = x1 + Vadodara_Anand(kk,1);
%     Mum_Sabar_all_stop(s1+kk-1,2:6) = Vadodara_Anand(kk,2:6);
% end
% s1 = size(Mum_Sabar_all_stop,1);
% x1 = Mum_Sabar_all_stop(s1,1);

% s2 = size(Anand_Ahmedabad,1);
% for kk = 2:s2
%     Mum_Sabar_all_stop(s1+kk-1,1) = x1 + Anand_Ahmedabad(kk,1);
%     Mum_Sabar_all_stop(s1+kk-1,2:6) = Anand_Ahmedabad(kk,2:6);
% end
% s1 = size(Mum_Sabar_all_stop,1);
% x1 = Mum_Sabar_all_stop(s1,1);

% s2 = size(Ahmedabad_Sabarmati,1);
% for kk = 2:s2
%     Mum_Sabar_all_stop(s1+kk-1,1) = x1 + Ahmedabad_Sabarmati(kk,1);
%     Mum_Sabar_all_stop(s1+kk-1,2:6) = Ahmedabad_Sabarmati(kk,2:6);
% end
% s1 = size(Mum_Sabar_all_stop,1);
% x1 = Mum_Sabar_all_stop(s1,1);

% train_prof = Mum_Sabar_all_stop; 

% fid12 = fopen('output_Mumbai_Sabarmati_All_Stop.txt','w');
% xx = size(train_prof,1);

% for ii = 1:xx
%     fprintf(fid12,'%5d %10.5f %10.5f %10.5f %10.5f %10.5f\n',train_prof(ii,1),...
%         train_prof(ii,2),train_prof(ii,3),train_prof(ii,4),train_prof(ii,5),train_prof(ii,6));
% end

% plot_all;

% fclose(fid1);      fclose(fid2);      fclose(fid3);        fclose(fid4);
% fclose(fid5);      fclose(fid6);      fclose(fid7);        fclose(fid8);
% fclose(fid9);      fclose(fid10);     fclose(fid11);       fclose(fid12);  


% Format specification and array size
formatspec = '%g %g %g %g %g %g';
sizeA = [6 Inf];

% Initialize combined dataset
Mum_Sabar_all_stop = [];

% Loop through all section pairs
for i_section = 1:number_of_sections
    % Generate filenames dynamically
    filename = sprintf('Output_%d(%d).txt', i_section, i_section + 1);

    % Open the file
    fid = fopen(filename, 'r');

    % Read data
    arr = fscanf(fid, formatspec, sizeA)';
    
    % Close the file
    fclose(fid);

    % Append data to the combined dataset
    if isempty(Mum_Sabar_all_stop)
        % First file: directly append all data
        Mum_Sabar_all_stop = arr;
    else
        % For subsequent files, append with time adjustment
        s1 = size(Mum_Sabar_all_stop, 1);
        x1 = Mum_Sabar_all_stop(s1, 1); % Last time value of previous file
        s2 = size(arr, 1);

        for kk = 2:s2
            Mum_Sabar_all_stop(s1 + kk - 1, 1) = x1 + arr(kk, 1);
            Mum_Sabar_all_stop(s1 + kk - 1, 2:6) = arr(kk, 2:6);
        end
    end
end

% Write the combined dataset to a file
output_filename = 'output_Mumbai_Sabarmati_All_Stop.txt';
fid = fopen(output_filename, 'w');
xx = size(Mum_Sabar_all_stop, 1);

for ii = 1:xx
    fprintf(fid, '%5d %10.5f %10.5f %10.5f %10.5f %10.5f\n', ...
        Mum_Sabar_all_stop(ii, 1), Mum_Sabar_all_stop(ii, 2), ...
        Mum_Sabar_all_stop(ii, 3), Mum_Sabar_all_stop(ii, 4), ...
        Mum_Sabar_all_stop(ii, 5), Mum_Sabar_all_stop(ii, 6));
end

% Close the output file
fclose(fid);

% Plotting (if required)
% plot_all;
