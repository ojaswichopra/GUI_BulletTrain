fclose all;
format long;

% %distance in km of all the TSSs measured from mumbai
% TSS = [5 55 105 155 205 255 305 355 405 455 505];

% %distance in km of all the ATs measured from mumbai
% AT = [3 13 23 33 43	53 63 73 83	93 103 113 123 133 143 153 163 173 183 193 203 213 223 233 243 253 263 273 283 293 303 313 323 333 343 353 363 373 383 393 403 413 423 433 443 453 463 473 483 493 503 513];

TSS = num2cell(TSS);
TSS = cell2mat(TSS);
AT = num2cell(AT);
AT = cell2mat(AT);

fid=fopen('train_timetable.txt','r');
header=fscanf(fid,'%s %s %s %s',[4 1]);
each_stop_train_data_1=fscanf(fid,'%f %f %f %f',[4 10680]);
each_stop_train_data=each_stop_train_data_1';
fclose(fid);

% each_stop_train_data = dlmread('Mumbai_Ahm_all_stop_train_schedule.txt', ' ', 1, 0);
