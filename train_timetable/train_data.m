% Then, convert them back to numeric arrays after all necessary processing
M = cell2mat(M);
g = cell2mat(g);
delt = cell2mat(delt);
eff = cell2mat(eff);
m_decl = cell2mat(m_decl);
a = cell2mat(a);
b = cell2mat(b);
c = cell2mat(c);

% Train data
% M = 826;           % train mass in Ton
% g = 9.81;          % gravitational acceleration
% delt = 1;          % simulation time step (sec)
% eff = 0.85;        % efficiency of train
% m_decl = 0.53;     % maximum deceleration (m/sec^2)
BF_max = M*m_decl; % maximum possible braking force

% train resistance co-efficients for E5 train
% a = 3.01;
% b = 0.0979;
% c = 0.000938;