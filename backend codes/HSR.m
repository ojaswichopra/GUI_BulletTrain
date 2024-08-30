
% Representative DATA file for HSR
%
% SCOTT Transformer data
% Vp = 132;  % primary voltage (KV)
% Vs = 27.5;   % secondary voltage (KV)
% Rp = 0.1;  % primary side resistance (ohm)
% Xp = 0.05;  % primary side reactance (ohm)
% Rs = 0.05;  % secondary side resistance (ohm)
% Xs = 0.1;  % secondary side reactance (ohm)
% Zn=1;       %grounding impedence (ohm)
% short_ckt_MVA = 5000; % TSS (source side) short circuit MVA

% % AUTOTRANSFORMER DATA
% zg = 0.1564 + 0.0997i;    % leakage impedance
% zm = 101400 + 279100i;    % magetising impedance

% % inserting the data for OHE PARAMETER Calculation 
% row = 100;               % homogenous earth conducting resistivity
% f = 50;                  % frequency
% w = 2 * pi * f;          % omega-2*pi*f
% n1 = 5;                  % no of conductors (contact, rail, feeder, messenger, earth)
% Ch = 5.0;                % contact wire height (m) measured from rail
% Mh = 6.5;                % messenger wire height (m) measured from rail
% nFh = 8.7;               % feeder wire height (m) measured from rail
% nFd = 3.9175;            % feeder wire distance (m) measured from centre (rail)
% gh = 6;                  % earth (ground) wire height (m) measured from rail
% gd = 3.2675;             % earth (ground) wire distance (m) measured from centre (rail)

% % Inserting wire parameter 
% rad_C = 15.49 / (2 * 1000);    % radius (m) of contact wire
% Resistance_C = 0.1451;         % resistance of contact wire (ohm per km)

% rad_M1 = 17.5 / (2 * 1000);    % radius (m) of messenger wire
% Resistance_M1 = 0.794;         % resistance of messenger wire (ohm per km)

% rad_G = 16.3 / (2 * 1000);     % radius (m) of Earth/ground wire
% Resistance_G = 0.2143;         % resistance of Earth/ground wire (ohm per km)

% rad_F = 23.4 / (2 * 1000);     % radius (m) of feeder wire
% Resistance_F = 0.056;          % resistance of feeder wire (ohm per km)

% rad_R1 = 146 / (2 * 1000);     % radius (m) of Rail 1
% Resistance_R1 = 0.024;         % resistance of Rail 1 (ohm per km)

% prameter insert in matrix format (the parameter are taken in the format
% of X- cordinate, y co-ordinate, self radius, resistance)
para=[0 Ch rad_C Resistance_C;
    (0) 0 rad_R1 Resistance_R1;
    (-nFd) nFh rad_F Resistance_F;
    0 Mh rad_M1 Resistance_M1;
    -gd gh rad_G Resistance_G];
