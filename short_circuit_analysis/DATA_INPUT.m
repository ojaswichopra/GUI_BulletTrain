%;

% Za= input('Enter the primary winding leakage impedance for T winding'); %% primary winding leakage impedance for T winding (Za)%%
Za = Rp+Xp*i;
% Zb= input('Enter the primary winding leakage impedance for M winding Zb'); %%enter the primary winding leakage impedance for M winding Zb%%
Zb = (Rp+Xp*i)/2;
Zc = (Rp+Xp*i)/2;
%Zc=input('Enter the primary winding leakage impedance for M winding Zc'); %%enter the primary winding leakage impedance for M winding Zc%%
%Zs1= input('Enter the Secondary winding leakage impedance for T winding Zs1');%%Enter the Secondary winding leakage impedance for T winding Zs1%%
Zs1 = Rs+Xs*i;
% Zs2= input('Enter the Secondary winding leakage impedance for M winding Zs2');%%Enter the Secondary winding leakage impedance for T winding Zs2%%
Zs2 = Rs+Xs*i;
Zn=1; %% grounding impedence%%
% N1 = input('Enter the no of turn in primary of M winding');
% N2 = input('Enter the no of turn in secondary of M winding');
%%Formation of system busdata%%
N = max(busdata(:, 1)); %% N is the no of bus or the no of nodes %%
for n = 1:1:N
    bus_type(n) = busdata(n, 2);
    bus_power(n)=busdata(n,3);
    bus_pf(n)=busdata(n,4);
end
%%% for Main winding%%%%
N_M = max(busdataM(:, 1)); %% N is the no of bus or the no of nodes %%
for n = 1:1:N_M
    bus_type_M(n) = busdataM(n, 2);
    bus_power_M(n)=busdataM(n,3);
    bus_pf_M(n)=busdataM(n,4);
end

%% getting the value of linedata for teasear side%%
NBranch = length(linedata(:, 1)); %% N is the no of branch connected%%
for Nb = 1:1:NBranch
    line_start_bus(Nb) = linedata(Nb, 1);
    line_end_bus(Nb) = linedata(Nb, 2);
    line_length(Nb) = linedata(Nb, 4);
    line_type(Nb) = linedata(Nb, 3);
end

%% getting the value of linedata for main side%%
NBranch_M = length(linedataM(:, 1)); %% N is the no of branch connected%%
for Nb = 1:1:NBranch_M
    line_start_bus_M(Nb) = linedataM(Nb, 1);
    line_end_bus_M(Nb) = linedataM(Nb, 2);
    line_length_M(Nb) = linedataM(Nb, 4);
    line_type_M(Nb) = linedataM(Nb, 3);
end