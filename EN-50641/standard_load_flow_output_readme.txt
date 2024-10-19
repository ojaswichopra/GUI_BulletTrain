These are the various options to be displayed under the load flow output module of the EN-50641 standard. To run all these, first, we have to load the ".mat" file i.e. "required_variable_load_flow_standard.mat", which has been saved earlier in the load flow execution module of the standard. This is the common step (step-2) in all the below options of load flow output. So, instead of loading this file again and again for all the options of load flow output, we can load it only once beforehand (i.e. after the user selects the load flow output module of the standard, we can load the corresponding ".mat" file at that time) and then run the following various options of load flow output without loading the ".mat" file again and again (in that case, the step-2 will be eliminated from all the below options of load flow output and so the load command has to be commented out in all the corresponding backend codes). In this case, loading the ".mat" file takes very little time, around 2 seconds in Octave, as the file size is very small, around 8 MB.

1. Train timetable plot

step 1 -> Open the backend code "timetable_plot.m".
step 2 -> Change the load command in "load('required_variable_load_flow_standard.mat')" as "load('FILE_NAME.mat')". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "timetable_plot.m"
step 4 -> After the code is run completely, a figure will be displayed. The user should be able to save that figure based on his/her interest.

2. Speed and Tractive Effort of Train 101

step 1 -> Open the backend code "speed_TE_plot.m".
step 2 -> Change the load command in "load('required_variable_load_flow_standard.mat')" as "load('FILE_NAME.mat')". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "speed_TE_plot.m"
step 4 -> After the code is run completely, a figure will be displayed. The user should be able to save that figure based on his/her interest.


3. Current and Voltage profile of Train 101 along the track

step 1 -> Open the backend code "train_101_voltage_current_profile.m".
step 2 -> Change the load command in "load('required_variable_load_flow_standard.mat')" as "load('FILE_NAME.mat')". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "train_101_voltage_current_profile.m"
step 4 -> After the code is run completely, a figure will be displayed. The user should be able to save that figure based on his/her interest.

4. Contact and Feeder bus bar voltage at the substation

step 1 -> Open the backend code "sub_station_voltage_plot.m".
step 2 -> Change the load command in "load('required_variable_load_flow_standard.mat')" as "load('FILE_NAME.mat')". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "sub_station_voltage_plot.m"
step 4 -> After the code is run completely, a figure will be displayed. The user should be able to save that figure based on his/her interest.

5. Contact and Feeder total current at the substation

step 1 -> Open the backend code "sub_station_current_plot.m".
step 2 -> Change the load command in "load('required_variable_load_flow_standard.mat')" as "load('FILE_NAME.mat')". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "sub_station_current_plot.m"
step 4 -> After the code is run completely, a figure will be displayed. The user should be able to save that figure based on his/her interest.

 
