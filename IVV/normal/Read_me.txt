step 1-> Open the "Induced_voltage_victim.m" file. This file contains the codes to calculate the induced voltage under normal operating conditions (all TSS are operating). 

step 2-> Load the required variables obtained from the load flow program as "load('FILE_NAME.mat')" in "load('variable_code_Zshort_Zg_3train_hour.mat')". Here, the "variable_code_Zshort_Zg_3train_hour.mat" file contains all the workspace variables which are generated after the execution of the load flow program of the Mumbai-Ahmedabad track for three trains running per hour under normal operating conditions (all TSS are operating). 

step 3 -> Run the "Induced_voltage_victim.m" file in MATLAB or GNU Octave.

Step 4 -> Two pop-up windows will be displayed showing the plots of induced voltage of all main windings and teaser windings for the entire time period of operation. 

step 5 -> Then a user input, i.e. "Enter the time instant (in second) at which induced voltage along the track needs to be observed: " will be asked in the command window, and the user should enter the specific time instant at which he/she wants to observe theinduced voltage along the entire track. Then, a pop-up window will be displayed showing the plot of the same.