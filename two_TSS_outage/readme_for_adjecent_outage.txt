step 1 -> open the file name "code_run_adjecent_outage_gnu.m" .
  
step 3 -> run "code_run_adjecent_outage_gnu.m" file on GNU OCTAVE or MATLAB. 
note 1: it will ask for "enter the no. of trains running per hour = " is the frequency of train per hour, user need to feed and integer no 1 to n.
note 2: it will ask for "enter the no. of hours of train scheduling per day = " user need to feed the total time user want to run trains in the track
note 4: it will ask for "Enter the TSS numbers (in ascending order) which are out of service (separated by comma or space): " user need to feed the TSS numbers which is out of service for example: 5 6
note 5: process is completed after it shows "percentage_completion =100"
step 6 -> now module to get train voltage , voltage variation throughout the track at perticular time instant, MVA profile of the TSS  are as below:
  
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%% module to get any train voltage %%

step 1-> open the file name "train_voltage_profile_with_train_number_adjacent_outage_load_file.m" .
s
step 3 -> Run "train_voltage_profile_with_train_number_adjacent_outage_load_file.m" 
Step 4 -> enter the no of train running in the track per hour (train frequency)
step 5 -> enter the train number needs to be investigate (i.e. an integer number) to get the plot of train contact , rail voltage vs distance and time.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%% module to get voltage profile of full track at perticular time instant %%
step 1-> open the file name "Full_track_voltage_profile_instant_t_adjecent_outage_load_file.m" .

step 3-> enter the time instant for which voltage profile of the track needs to be investigated in sec and the distance resolution in meter (like 10 ) 
step 4 -> Run "Full_track_voltage_profile_instant_t_adjecent_outage_load_file.m" to get the voltage magnitude plot of whole track durring the invesigated time instant.
   

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

%% module to get TSS MVA Profile and unbalance profile %%
step 1 -> open the file name "TSS_MVA_voltage_unbalance_profile_plot_outage_load_txt.m".

step 3 -> Run "TSS_MVA_voltage_unbalance_profile_plot_outage_load_txt.m" to get the MVA of all TSS's.
step 4->  Maximum MVA and maximum unbalace will be shown in comand window 