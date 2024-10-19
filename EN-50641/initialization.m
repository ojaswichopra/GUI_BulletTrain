% clear
% clc
% close all
% format long;
datafile;
D=HS_train_A_F_data(2:end,3);   %distance covered (km) at each second for up-track high-speed trains (101 & 103)
P=HS_train_A_F_data(2:end,4);   %power consumed (MW) at each second for up-track high-speed trains (101 & 103)
D_SUB=SUB_train_A_F_data(2:end,3);  %distance covered (km) at each second for sub-urban train 201
P_SUB=SUB_train_A_F_data(2:end,4);  %power consumed (MW) at each second for sub-urban train 201
D_FR=FR_train_A_F_data(2:end,3); %distance covered (km) at each second for Freight train 301
P_FR=FR_train_A_F_data(2:end,4); %power consumed (MW) at each second for Freight train 301
D_F_A=HS_train_F_A_data(2:end,3); %distance covered (km) at each second for down-track high-speed trains (102 & 104)
P_F_A=HS_train_F_A_data(2:end,4); %power consumed (MW) at each second for down-track high-speed trains (102 & 104)
% N=input('enter the no. of trains running per hour = ');
% N=2; %number of trains running per hour
% N_hr=16;    % the no. of hours of train scheduling per day (from morning 6 am to night 10 pm)
% n=N_hr*N;   %total no. of trains 
n=4;   %total no. of up-track (A to F) trains 
start_time_1=0; %starting time (sec) of 1st up-track train (Train 101)
start_time_2=5*60; %starting time (sec) of 2nd up-track train (Train 201)
start_time_3=30*60; %starting time (sec) of 3rd up-track train (Train 103)
start_time_4=35*60; %starting time (sec) of 4th up-track train (Train 301)
n_F_A=2;   %total no. of down-track (F to A) trains
start_time_1_F_A=10*60; %starting time (sec) of 1st down-track train
start_time_2_F_A=40*60; %starting time (sec) of 2nd down-track train
% x=((n-1)*(60/N))*60;    %starting time of last train in second
% time_rapid_train=7620;   %time taken by one rapid train (Mumbai to Sabarmati) is 2hr 7min i.e 7620 sec 
% time_each_stop_train=10680;   %time taken by one each stop train (Mumbai to Sabarmati) is 2hr 58min i.e 10680 sec
HS_train_time=32*60;  % time (sec) taken by high-speed trains to travel from station A to station F (or) F to A
SUB_train_time=length(SUB_train_A_F_data(2:end,1)); % time (sec) taken by sub-urban train (201) to travel from A to F
FR_train_time=length(FR_train_A_F_data(2:end,1)); % time (sec) taken by Freight train (301) to travel from A to F
% y=x+time_each_stop_train;    %ending time of last train in second i.e no. of rows
y=start_time_4+FR_train_time;   %ending time of last up-track train in second i.e no. of rows (no. of time instants (sec) of operation of up-track)   
y_F_A=start_time_2_F_A+HS_train_time;   %ending time of last down-track train in second i.e no. of rows (no. of time instants (sec) of operation of down-track)
z=n+1;   %no. of columns (one extra column for time)
z_F_A=n_F_A+1;   %no. of columns (one extra column for time)
y_whole=max(y,y_F_A);  % total no. of time instants (sec) of operation for the whole traction n/w (i.e. no. of rows)
distance=zeros(y_whole,z);     
power=-100*ones(y_whole,z);
distance_F_A=zeros(y_whole,z_F_A);     
power_F_A=-100*ones(y_whole,z_F_A);

for t=1:y_whole
    distance(t,1)=t;   %time column of distance matrix
    power(t,1)=t;   %time column of power matrix
end
for t=1:y_whole
    distance_F_A(t,1)=t;   %time column of distance matrix
    power_F_A(t,1)=t;   %time column of power matrix
end

% for j=1:n
% p=1+(((j-1)*(60/N))*60);
% q=p+train_time-1;
% distance(p:q,(j+1))=D;
% power(p:q,(j+1))=P;
% end
distance(1+start_time_1:start_time_1+HS_train_time,2)=D;   %distance covered (km) at each second for 1st up-track train
power(1+start_time_1:start_time_1+HS_train_time,2)=P;      %power consumed (MW) at each second for 1st up-track train
distance(1+start_time_2:start_time_2+SUB_train_time,3)=D_SUB;   %distance covered (km) at each second for 2nd up-track train
power(1+start_time_2:start_time_2+SUB_train_time,3)=P_SUB;      %power consumed (MW) at each second for 2nd up-track train
distance(1+start_time_3:start_time_3+HS_train_time,4)=D;   %distance covered (km) at each second for 3rd up-track train
power(1+start_time_3:start_time_3+HS_train_time,4)=P;      %power consumed (MW) at each second for 3rd up-track train
distance(1+start_time_4:start_time_4+FR_train_time,5)=D_FR;   %distance covered (km) at each second for 4th up-track train
power(1+start_time_4:start_time_4+FR_train_time,5)=P_FR;      %power consumed (MW) at each second for 4th up-track train

distance_F_A(1+start_time_1_F_A:start_time_1_F_A+HS_train_time,2)=100-D_F_A;   %distance covered (km) at each second for 1st down-track train
power_F_A(1+start_time_1_F_A:start_time_1_F_A+HS_train_time,2)=P_F_A;      %power consumed (MW) at each second for 1st down-track train
distance_F_A(1+start_time_2_F_A:start_time_2_F_A+HS_train_time,3)=100-D_F_A;   %distance covered (km) at each second for 2nd down-track train
power_F_A(1+start_time_2_F_A:start_time_2_F_A+HS_train_time,3)=P_F_A;      %power consumed (MW) at each second for 2nd down-track train

% TSS=TSS*10^3;   %distance of TSS in meters
N_TSS=length(TSS);  %no. of TSS
%  l_a=2*N_TSS+1;
%  d(1)=0; %starting point
%  d(2:2:l_a)=TSS; 
%  for h=2:2:(l_a-3)
%      u=d(h);
%      v=d(h+2);
%      w=(v-u)/2;
%      d(h+1)=d(h)+w;  
%  end
% d(l_a)=d(l_a-1)+(25*10^3);   %ending point i.e. last SP is assumed to be roughly at 25km away from the last TSS.
d=[0 100.05];  % starting & ending point position (km)
%distance (in meter) of all the TSSs and the section posts measured from Mumbai i.e. [0 TSS1 SP1 TSS2 SP2..........TSSn SPn].
%It is assumed that in the middle of two consecutive TSSs, one SP is located.

% AT=AT*10^3;   %distance of ATs in meters

% i_A=-10*ones(l_a-1,10);
% i_B=zeros(l_a-1,10);
% i_h=zeros(l_a-1,10);
% 
% %line data matrix initialization
% dTSS=zeros((l_a-1)*y,15);
% 
% %bus data matrix initialization
% pTSS=-10*ones((l_a-1)*y,15);
% 
% %bus type matrix initialization
% tTSS=zeros((l_a-1)*y,15);