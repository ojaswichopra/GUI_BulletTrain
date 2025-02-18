step 1 -> open the file name "code_run_adjecent_outage_gnu.m" .
  
step 3 -> run "code_run_adjecent_outage_gnu.m" file on GNU OCTAVE or MATLAB. 
note 1: it will ask for "enter the no. of trains running per hour = " is the frequency of train per hour, user need to feed and integer no 1 to n.
note 2: it will ask for "enter the no. of hours of train scheduling per day = " user need to feed the total time user want to run trains in the track
note 4: it will ask for "Enter the TSS numbers (in ascending order) which are out of service (separated by comma or space): " user need to feed the TSS numbers which is out of service for example: 5 6
note 5: process is completed after it shows "percentage_completion =100"
step 6 -> now module to get train voltage , voltage variation throughout the track at perticular time instant, MVA profile of the TSS  are as below:
  
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%% module to get any train voltage %% ==> done

step 1-> open the file name "train_voltage_profile_with_train_number_adjacent_outage_load_file.m" .
s
step 3 -> Run "train_voltage_profile_with_train_number_adjacent_outage_load_file.m" 
Step 4 -> enter the no of train running in the track per hour (train frequency)
step 5 -> enter the train number needs to be investigate (i.e. an integer number) to get the plot of train contact , rail voltage vs distance and time.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%% module to get voltage profile of full track at perticular time instant %%
step 1-> open the file name "Full_up_track_voltage_profile_2_outage.m"  and "Full_down_track_voltage_profile_2_outage".

step 3-> enter the time instant for which voltage profile of the track needs to be investigated in sec and the distance resolution in meter (like 10 ) 
step 4 -> Run "Full_UP_track_voltage_profile_instant_t_outage.m" to get the voltage magnitude plot of whole up track during the investigated time instant.
   -----------  ------- there are some sub module of voltage profile of ALL ATs and TSSs which user may interested -------------------------------------------
		%%% sub module 1 Voltage profile of all ATs at the entered time instant %%%
			step 1-> after running above module open file name "voltage_profile_design_predetermine_AT_outage.m"
			step 2 -> Run "voltage_profile_design_predetermine_AT_outage.m" to get the voltage magnitude plot of all ATs during the investigated time instant.
		
step 4 -> Run "Full_Down_track_voltage_profile_instant_t_outage.m" to get the voltage magnitude plot of whole up track during the investigated time instant.
   -----------  ------- there are some sub module of voltage profile of ALL ATs and TSSs which user may interested -------------------------------------------
		%%% sub module 1 Voltage profile of all ATs at the entered time instant %%%
			step 1-> after running above module open file name "voltage_profile_design_predetermine_AT_outage.m"
			step 2 -> Run "voltage_profile_design_predetermine_AT_outage.m" to get the voltage magnitude plot of all ATs during the investigated time instant.
		
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

4. MVA profile of TSS ==> DONE

step 1 -> Open the backend code "TSS_MVA_profile_outage.m".
step 2 -> Change the load command in "load("variable_load_flow_mum_to_ahm_each_stop.mat")" as "load("FILE_NAME.mat")". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "TSS_MVA_profile.m"
step 4 -> Enter the TSS number to see its MVA profile. (This is the user input)
step 5 -> After the code is run completely, a figure will be displayed. The user should be able to save that figure based on his/her interest.



5. MVA profile of AT ==> done

step 1 -> Open the backend code "AT_MVA_profile_outage.m".
step 2 -> Change the load command in "load("variable_load_flow_mum_to_ahm_each_stop.mat")" as "load("FILE_NAME.mat")". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "AT_MVA_profile.m"
step 4 -> Enter the AT number to see its MVA profile. (This is the user input)
step 5 -> After the code is run completely, a figure will be displayed. The user should be able to save that figure based on his/her interest.

 
6. Maximum MVA of all TSS  ==> DONE

step 1 -> Open the backend code "TSS_maximum_MVA_outage.m".
step 2 -> Change the load command in "load("variable_load_flow_mum_to_ahm_each_stop.mat")" as "load("FILE_NAME.mat")". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "TSS_maximum_MVA.m"
step 4 -> After the code is run completely, the maximum MVA values of all TSS will be displayed on the command window. Create a Table on GUI showing these maximum MVA values of all TSS (refer to the figure TSS_maximum_MVA_table_ref.png).
step 5 -> The user should be able to save the table based on his/her interest.

7. Maximum MVA of all AT  ==> DONE

step 1 -> Open the backend code "AT_maximum_MVA_outage.m".
step 2 -> Change the load command in "load("variable_load_flow_mum_to_ahm_each_stop.mat")" as "load("FILE_NAME.mat")". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "AT_maximum_MVA.m"
step 4 -> After the code is run completely, a figure will be displayed. The user should be able to save that figure based on his/her interest.

8. Voltage unbalance profile of TSS ==> DONE

step 1 -> Open the backend code "TSS_voltage_unbalance_profile_outage.m".
step 2 -> Change the load command in "load("variable_load_flow_mum_to_ahm_each_stop.mat")" as "load("FILE_NAME.mat")". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "TSS_voltage_unbalance_profile.m"
step 4 -> Enter the TSS number to see its voltage unbalance profile. (This is the user input)
step 5 -> After the code is run completely, a figure will be displayed. The user should be able to save that figure based on his/her interest.

9. Maximum voltage unbalance of all TSS ==> DONE

step 1 -> Open the backend code "TSS_maximum_voltage_unbalance_outage.m".
step 2 -> Change the load command in "load("variable_load_flow_mum_to_ahm_each_stop.mat")" as "load("FILE_NAME.mat")". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "TSS_maximum_voltage_unbalance.m"
step 4 -> After the code is run completely, the maximum voltage unbalance values of all TSS will be displayed on the command window. Create a Table on GUI showing these maximum voltage unbalance values of all TSS (refer to the figure TSS_maximum_voltage_unbalance_table_ref.png).
step 5 -> The user should be able to save the table based on his/her interest.
