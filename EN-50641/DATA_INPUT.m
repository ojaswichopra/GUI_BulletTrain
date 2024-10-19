
%%Formation of system busdata%%
if (line_data_T_emp~=1)
N = max(busdata(:, 1)); %% N is the no of bus or the no of nodes %%
for n = 1:1:N
    bus_type(n) = busdata(n, 2);
    bus_power(n)=busdata(n,3);
    bus_pf(n)=busdata(n,4);
end
end
%%% for Main winding%%%%
if (line_data_M_emp~=1)
    N_M = max(busdataM(:, 1)); %% N is the no of bus or the no of nodes %%
    for n = 1:1:N_M
        bus_type_M(n) = busdataM(n, 2);
        bus_power_M(n)=busdataM(n,3);
        bus_pf_M(n)=busdataM(n,4);
    end
end
%% getting the value of linedata for teasear side%%
if (line_data_T_emp~=1)
NBranch = length(linedata(:, 1)); %% N is the no of branch connected%%
for Nb = 1:1:NBranch
    line_start_bus(Nb) = linedata(Nb, 1);
    line_end_bus(Nb) = linedata(Nb, 2);
    line_length(Nb) = linedata(Nb, 4);
    line_type(Nb) = linedata(Nb, 3);
end
end
%% getting the value of linedata for main side%%
if (line_data_M_emp~=1)
    NBranch_M = length(linedataM(:, 1)); %% N is the no of branch connected%%
    for Nb = 1:1:NBranch_M
        line_start_bus_M(Nb) = linedataM(Nb, 1);
        line_end_bus_M(Nb) = linedataM(Nb, 2);
        line_length_M(Nb) = linedataM(Nb, 4);
        line_type_M(Nb) = linedataM(Nb, 3);
    end
end
