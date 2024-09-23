<<<<<<< HEAD

%distance in km of all the TSSs measured from mumbai
TSS = num2cell(TSS);
TSS = cell2mat(TSS);
AT = num2cell(AT);
AT = cell2mat(AT);

fid=fopen('Mumbai_Ahm_all_stop_train_schedule.txt','r');
header=fscanf(fid,'%s %s %s %s',[4 1]);
train_data_1=fscanf(fid,'%f %f %f %f',[4 train_time]);
% Here "10680" is the time (in sec) taken by the train to complete the route
% (should be taken as an input from the user while executing load flow)
train_data=train_data_1';
fclose(fid);

D=train_data(:,3);   %distance covered (m) at each second for each stop train
P=train_data(:,4);   %power consumed (kW) at each second for each stop train
%N=input('enter the no. of trains running per hour = ');   % 3 trains running per hour (N=3)
% N_hr=16;    % the no. of hours of train scheduling per day (from morning 6 am to night 10 pm)
%N_hr=input('Enter the number of hours of train scheduling per day = ');
n=N_hr*N;   %total no. of trains
x=((n-1)*(60/N))*60;    %starting time of last train in second
% time_rapid_train=7620;   %time taken by one rapid train (Mumbai to Sabarmati) is 2hr 7min i.e 7620 sec
% time_each_stop_train=10680;   %time taken by one each stop train (Mumbai to Sabarmati) is 2hr 58min i.e 10680 sec
%train_time=10680;  %time (sec) taken by one train to complete the route (the user input value should be used)
y=x+train_time;    %ending time of last train in second i.e no. of rows
z=n+1;   %no. of columns
distance=zeros(y,z);
power=-100*ones(y,z);

for t=1:y
distance(t,1)=t;   %time column of distance matrix
power(t,1)=t;   %time column of power matrix
end

for j=1:n
p=1+(((j-1)*(60/N))*60);
q=p+train_time-1;
distance(p:q,(j+1))=D;
power(p:q,(j+1))=P;
end

TSS=TSS*10^3;   %distance of TSS in meters
N_TSS=length(TSS);  %no. of TSS
l_a=2*N_TSS+1;
d(1)=0; %starting point
d(2:2:l_a)=TSS;
for h=2:2:(l_a-3)
u=d(h);
v=d(h+2);
w=(v-u)/2;
d(h+1)=d(h)+w;
end
d(l_a)=d(l_a-1)+(25*10^3);   %ending point i.e. last SP is assumed to be roughly at 25km away from the last TSS.
%distance (in meter) of all the TSSs and the section posts measured from Mumbai i.e. [0 TSS1 SP1 TSS2 SP2..........TSSn SPn].
%It is assumed that in the middle of two consecutive TSSs, one SP is located.

=======

%distance in km of all the TSSs measured from mumbai
TSS = num2cell(TSS);
TSS = cell2mat(TSS);
AT = num2cell(AT);
AT = cell2mat(AT);

fid=fopen('Mumbai_Ahm_all_stop_train_schedule.txt','r');
header=fscanf(fid,'%s %s %s %s',[4 1]);
train_data_1=fscanf(fid,'%f %f %f %f',[4 train_time]);
% Here "10680" is the time (in sec) taken by the train to complete the route
% (should be taken as an input from the user while executing load flow)
train_data=train_data_1';
fclose(fid);

D=train_data(:,3);   %distance covered (m) at each second for each stop train
P=train_data(:,4);   %power consumed (kW) at each second for each stop train
%N=input('enter the no. of trains running per hour = ');   % 3 trains running per hour (N=3)
% N_hr=16;    % the no. of hours of train scheduling per day (from morning 6 am to night 10 pm)
%N_hr=input('Enter the number of hours of train scheduling per day = ');
n=N_hr*N;   %total no. of trains
x=((n-1)*(60/N))*60;    %starting time of last train in second
% time_rapid_train=7620;   %time taken by one rapid train (Mumbai to Sabarmati) is 2hr 7min i.e 7620 sec
% time_each_stop_train=10680;   %time taken by one each stop train (Mumbai to Sabarmati) is 2hr 58min i.e 10680 sec
%train_time=10680;  %time (sec) taken by one train to complete the route (the user input value should be used)
y=x+train_time;    %ending time of last train in second i.e no. of rows
z=n+1;   %no. of columns
distance=zeros(y,z);
power=-100*ones(y,z);

for t=1:y
distance(t,1)=t;   %time column of distance matrix
power(t,1)=t;   %time column of power matrix
end

for j=1:n
p=1+(((j-1)*(60/N))*60);
q=p+train_time-1;
distance(p:q,(j+1))=D;
power(p:q,(j+1))=P;
end

TSS=TSS*10^3;   %distance of TSS in meters
N_TSS=length(TSS);  %no. of TSS
l_a=2*N_TSS+1;
d(1)=0; %starting point
d(2:2:l_a)=TSS;
for h=2:2:(l_a-3)
u=d(h);
v=d(h+2);
w=(v-u)/2;
d(h+1)=d(h)+w;
end
d(l_a)=d(l_a-1)+(25*10^3);   %ending point i.e. last SP is assumed to be roughly at 25km away from the last TSS.
%distance (in meter) of all the TSSs and the section posts measured from Mumbai i.e. [0 TSS1 SP1 TSS2 SP2..........TSSn SPn].
%It is assumed that in the middle of two consecutive TSSs, one SP is located.

>>>>>>> a6b21b859934a8cd5093e7439821c631fce9c22b
AT=AT*10^3;   %distance of ATs in meters