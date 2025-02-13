% clear all
%clc

% Representative DATA file for HSR
%
% SCOTT Transformer data
Vp = 132;  % primary voltage (KV)
Vs = 27.5;   % secondary voltage (KV)
% Vs = 29.0;
Rp = 0.1;  % primary side resistance (ohm)
% Rp = 2.167; 
% Rp = 0.01;
% Xp = .05;  % primary side reactance (ohm)
% Xp = 21.67;
Xp = .125;
% Rs = 0.05;  % secondary side resistance (ohm)
% Rs = 0.376;
Rs = 0.06;
% Xs = 0.1;  % secondary side reactance (ohm)
% Xs = 3.76;
Xs = 2.7722;
Zn=1;       %grounding impedence (ohm)
% AUTOTRANSFORMER DATA
zg = 0.1564 + 0.0997i;         % leakage impedance\
% zg = 0 + 0.45i;
zm = (101.4 + 279.1i)*10000;    % magetising impedance
short_ckt_MVA = 5000; % TSS (source side) short circuit MVA

% busdata FORMAT: bus_no, type (1 = TSS, 2 = train, 3 = AT), P_load (MW), power
% factor
% busdata = [...
% 1    1      0    0;
% 2    2    1.0  0.8;
% 3    3    0.0  0.0;
% 4    2    2.0  0.8;
% 5    3    0.0  0.0;
% 6    2    3.0  0.8];
% 
% busdataM = [...
% 1    1      0    0;
% 2    2    1.0  0.8;
% 3    3    0.0  0.0;
% 4    2    2.0  0.8;
% 5    3    0.0  0.0;
% 6    2    3.0  0.8];
% 
% % Linedata FORMAT: from_bus, to_bus, impedance matrix code, line length (Km)
% %
% % if the impedance matrix code = 1, then the series impedance between two
% % nodes is = z1*line length. Similarly, if the impedance matrix code = 2, 
% % then the series impedance between two nodes is = z2*line length and so
% % on.
% %  
% linedata = [...
% 1    2    1   10;
% 2    3    1   7;
% 3    4    1   20;
% 4    5    1   5;
% 5    6    1   18];
% 
% linedataM = [...
% 1    2    1   10;
% 2    3    1   7;
% 3    4    1   20;
% 4    5    1   5;
% 5    6    1   18];



%% inserting the data for OHE PARAMETER Calculation %%
row=100;                %% homogenous earth conducting resistsivity
f=50;                   %% frequency
w=2*pi*f;               %% omega-2*pi*f
Ga= 1.435; %% gauge %
Ch= 5.0; %% contact height%%
Mh= 6.5; %%messenger wire height%%
nFh=8.7; %% negative feeder height%%
nFd=3.9175; %% DISTANCE OF  negative feeder from centre %%
gh=6.0; %% ground height%%
gd= 3.2675; %% ground wire distace from centre%%
n1=5; %%no of points (catenary, rail1, rail2, feeder, masenger, earth)


%%  inserting wire parameter %%
rad_C= 15.49/(2*1000); %% radius of catenary wire
Resistance_C=0.1451;  %% resistance of catenary wire per km

rad_M1=17.5/(2*1000);  %% radius of masenger wire
Resistance_M1=0.794;  %% resistance of masenger  wire per km

rad_G=16.3/(2*1000);  %% radius of Earth/ground wire
Resistance_G=0.2143;  %% resistance of earth/ground wire per km

rad_F=23.4/(2*1000);  %% radius of feeder wire
Resistance_F=0.056;  %% resistance of feeder wire per km

rad_R1=146/(2*1000);  %% radius of Rail wire
Resistance_R1=0.0240;  %% resistance of Rail 1 wire per km

rad_R2=146/(2*1000);  %% radius of Rail wire
Resistance_R2=0.0240;  %% resistance of Rail 2 wire per km

%% prameter insert in matrix format %%  the parameter are taken in the format of X- cordinate, y co-ordinate, self radius, resistance
para=[0 Ch rad_C Resistance_C;
    (0) 0 rad_R1 Resistance_R1;
    (-nFd) nFh rad_F Resistance_F;
    0 Mh rad_M1 Resistance_M1;
    -gd gh rad_G Resistance_G];
n1=length(para); % defines the no of conductor (catenary, rail, feeder, masanger wire, ground wire)
% Series impedance matrix Z in ohm per km
% z1 = [0.1192+0.7522i  0.0574+0.3877i  0.0568+0.3953i;
%       0.0574+0.3877i  0.1648+0.6709i  0.0571+0.3410i;
%       0.0568+0.3953i  0.0571+0.3410i  0.2036+0.8847i];

