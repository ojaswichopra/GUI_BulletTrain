<<<<<<< HEAD
step 1 -> open the file name "code_run.m" .
step 2 -> open the file name "save_variable.m" ; change the name of the output file name as per user in "save('variable_code_Zshort_Zg_3train_hour.mat');" as "save('FILE_NAME.mat');"  
step 3 -> run "code_run.m" file on GNU OCTAVE or MATLAB. 
note 1: it will ask for "the no. of trains running per hour" is the frequency of train per hour, user need to feed and integer no 1 to n.
note 2: it will ask for "number of hours of train scheduling per day" user need to feed the total time user want to run trains in the track
note 3: process is completed after it shows "percentage_completion =100"
step 4 -> now module to get train voltage , voltage variation at perticular distance for through out the time , voltage variation throughout the track at perticular time instant,voltage profile for predetermined TSS and ATs, MVA profile of the TSS  are as below:
  
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%% module to get 1st train voltage %%

step 1-> open the file name "train_voltage_profile.m" .
step 2-> change the load file in  "load("variable_code_Zshort_Zg_3train_hour.mat")" as  "load("FILE_NAME.mat")"
step 3 -> Run "train_voltage_current_profile.m" to get the plot of train contact , rail voltage vs distance and time.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%% module to get any train voltage %%

step 1-> open the file name "train_voltage_profile_with_train_number.m" .
step 2-> change the load file in  "load("variable_code_Zshort_Zg_3train_hour.mat")" as  "load("FILE_NAME.mat")"
step 3 -> Run "train_voltage_profile_with_train_number.m" 
Step 4 -> enter the no of train running in the track per hour (train frequency)
step 5 -> enter the train number needs to be investigate (i.e. an integer number) to get the plot of train contact , rail voltage vs distance and time.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

%% voltage variation at perticular distance for through out the time  %%
step 1-> open the file name "voltage_variation_over_day_final.m" .
step 2-> change the load file in  "load("variable_code_Zshort_Zg_3train_hour.mat")" as  "load("FILE_NAME.mat")"
step 3-> Enter the distance from starting point (i.e mumbai here) in km needs to investigate.
step 4 -> Run "voltage_variation_over_day_final.m" to get the plot of voltages for contact, rail and feeder at user input location for throughout the time period.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%% module to get voltage profile of full track at perticular time instant %%
step 1-> open the file name "Full_track_voltage_profile_instant_t.m" .
step 2-> change the load file in  "load("variable_code_Zshort_Zg_3train_hour.mat")" as  "load("FILE_NAME.mat")"
step 3-> enter the time instant for which voltage profile of the track needs to be investigated in sec and the distance resolution in meter (like 10 ) 
step 4 -> Run "Full_track_voltage_profile_instant_t.m" to get the voltage magnitude plot of whole track durring the invesigated time instant.
   -----------  ------- there are some sub module of voltage profile of ALL ATs and TSSs which user may interested -------------------------------------------
		%%% sub module 1 Voltage profile of all ATs at the entered time instant %%%
			step 1-> after running above module open file name "voltage_profile_design_predetermine_AT.m"
			step 2 -> Run "voltage_profile_design_predetermine_AT.m" to get the voltage magnitude plot of all ATs durring the invesigated time instant.
		%%% sub module 1 Voltage profile of all TSS's at the entered time instant %%%
			step 1-> after running above module open file name "voltage_profile_design_predetermine_TSS.m"
			step 2 -> Run "voltage_profile_design_predetermine_TSS.m" to get the voltage magnitude plot of all TSS's durring the invesigated time instant.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

%% module to get TSS MVA Profile and unbalance profile %%
step 1 -> open the file name "overall_MVA_TSS_calulation.m".
step 2-> change the load file in  "load("variable_code_Zshort_Zg_3train_hour.mat")" as  "load("FILE_NAME.mat")"
step 3 -> Run "overall_MVA_TSS_calulation.m" to get the MVA of all TSS's.
=======
step 1 -> open the file name "code_run.m" .
step 2 -> open the file name "save_variable.m" ; change the name of the output file name as per user in "save('variable_code_Zshort_Zg_3train_hour.mat');" as "save('FILE_NAME.mat');"  
step 3 -> run "code_run.m" file on GNU OCTAVE or MATLAB. 
note 1: it will ask for "the no. of trains running per hour" is the frequency of train per hour, user need to feed and integer no 1 to n.
note 2: it will ask for "number of hours of train scheduling per day" user need to feed the total time user want to run trains in the track
note 3: process is completed after it shows "percentage_completion =100"
step 4 -> now module to get train voltage , voltage variation at perticular distance for through out the time , voltage variation throughout the track at perticular time instant,voltage profile for predetermined TSS and ATs, MVA profile of the TSS  are as below:
  
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%% module to get 1st train voltage %%

step 1-> open the file name "train_voltage_profile.m" .
step 2-> change the load file in  "load("variable_code_Zshort_Zg_3train_hour.mat")" as  "load("FILE_NAME.mat")"
step 3 -> Run "train_voltage_current_profile.m" to get the plot of train contact , rail voltage vs distance and time.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%% module to get any train voltage %%

step 1-> open the file name "train_voltage_profile_with_train_number.m" .
step 2-> change the load file in  "load("variable_code_Zshort_Zg_3train_hour.mat")" as  "load("FILE_NAME.mat")"
step 3 -> Run "train_voltage_profile_with_train_number.m" 
Step 4 -> enter the no of train running in the track per hour (train frequency)
step 5 -> enter the train number needs to be investigate (i.e. an integer number) to get the plot of train contact , rail voltage vs distance and time.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

%% voltage variation at perticular distance for through out the time  %%
step 1-> open the file name "voltage_variation_over_day_final.m" .
step 2-> change the load file in  "load("variable_code_Zshort_Zg_3train_hour.mat")" as  "load("FILE_NAME.mat")"
step 3-> Enter the distance from starting point (i.e mumbai here) in km needs to investigate.
step 4 -> Run "voltage_variation_over_day_final.m" to get the plot of voltages for contact, rail and feeder at user input location for throughout the time period.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%% module to get voltage profile of full track at perticular time instant %%
step 1-> open the file name "Full_track_voltage_profile_instant_t.m" .
step 2-> change the load file in  "load("variable_code_Zshort_Zg_3train_hour.mat")" as  "load("FILE_NAME.mat")"
step 3-> enter the time instant for which voltage profile of the track needs to be investigated in sec and the distance resolution in meter (like 10 ) 
step 4 -> Run "Full_track_voltage_profile_instant_t.m" to get the voltage magnitude plot of whole track durring the invesigated time instant.
   -----------  ------- there are some sub module of voltage profile of ALL ATs and TSSs which user may interested -------------------------------------------
		%%% sub module 1 Voltage profile of all ATs at the entered time instant %%%
			step 1-> after running above module open file name "voltage_profile_design_predetermine_AT.m"
			step 2 -> Run "voltage_profile_design_predetermine_AT.m" to get the voltage magnitude plot of all ATs durring the invesigated time instant.
		%%% sub module 1 Voltage profile of all TSS's at the entered time instant %%%
			step 1-> after running above module open file name "voltage_profile_design_predetermine_TSS.m"
			step 2 -> Run "voltage_profile_design_predetermine_TSS.m" to get the voltage magnitude plot of all TSS's durring the invesigated time instant.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

%% module to get TSS MVA Profile and unbalance profile %%
step 1 -> open the file name "overall_MVA_TSS_calulation.m".
step 2-> change the load file in  "load("variable_code_Zshort_Zg_3train_hour.mat")" as  "load("FILE_NAME.mat")"
step 3 -> Run "overall_MVA_TSS_calulation.m" to get the MVA of all TSS's.
>>>>>>> a6b21b859934a8cd5093e7439821c631fce9c22b
step 4->  Maximum MVA and maximum unbalace will be shown in comand window 