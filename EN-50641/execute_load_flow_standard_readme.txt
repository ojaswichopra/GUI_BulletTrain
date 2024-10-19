These are the inputs required from the user while executing the load flow of the EN-50641 standard. All the inputs are used in two backend files i.e. "datafile.m" and "HSR.m"

1. Upload the system data file  (the user should upload the "system_data_file_standard.txt" file)

2. Upload the timetable of the high-speed (HS) train running from station A to F (the user should upload the "HS_Train_A_to_F_no_coasting_timetable.txt" file)

3. Upload the timetable of the high-speed (HS) train running from station F to A (the user should upload the "HS_Train_F_to_A_with_coasting_timetable.txt" file)

4. Upload the timetable of the sub-urban (SUB) train running from station A to F (the user should upload the "SUB_Train_A_to_F_timetable.txt" file)

5. Upload the timetable of the freight (FR) train running from station A to F (the user should upload the "FR_Train_A_to_F_with_coasting_timetable.txt" file)

After taking these inputs from the user, the backend code "code_run.m" should be called to execute the load flow.