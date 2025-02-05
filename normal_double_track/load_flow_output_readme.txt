These are the various options to be displayed under the load flow output module. To run all these, first, we have to load the ".mat" file which has been saved earlier in the load flow execution module. This is the common step (step-2) in all the below options of load flow output. Loading this ".mat" file takes much more time (around 20-30 minutes) in Octave. So, instead of loading this file again and again for all the options of load flow output, we can load it only once beforehand (i.e. after the user selects the load flow output module of a particular track, we can load the corresponding ".mat" file at that time) and then run the following various options of load flow output without loading the ".mat" file again and again (in that case, the step-2 will be eliminated from all the below options of load flow output and so the load command has to be commented out in all the corresponding backend codes). 


1. Voltage profile at a particular time instant

----> Voltage profile of the entire track at a particular time instant
step 1 -> Open the backend code "Full_track_voltage_profile_instant_t.m".
step 2 -> Change the load command in "load("variable_load_flow_mum_to_ahm_each_stop.mat")" as "load("FILE_NAME.mat")". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "Full_track_voltage_profile_instant_t.m" 
step 4 -> Enter the time instant (in sec) at which the voltage profile of the track needs to be investigated and enter the distance resolution (in meter). (These are the user inputs)
step 5 -> After the code is run completely, a figure will be displayed. The user should be able to save that figure based on his/her interest.

------------------ there are two sub-modules inside this which should be run after running the above module-----------------------

		----> Sub-module 1 : Voltage profile of all TSSs at the previously entered time instant
			step 1 -> Run the backend code "voltage_profile_design_predetermine_TSS.m"
			step 2 -> After the code is run completely, a figure will be displayed. The user should be able to save that figure based on his/her interest.

		----> Sub-module 2 : Voltage profile of all ATs at the previously entered time instant
			step 1 -> Run the backend code "voltage_profile_design_predetermine_AT.m"
			step 2 -> After the code is run completely, a figure will be displayed. The user should be able to save that figure based on his/her interest.

2. Voltage profile at a particular distance

step 1 -> Open the backend code "voltage_variation_over_day_final.m".
step 2 -> Change the load command in "load("variable_load_flow_mum_to_ahm_each_stop.mat")" as "load("FILE_NAME.mat")". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "voltage_variation_over_day_final.m"
step 4 -> Enter the distance (in Km) from starting point at which the voltage profile over entire durations of train scheduling needs to be investigated. (This is the user input)
step 5 -> After the code is run completely, a figure will be displayed. The user should be able to save that figure based on his/her interest.

3. Voltage profile of a particular train

step 1 -> Open the backend code "train_voltage_profile_with_train_number.m".
step 2 -> Change the load command in "load("variable_load_flow_mum_to_ahm_each_stop.mat")" as "load("FILE_NAME.mat")". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "train_voltage_profile_with_train_number.m"
step 4 -> Enter the number of trains running per hour and the train number to see its voltage profile. (These are the user inputs)
step 5 -> After the code is run completely, a figure will be displayed. The user should be able to save that figure based on his/her interest.

4. MVA profile of TSS

step 1 -> Open the backend code "TSS_MVA_profile.m".
step 2 -> Change the load command in "load("variable_load_flow_mum_to_ahm_each_stop.mat")" as "load("FILE_NAME.mat")". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "TSS_MVA_profile.m"
step 4 -> Enter the TSS number to see its MVA profile. (This is the user input)
step 5 -> After the code is run completely, a figure will be displayed. The user should be able to save that figure based on his/her interest.

5. MVA profile of AT

step 1 -> Open the backend code "AT_MVA_profile.m".
step 2 -> Change the load command in "load("variable_load_flow_mum_to_ahm_each_stop.mat")" as "load("FILE_NAME.mat")". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "AT_MVA_profile.m"
step 4 -> Enter the AT number to see its MVA profile. (This is the user input)
step 5 -> After the code is run completely, a figure will be displayed. The user should be able to save that figure based on his/her interest.

6. Maximum MVA of all TSS

step 1 -> Open the backend code "TSS_maximum_MVA.m".
step 2 -> Change the load command in "load("variable_load_flow_mum_to_ahm_each_stop.mat")" as "load("FILE_NAME.mat")". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "TSS_maximum_MVA.m"
step 4 -> After the code is run completely, the maximum MVA values of all TSS will be displayed on the command window. Create a Table on GUI showing these maximum MVA values of all TSS (refer to the figure TSS_maximum_MVA_table_ref.png).
step 5 -> The user should be able to save the table based on his/her interest.

7. Maximum MVA of all AT

step 1 -> Open the backend code "AT_maximum_MVA.m".
step 2 -> Change the load command in "load("variable_load_flow_mum_to_ahm_each_stop.mat")" as "load("FILE_NAME.mat")". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "AT_maximum_MVA.m"
step 4 -> After the code is run completely, a figure will be displayed. The user should be able to save that figure based on his/her interest.

8. Voltage unbalance profile of TSS

step 1 -> Open the backend code "TSS_voltage_unbalance_profile.m".
step 2 -> Change the load command in "load("variable_load_flow_mum_to_ahm_each_stop.mat")" as "load("FILE_NAME.mat")". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "TSS_voltage_unbalance_profile.m"
step 4 -> Enter the TSS number to see its voltage unbalance profile. (This is the user input)
step 5 -> After the code is run completely, a figure will be displayed. The user should be able to save that figure based on his/her interest.

9. Maximum voltage unbalance of all TSS

step 1 -> Open the backend code "TSS_maximum_voltage_unbalance.m".
step 2 -> Change the load command in "load("variable_load_flow_mum_to_ahm_each_stop.mat")" as "load("FILE_NAME.mat")". (Here, the ".mat" file, which has been saved after the load flow execution, needs to be loaded)
step 3 -> Run the backend code "TSS_maximum_voltage_unbalance.m"
step 4 -> After the code is run completely, the maximum voltage unbalance values of all TSS will be displayed on the command window. Create a Table on GUI showing these maximum voltage unbalance values of all TSS (refer to the figure TSS_maximum_voltage_unbalance_table_ref.png).
step 5 -> The user should be able to save the table based on his/her interest.





 
