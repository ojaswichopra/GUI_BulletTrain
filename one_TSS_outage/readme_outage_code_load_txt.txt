step 1 -> open the file name "code_run_outage.m" .
step 2 -> open the file name "save_variable.m" ; change the name of the output file name as per user in "save('sample_filename_outage.mat');" as "save('FILE_NAME.mat');"  
step 3 -> run "code_run_outage.m" file on GNU OCTAVE or MATLAB. 
note 1: it will ask for "enter the no. of trains running per hour = " is the frequency of train per hour; the user needs to feed an integer no 1 to n.
note 2: it will ask for "enter the no. of hours of train scheduling per day = "The user needs to feed the total time the user wants to run trains on the track
note 4: it will ask for "enter the TSS number which is out of service = "The user needs to feed the TSS number which is out of service
note 5: the process is completed after it shows "percentage_completion =100"
step 6 -> Now module to get train voltage, voltage variation at a particular distance throughout the time, voltage variation throughout the track at a particular time instant, voltage profile for predetermined TSS and ATs, MVA profile of the TSS  are as below:
  
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%% module to get any train voltage %%

step 1-> open the file name "train_voltage_profile_with_train_number_outage_load_txt.m" .

step 3 -> Run "train_voltage_profile_with_train_number_outage_load_txt.m" 
Step 4 -> enter the no of train running in the track per hour (train frequency)
step 5 -> enter the train number needs to be investigate (i.e. an integer number) to get the plot of train contact , rail voltage vs distance and time.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%% module to get voltage profile of full track at perticular time instant %%
step 1-> open the file name "Full_track_voltage_profile_instant_t_outage_load_txt.m" .

step 3-> enter the time instant for which voltage profile of the track needs to be investigated in sec and the distance resolution in meter (like 10 ) 
step 4 -> Run "Full_track_voltage_profile_instant_t_outage_load_txt.m" to get the voltage magnitude plot of whole track during the investigated time instant.
   -----------  ------- there are some sub module of voltage profile of ALL ATs and TSSs which user may interested -------------------------------------------
		%%% sub module 1 Voltage profile of all ATs at the entered time instant %%%
			step 1-> after running above module open file name "voltage_profile_design_predetermine_AT_outage.m"
			step 2 -> Run "voltage_profile_design_predetermine_AT_outage.m" to get the voltage magnitude plot of all ATs during the investigated time instant.
		%%% sub module 1 Voltage profile of all TSS's at the entered time instant %%%
			step 1-> after running above module open file name "voltage_profile_design_predetermine_TSS_outage.m"
			step 2 -> Run "voltage_profile_design_predetermine_TSS_outage.m" to get the voltage magnitude plot of all TSS's during the investigated time instant.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

%% module to get TSS MVA Profile and unbalance profile %%
step 1 -> open the file name "TSS_MVA_voltage_unbalance_profile_plot_outage_load_txt.m".

step 3 -> Run "TSS_MVA_voltage_unbalance_profile_plot_outage_load_txt.m" to get the MVA of all TSS's.
step 4->  Maximum MVA and maximum unbalance will be shown in command window 